class ExpressionDescriptor {
    private let expression: String
    private let options: Options
    private let i18n: any CronLocale
    private var parts: [String] = [] // [minute, hour, dom, month, dow]
    private var use24Hour: Bool

    init(expression: String, options: Options) {
        self.expression = expression
        self.options = options
        self.i18n = options.locale
        self.use24Hour = options.use24HourTimeFormat ?? options.locale.use24HourTimeFormatByDefault()
    }

    func getFullDescription() throws -> String {
        let parser = CronParser(expression, dayOfWeekStartIndexZero: options.dayOfWeekStartIndexZero, monthStartIndexZero: options.monthStartIndexZero)
        parts = try parser.parse()

        if parts[1] == "@reboot" {
            return i18n.atReboot()
        }

        let seconds = getSecondsDescription()
        let time = getTimeOfDayDescription()
        let dom = getDayOfMonthDescription()
        let month = getMonthDescription()
        let dow = getDayOfWeekDescription()

        var description: String
        if seconds.isEmpty {
            description = time + dom + dow + month
        } else {
            description = seconds
            if !time.isEmpty { description += ", " + time }
            description += dom + dow + month
        }
        description = transformVerbosity(description)

        while description.hasSuffix(", ") {
            description = String(description.dropLast(2))
        }

        let first = description.prefix(1).uppercased()
        return first + description.dropFirst()
    }

    // MARK: - Time of day

    private func getTimeOfDayDescription() -> String {
        let minute = parts[1]
        let hour = parts[2]
        let specialChars: Set<Character> = ["/", "-", ",", "*"]

        let minuteIsPlain = !minute.contains(where: { specialChars.contains($0) })
        let hourIsPlain = !hour.contains(where: { specialChars.contains($0) })

        if minuteIsPlain && hourIsPlain {
            return i18n.atSpace() + formatTime(hour, minute)
        }

        if minute == "*" && hour.contains("-") && !hour.contains(",") && !hour.contains("/") {
            let ps = hour.split(separator: "-", maxSplits: 1).map(String.init)
            let start = formatTime(ps[0], "0")
            let end = formatTime(ps[1], "59")
            return i18n.everyMinute() + ", " + applyFormat(i18n.betweenXAndX(), start, end)
        }

        if minute == "*" && hourIsPlain {
            let start = formatTime(hour, "0")
            let end = formatTime(hour, "59")
            return i18n.everyMinute() + ", " + applyFormat(i18n.betweenXAndX(), start, end)
        }

        if minute.contains("-") && !minute.contains(",") && !minute.contains("/") && hourIsPlain {
            let ps = minute.split(separator: "-").map(String.init)
            return i18n.everyMinuteBetweenXAndX(
                formatTime(hour, ps[0]),
                formatTime(hour, ps[1])
            )
        }

        if hour.contains(",") && !hour.contains("-") && !hour.contains("/") && minuteIsPlain {
            let hours = hour.split(separator: ",").map(String.init)
            var desc = i18n.at()
            for (idx, h) in hours.enumerated() {
                desc += " " + formatTime(h, minute)
                if idx < hours.count - 2 { desc += "," }
                if idx == hours.count - 2 { desc += i18n.spaceAnd() }
            }
            return desc
        }

        let minutesDesc = getMinutesDescription()
        let hoursDesc = getHoursDescription()

        if minutesDesc == hoursDesc { return minutesDesc }

        var desc = minutesDesc
        if !desc.isEmpty && !hoursDesc.isEmpty { desc += ", " }
        desc += hoursDesc
        return desc
    }

    // MARK: - Field descriptions

    private func getSecondsDescription() -> String {
        guard !parts[0].isEmpty else { return "" }
        return getSegmentDescription(
            expression: parts[0],
            allDescription: i18n.everySecond(),
            getSingleItemDescription: { s in s },
            getIncrementDescriptionFormat: { s in self.i18n.everyXSeconds(s) },
            getRangeDescriptionFormat: { _ in self.i18n.secondsXThroughXPastTheMinute() },
            getDescriptionFormat: { s in
                s == "0" ? "" : self.i18n.atXSecondsPastTheMinute()
            }
        )
    }

    private func getMinutesDescription() -> String {
        let hour = parts[2]
        let seconds = parts[0]
        return getSegmentDescription(
            expression: parts[1],
            allDescription: i18n.everyMinute(),
            getSingleItemDescription: { s in s },
            getIncrementDescriptionFormat: { s in self.i18n.everyXMinutes(s) },
            getRangeDescriptionFormat: { _ in self.i18n.minutesXThroughXPastTheHour() },
            getDescriptionFormat: { s in
                if s == "0" && seconds.isEmpty && !hour.contains("/") {
                    return self.i18n.everyHour()
                }
                if s == "0" && seconds.isEmpty {
                    return self.i18n.onTheHour()
                }
                return self.i18n.atXMinutesPastTheHour()
            }
        )
    }

    private func getHoursDescription() -> String {
        let minute = parts[1]
        let expandEnd = minute == "*" || minute.contains("59")

        let hourFormatter: (String) -> String = { s in self.formatTime(s, "0") }
        let endFormatter: (String) -> String = { s in self.formatTime(s, expandEnd ? "59" : "0") }

        return getSegmentDescription(
            expression: parts[2],
            allDescription: i18n.everyHour(),
            getSingleItemDescription: hourFormatter,
            getIncrementDescriptionFormat: { s in self.i18n.everyXHours(s) },
            getRangeDescriptionFormat: { _ in self.i18n.betweenXAndX() },
            getDescriptionFormat: { _ in self.i18n.atX() },
            getSecondItemDescription: endFormatter
        )
    }

    private func getDayOfMonthDescription() -> String {
        let dom = parts[3]
        if dom == "*" && parts[5] != "*" { return "" }

        switch dom {
        case "L":
            return i18n.commaOnTheLastDayOfTheMonth()
        case "LW", "WL":
            return i18n.commaOnTheLastWeekdayOfTheMonth()
        default:
            if dom.hasPrefix("L-"), let offset = Int(dom.dropFirst(2)) {
                return applyFormat(i18n.commaDaysBeforeTheLastDayOfTheMonth(), String(offset))
            }
            if dom.contains("W") {
                let dayStr = dom.replacing("W", with: "")
                if let n = Int(dayStr) {
                    let nearest = n == 1
                        ? i18n.firstWeekday()
                        : applyFormat(i18n.weekdayNearestDayX(), String(n))
                    return applyFormat(i18n.commaOnTheX0OfTheMonth(), nearest)
                }
            }
        }

        let sortedDom: String
        if dom.contains(",") && !dom.contains("/") && !dom.contains("-") {
            let segs = dom.split(separator: ",").map(String.init)
            let numeric = segs.filter { Int($0) != nil }.sorted { Int($0)! < Int($1)! }
            let nonNumeric = segs.filter { Int($0) == nil }
            sortedDom = (numeric + nonNumeric).joined(separator: ",")
        } else {
            sortedDom = dom
        }

        return getSegmentDescription(
            expression: sortedDom,
            allDescription: i18n.commaEveryDay(),
            getSingleItemDescription: { s in s == "L" ? self.i18n.lastDay() : s },
            getIncrementDescriptionFormat: { s in self.i18n.commaEveryXDays(s) },
            getRangeDescriptionFormat: { _ in self.i18n.commaBetweenDayXAndXOfTheMonth() },
            getDescriptionFormat: { _ in self.i18n.commaOnDayXOfTheMonth() }
        )
    }

    private func getMonthDescription() -> String {
        let months = i18n.monthsOfTheYear()
        return getSegmentDescription(
            expression: parts[4],
            allDescription: "",
            getSingleItemDescription: { s in
                if let n = Int(s), (1 ... 12).contains(n) { return months[n - 1] }
                return s
            },
            getIncrementDescriptionFormat: { s in self.i18n.commaEveryXMonths(s) },
            getRangeDescriptionFormat: { _ in self.i18n.commaMonthXThroughMonthX() },
            getDescriptionFormat: { _ in self.i18n.commaOnlyInX() }
        )
    }

    private func getDayOfWeekDescription() -> String {
        if parts[5] == "*" { return "" }
        let days = i18n.daysOfTheWeek()
        let domSpecified = parts[3] != "*"

        let dowExpression: String
        if parts[5].contains(",") && !parts[5].contains("/") && !parts[5].contains("-") {
            let segs = parts[5].split(separator: ",").map(String.init)
            let hasSeven = segs.contains(where: { extractNumericPrefix($0) == 7 })
            if hasSeven {
                dowExpression = segs.sorted { dowSortKey($0) < dowSortKey($1) }.joined(separator: ",")
            } else {
                dowExpression = parts[5]
            }
        } else {
            dowExpression = parts[5]
        }

        return getSegmentDescription(
            expression: dowExpression,
            allDescription: i18n.commaEveryDay(),
            getSingleItemDescription: { s in
                var exp = s
                if let hashIdx = s.firstIndex(of: "#") {
                    exp = String(s[..<hashIdx])
                } else if s.contains("L") {
                    exp = s.replacing("L", with: "")
                }
                if let n = Int(exp) {
                    if !options.dayOfWeekStartIndexZero && n == 7 { return days[6] }
                    return days[n % 7]
                }
                return exp
            },
            getIncrementDescriptionFormat: { s in self.i18n.commaEveryXDaysOfTheWeek(s) },
            getRangeDescriptionFormat: { _ in domSpecified ? self.i18n.commaAndXThroughX() : self.i18n.commaXThroughX() },
            getDescriptionFormat: { s in
                if s.contains("#") {
                    guard let hashIdx = s.firstIndex(of: "#") else { return self.i18n.commaOnlyOnX() }
                    let occurrence = String(s[s.index(after: hashIdx)...])
                    let ordinal: String
                    switch occurrence {
                    case "1": ordinal = self.i18n.first()
                    case "2": ordinal = self.i18n.second()
                    case "3": ordinal = self.i18n.third()
                    case "4": ordinal = self.i18n.fourth()
                    case "5": ordinal = self.i18n.fifth()
                    default:  ordinal = occurrence
                    }
                    return self.i18n.commaOnThe() + ordinal + " %s" + self.i18n.spaceX0OfTheMonth()
                } else if s.contains("L") {
                    return self.i18n.commaOnTheLastX0OfTheMonth()
                } else {
                    return domSpecified ? self.i18n.commaAndOnX() : self.i18n.commaOnlyOnX()
                }
            }
        )
    }

    // MARK: - Core segment engine

    private func getSegmentDescription(
        expression: String,
        allDescription: String,
        getSingleItemDescription: (String) -> String,
        getIncrementDescriptionFormat: (String) -> String,
        getRangeDescriptionFormat: (String) -> String,
        getDescriptionFormat: (String) -> String,
        getSecondItemDescription: ((String) -> String)? = nil
    ) -> String {
        if expression.isEmpty { return "" }
        if expression == "*" { return allDescription }

        let hasIncrement = expression.contains("/")
        let hasRange = expression.contains("-")
        let hasMultiple = expression.contains(",")

        if !hasIncrement && !hasRange && !hasMultiple {
            let item = getSingleItemDescription(expression)
            return applyFormat(getDescriptionFormat(expression), item)
        }

        if hasMultiple {
            let segments = expression.split(separator: ",").map(String.init)
            var content = ""
            for (i, seg) in segments.enumerated() {
                if i > 0 && segments.count > 2 {
                    content += ","
                    if i < segments.count - 1 { content += " " }
                }
                if i > 0 && (i == segments.count - 1 || segments.count == 2) {
                    content += "\(i18n.spaceAnd()) "
                }

                let segHasRange = seg.contains("-")
                let segHasIncrement = seg.contains("/")

                if segHasRange || segHasIncrement {
                    let rangeFormat = segHasRange && !segHasIncrement
                        ? i18n.commaXThroughX()
                        : getRangeDescriptionFormat(seg)
                    var segDesc = getSegmentDescription(
                        expression: seg,
                        allDescription: allDescription,
                        getSingleItemDescription: getSingleItemDescription,
                        getIncrementDescriptionFormat: getIncrementDescriptionFormat,
                        getRangeDescriptionFormat: { _ in rangeFormat },
                        getDescriptionFormat: getDescriptionFormat,
                        getSecondItemDescription: getSecondItemDescription
                    )
                    if segHasRange && !segHasIncrement {
                        // Strip the leading ", " that commaXThroughX adds
                        if segDesc.hasPrefix(", ") { segDesc = String(segDesc.dropFirst(2)) }
                    }
                    content += segDesc
                } else if !hasIncrement {
                    content += getSingleItemDescription(seg)
                } else {
                    var segDesc = getSegmentDescription(
                        expression: seg,
                        allDescription: allDescription,
                        getSingleItemDescription: getSingleItemDescription,
                        getIncrementDescriptionFormat: getIncrementDescriptionFormat,
                        getRangeDescriptionFormat: getRangeDescriptionFormat,
                        getDescriptionFormat: getDescriptionFormat,
                        getSecondItemDescription: getSecondItemDescription
                    )
                    if segDesc.hasPrefix(", ") { segDesc = String(segDesc.dropFirst(2)) }
                    content += segDesc
                }
            }
            if !hasIncrement {
                return applyFormat(getDescriptionFormat(expression), content)
            }
            return content
        }

        if hasIncrement {
            let segs = expression.split(separator: "/", maxSplits: 1, omittingEmptySubsequences: false).map(String.init)
            let step = segs[1]
            var desc = getIncrementDescriptionFormat(step)

            if segs[0].contains("-") {
                let rangeDesc = generateRangeSegmentDescription(
                    segs[0],
                    getRangeDescriptionFormat: getRangeDescriptionFormat,
                    getSingleItemDescription: getSingleItemDescription,
                    getSecondItemDescription: getSecondItemDescription
                )
                if !rangeDesc.hasPrefix(", ") { desc += ", " }
                desc += rangeDesc
            } else if segs[0] != "*" && !segs[0].isEmpty {
                var startDesc = applyFormat(getDescriptionFormat(segs[0]), getSingleItemDescription(segs[0]))
                startDesc = startDesc.replacing(", ", with: "")
                desc += i18n.commaStartingX(startDesc)
            }
            return desc
        }

        return generateRangeSegmentDescription(
            expression,
            getRangeDescriptionFormat: getRangeDescriptionFormat,
            getSingleItemDescription: getSingleItemDescription,
            getSecondItemDescription: getSecondItemDescription
        )
    }

    private func generateRangeSegmentDescription(
        _ rangeExpression: String,
        getRangeDescriptionFormat: (String) -> String,
        getSingleItemDescription: (String) -> String,
        getSecondItemDescription: ((String) -> String)? = nil
    ) -> String {
        let ps = rangeExpression.split(separator: "-", maxSplits: 1).map(String.init)
        let s1 = getSingleItemDescription(ps[0])
        let s2: String
        if let endFormatter = getSecondItemDescription {
            s2 = endFormatter(ps[1])
        } else {
            s2 = getSingleItemDescription(ps[1])
        }
        return applyFormat(getRangeDescriptionFormat(rangeExpression), s1, s2)
    }

  
    private func extractNumericPrefix(_ s: String) -> Int {
        var exp = s
        if let hashIdx = s.firstIndex(of: "#") {
            exp = String(s[..<hashIdx])
        } else if s.contains("L") {
            exp = s.replacing("L", with: "")
        }
        return Int(exp) ?? Int.max
    }

    private func dowSortKey(_ s: String) -> Int {
        extractNumericPrefix(s)
    }

    // MARK: - Verbosity

    private func transformVerbosity(_ description: String) -> String {
        guard !options.verbose else { return description }
        var d = description
        d = d.replacing(", \(i18n.everyMinute())", with: "")
        d = d.replacing(", \(i18n.everyHour())", with: "")
        d = d.replacing(i18n.commaEveryDay(), with: "")
        for (pattern, replacement) in i18n.conciseVerbosityReplacements() {
            d = d.replacingPattern(pattern, with: replacement)
        }
        return d
    }

    // MARK: - Time formatting

    func formatTime(_ hourStr: String, _ minuteStr: String) -> String {
        guard var hour = Int(hourStr), let minute = Int(minuteStr) else {
            return "\(hourStr):\(minuteStr)"
        }

        let paddedMinute = zeroPadded(minute)
        let trim = options.trimHoursLeadingZero

        if use24Hour {
            let h = trim ? String(hour) : zeroPadded(hour)
            return "\(h):\(paddedMinute)"
        }

        let period = hour >= 12 ? "PM" : "AM"
        if hour > 12 { hour -= 12 }
        if hour == 0 { hour = 12 }
        let h = trim ? String(hour) : zeroPadded(hour)
        return "\(h):\(paddedMinute) \(period)"
    }

    // MARK: - Format string helper

    private func applyFormat(_ format: String, _ args: String...) -> String {
        var result = format
        for arg in args {
            result = result.replacingFirst("%s", with: arg)
        }
        return result
    }
}
