public struct EnLocale: CronLocale {
    public init() {}

    // Time — no leading comma
    public func everyMinute() -> String { "every minute" }
    public func everyHour() -> String { "every hour" }
    public func onTheHour() -> String { "on the hour" }
    public func everyXMinutes(_ n: String) -> String { "every \(n) minutes" }
    public func everyXHours(_ n: String) -> String { "every \(n) hours" }
    public func atSpace() -> String { "at " }
    public func at() -> String { "at" }
    public func spaceAnd() -> String { " and" }
    public func atX() -> String { "at %s" }
    public func atXMinutesPastTheHour() -> String { "at %s minutes past the hour" }
    public func minutesXThroughXPastTheHour() -> String { "minutes %s through %s past the hour" }
    public func betweenXAndX() -> String { "between %s and %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String {
        "every minute between \(a) and \(b)"
    }

    // Calendar — all have leading ", "
    public func commaEveryDay() -> String { ", every day" }
    public func commaEveryXDays(_ n: String) -> String {
        n == "1" ? commaEveryDay() : ", every \(n) days"
    }
    public func commaOnDayXOfTheMonth() -> String { ", on day %s of the month" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", between day %s and %s of the month" }
    public func commaOnlyOnX() -> String { ", only on %s" }
    public func commaAndOnX() -> String { ", and on %s" }
    public func commaXThroughX() -> String { ", %s through %s" }
    public func commaAndXThroughX() -> String { ", and %s through %s" }
    public func commaEveryXMonths(_ n: String) -> String {
        n == "1" ? "" : ", every \(n) months"
    }
    public func commaMonthXThroughMonthX() -> String { ", %s through %s" }
    public func commaOnlyInX() -> String { ", only in %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String {
        n == "1" ? "" : ", every \(n) days of the week"
    }
    public func commaStartingX(_ s: String) -> String { ", starting \(s)" }

    // Data
    public func daysOfTheWeek() -> [String] {
        ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    }
    public func monthsOfTheYear() -> [String] {
        ["January", "February", "March", "April", "May", "June",
         "July", "August", "September", "October", "November", "December"]
    }

    public func use24HourTimeFormatByDefault() -> Bool { false }

    public func conciseVerbosityReplacements() -> [String: String] {
        ["on the hour, ": ""]
    }
}
