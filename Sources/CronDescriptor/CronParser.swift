struct CronParser {
    private static let dowNames = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    private static let monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]

    private let expression: String
    private let dayOfWeekStartIndexZero: Bool
    private let monthStartIndexZero: Bool

    init(_ expression: String, dayOfWeekStartIndexZero: Bool = true, monthStartIndexZero: Bool = false) {
        self.expression = expression
        self.dayOfWeekStartIndexZero = dayOfWeekStartIndexZero
        self.monthStartIndexZero = monthStartIndexZero
    }

    // Returns 6-element array: [seconds, minute, hour, dom, month, dow]
    // seconds is "" for 5-field expressions
    func parse() throws -> [String] {
        let upper = expression.trimmingWhitespace().uppercased()

        // @-aliases
        switch upper {
        case "@REBOOT": return ["", "@reboot", "", "", "", ""]
        case "@YEARLY", "@ANNUALLY": return ["", "0", "0", "1", "1", "*"]
        case "@MONTHLY": return ["", "0", "0", "1", "*", "*"]
        case "@WEEKLY": return ["", "0", "0", "*", "*", "0"]
        case "@DAILY", "@MIDNIGHT": return ["", "0", "0", "*", "*", "*"]
        case "@HOURLY": return ["", "0", "*", "*", "*", "*"]
        default: break
        }

        var fields = expression.trimmingWhitespace().splitOnWhitespace()

        switch fields.count {
        case 5:
            fields.insert("", at: 0)
        case 6:
            // 6-field: last field is a 4-digit year → ignore it, treat as 5-field
            if fields[5].allSatisfy({ $0.isNumber }) && fields[5].count == 4 {
                fields.removeLast()
                fields.insert("", at: 0)
            }
            // else: first field is seconds, keep as-is
        default:
            throw CronDescriptorError.parseError("Expression must have 5 or 6 fields, found \(fields.count)")
        }

        // Normalize each field
        if !fields[0].isEmpty {
            fields[0] = normalizeStep(fields[0])
        }
        fields[1] = try normalize(fields[1], field: .minute)
        fields[2] = try normalize(fields[2], field: .hour)
        fields[3] = try normalize(fields[3], field: .dom)
        fields[4] = try normalizeMonth(fields[4])
        fields[5] = try normalizeDow(fields[5])

        // Validate ranges
        if !fields[0].isEmpty {
            try validate(fields[0], range: 0...59, field: "second")
        }
        try validate(fields[1], range: 0...59, field: "minute")
        try validate(fields[2], range: 0...23, field: "hour")
        try validate(fields[3], range: 1...31, field: "day of month")
        try validate(fields[4], range: 1...12, field: "month")
        try validate(fields[5], range: 0...6, field: "day of week")

        return fields
    }

    // MARK: - Normalization

    private enum Field { case minute, hour, dom }

    // Shared: 0/n → */n
    private func normalizeStep(_ field: String) -> String {
        field.hasPrefix("0/") ? "*/" + field.dropFirst(2) : field
    }

    private func normalize(_ field: String, field fieldType: Field) throws -> String {
        var f = field
        if f == "?" { f = "*" }
        f = normalizeStep(f)
        return f
    }

    private func normalizeMonth(_ field: String) throws -> String {
        var f = field
        if f == "?" { f = "*" }
        f = normalizeStep(f)
        var result = f.uppercased()
        for (i, name) in CronParser.monthNames.enumerated() {
            result = result.replacing(name, with: String(i + 1))
        }
        if monthStartIndexZero {
            result = shiftPositionTokens(in: result, by: 1)
        }
        return result
    }

    // Shift numeric position tokens by `offset`, skipping step values (the part after /).
    // Handles comma lists, ranges, and step expressions.
    private func shiftPositionTokens(in expression: String, by offset: Int) -> String {
        expression.split(separator: ",", omittingEmptySubsequences: false)
            .map { seg -> String in
                let s = String(seg)
                if s.contains("/") {
                    let parts = s.split(separator: "/", maxSplits: 1).map(String.init)
                    return shiftRange(parts[0], by: offset) + "/" + parts[1]
                }
                return shiftRange(s, by: offset)
            }
            .joined(separator: ",")
    }

    private func shiftRange(_ token: String, by offset: Int) -> String {
        if token.contains("-") {
            let parts = token.split(separator: "-", maxSplits: 1).map(String.init)
            return shiftSingle(parts[0], by: offset) + "-" + shiftSingle(parts[1], by: offset)
        }
        return shiftSingle(token, by: offset)
    }

    private func shiftSingle(_ token: String, by offset: Int) -> String {
        guard let n = Int(token) else { return token }
        return String(n + offset)
    }

    private func normalizeDow(_ field: String) throws -> String {
        var f = field
        if f == "?" { f = "*" }
        if f.hasPrefix("0/") { f = "*/" + f.dropFirst(2) }
        var result = f.uppercased()
        for (i, name) in CronParser.dowNames.enumerated() {
            result = result.replacing(name, with: String(i))
        }
        if dayOfWeekStartIndexZero {
            // 7 is an alias for Sunday (0)
            result = replaceTokens(in: result) { token in
                if let n = Int(token), n == 7 { return "0" }
                return token
            }
        } else {
            // User uses 1-indexed (Sun=1, Sat=7). Normalize to 0-indexed.
            result = replaceTokens(in: result) { token in
                if let n = Int(token), n >= 1 { return String(n - 1) }
                return token
            }
        }
        return result
    }

    // Replace each standalone numeric token in a cron field value using a transform.
    private func replaceTokens(in expression: String, transform: (String) -> String) -> String {
        // Split on special chars, transform numeric parts, reassemble
        var result = ""
        var current = ""
        let specials: Set<Character> = ["/", "-", ",", "*"]
        for ch in expression {
            if specials.contains(ch) {
                result += transform(current) + String(ch)
                current = ""
            } else {
                current.append(ch)
            }
        }
        result += transform(current)
        return result
    }

    // MARK: - Validation

    private func validate(_ field: String, range: ClosedRange<Int>, field fieldName: String) throws {
        if field == "*" || field.isEmpty { return }
        for segment in field.split(separator: ",").map(String.init) {
            try validateSegment(segment, range: range, field: fieldName)
        }
    }

    private func validateSegment(_ segment: String, range: ClosedRange<Int>, field: String) throws {
        if segment == "*" { return }
        // step: */n or start/n
        if segment.contains("/") {
            let parts = segment.split(separator: "/", maxSplits: 1).map(String.init)
            guard parts.count == 2, let step = Int(parts[1]), step > 0 else {
                throw CronDescriptorError.parseError("Invalid step in \(field): \(segment)")
            }
            if parts[0] != "*" {
                try validateSegment(parts[0], range: range, field: field)
            }
            return
        }
        // range: a-b
        if segment.contains("-") {
            let parts = segment.split(separator: "-", maxSplits: 1).map(String.init)
            guard parts.count == 2 else {
                throw CronDescriptorError.parseError("Invalid range in \(field): \(segment)")
            }
            try validateSingleValue(parts[0], range: range, field: field)
            try validateSingleValue(parts[1], range: range, field: field)
            return
        }
        try validateSingleValue(segment, range: range, field: field)
    }

    private func validateSingleValue(_ value: String, range: ClosedRange<Int>, field: String) throws {
        guard let n = Int(value) else {
            throw CronDescriptorError.parseError("Non-numeric value '\(value)' in \(field)")
        }
        guard range.contains(n) else {
            throw CronDescriptorError.parseError("Value \(n) out of range \(range.lowerBound)-\(range.upperBound) for \(field)")
        }
    }
}
