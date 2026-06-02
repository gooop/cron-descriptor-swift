// Methods starting with "comma" return strings with a leading ", " — they are appended
// after the time-of-day segment. Time-of-day methods (betweenXAndX, atX, etc.) have no
// leading comma because getTimeOfDayDescription inserts its own separators.
public protocol CronLocale {
    // Time — no leading comma
    func everyMinute() -> String
    func everyHour() -> String
    func onTheHour() -> String
    func everyXMinutes(_ n: String) -> String
    func everyXHours(_ n: String) -> String
    func atSpace() -> String
    func at() -> String
    func spaceAnd() -> String
    func atX() -> String // format template: "at %s"
    func atXMinutesPastTheHour() -> String // format template: "at %s minutes past the hour"
    func minutesXThroughXPastTheHour() -> String // format template: "minutes %s through %s past the hour"
    func betweenXAndX() -> String // format template: "between %s and %s"
    func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String // fully formatted

    // Calendar — all have a leading ", "
    func commaEveryDay() -> String
    func commaEveryXDays(_ n: String) -> String
    func commaOnDayXOfTheMonth() -> String // ", on day %s of the month"
    func commaBetweenDayXAndXOfTheMonth() -> String // ", between day %s and %s of the month"
    func commaOnlyOnX() -> String // ", only on %s"
    func commaAndOnX() -> String // ", and on %s"
    func commaXThroughX() -> String // ", %s through %s"
    func commaAndXThroughX() -> String // ", and %s through %s"
    func commaEveryXMonths(_ n: String) -> String
    func commaMonthXThroughMonthX() -> String // ", %s through %s"
    func commaOnlyInX() -> String // ", only in %s"
    func commaEveryXDaysOfTheWeek(_ n: String) -> String
    func commaStartingX(_ s: String) -> String

    // Data
    func daysOfTheWeek() -> [String]
    func monthsOfTheYear() -> [String]

    // Config
    func use24HourTimeFormatByDefault() -> Bool

    // Verbosity post-processing
    func conciseVerbosityReplacements() -> [String: String]

    // Seconds
    func everySecond() -> String
    func everyXSeconds(_ n: String) -> String
    func secondsXThroughXPastTheMinute() -> String
    func atXSecondsPastTheMinute() -> String

    // L/W/# modifiers
    func commaOnTheLastDayOfTheMonth() -> String
    func commaOnTheLastWeekdayOfTheMonth() -> String
    func commaDaysBeforeTheLastDayOfTheMonth() -> String // format: "%s days before..."
    func lastDay() -> String
    func firstWeekday() -> String
    func weekdayNearestDayX() -> String // format: "the weekday nearest day %s"
    func commaOnTheX0OfTheMonth() -> String // format: ", on the %s of the month"
    func commaOnTheLastX0OfTheMonth() -> String // format: ", on the last %s of the month"
    func commaOnThe() -> String // prefix: ", on the "
    func spaceX0OfTheMonth() -> String // suffix: " of the month"
    func first() -> String
    func second() -> String
    func third() -> String
    func fourth() -> String
    func fifth() -> String

    // Special
    func atReboot() -> String
    func anErrorOccurred() -> String
}

public extension CronLocale {
    func conciseVerbosityReplacements() -> [String: String] { [:] }
    func atReboot() -> String { "Run once, at startup" }
    func anErrorOccurred() -> String {
        "An error occurred when generating the expression description. Check the cron expression syntax."
    }
    func everySecond() -> String { "every second" }
    func everyXSeconds(_ n: String) -> String { "every \(n) seconds" }
    func secondsXThroughXPastTheMinute() -> String { "seconds %s through %s past the minute" }
    func atXSecondsPastTheMinute() -> String { "at %s seconds past the minute" }
    func commaOnTheLastDayOfTheMonth() -> String { ", on the last day of the month" }
    func commaOnTheLastWeekdayOfTheMonth() -> String { ", on the last weekday of the month" }
    func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s days before the last day of the month" }
    func lastDay() -> String { "the last day" }
    func firstWeekday() -> String { "the first weekday" }
    func weekdayNearestDayX() -> String { "the weekday nearest day %s" }
    func commaOnTheX0OfTheMonth() -> String { ", on %s of the month" }
    func commaOnTheLastX0OfTheMonth() -> String { ", on the last %s of the month" }
    func commaOnThe() -> String { ", on the " }
    func spaceX0OfTheMonth() -> String { " of the month" }
    func first() -> String { "first" }
    func second() -> String { "second" }
    func third() -> String { "third" }
    func fourth() -> String { "fourth" }
    func fifth() -> String { "fifth" }
}
