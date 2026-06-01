public struct DaLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Der opstod en fejl ved generering af udtryksbeskrivelsen. Tjek cron-ekspressionssyntaxen." }

    public func everyMinute() -> String { "hvert minut" }
    public func everyHour() -> String { "hver time" }
    public func onTheHour() -> String { "på timen" }
    public func everyXMinutes(_ n: String) -> String { "hvert \(n). minut" }
    public func everyXHours(_ n: String) -> String { "hver \(n). time" }
    public func atSpace() -> String { "kl " }
    public func at() -> String { "kl" }
    public func spaceAnd() -> String { " og" }
    public func atX() -> String { "kl %s" }
    public func atXMinutesPastTheHour() -> String { "%s minutter efter timeskift" }
    public func minutesXThroughXPastTheHour() -> String { "minutterne fra %s til og med %s hver time" }
    public func betweenXAndX() -> String { "mellem %s og %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "hvert minut mellem \(a) og \(b)" }

    public func commaEveryDay() -> String { ", hver dag" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", hver \(n). dag" }
    public func commaOnDayXOfTheMonth() -> String { ", på dag %s i måneden" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", mellem dag %s og %s i måneden" }
    public func commaOnlyOnX() -> String { ", på enhver %s" }
    public func commaAndOnX() -> String { ", og på %s" }
    public func commaXThroughX() -> String { ", %s til og med %s" }
    public func commaAndXThroughX() -> String { ", og %s til og med %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", hver \(n). måned" }
    public func commaMonthXThroughMonthX() -> String { ", %s til og med %s" }
    public func commaOnlyInX() -> String { ", kun i %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", hver \(n). ugedag" }
    public func commaStartingX(_ s: String) -> String { ", startende \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", på den sidste dag i måneden" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", på den sidste hverdag i måneden" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dage før den sidste dag i måneden" }
    public func lastDay() -> String { "sidste dag" }
    public func firstWeekday() -> String { "første hverdag" }
    public func weekdayNearestDayX() -> String { "hverdag nærmest dag %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", på den %s i måneden" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", på den sidste %s i måneden" }
    public func commaOnThe() -> String { ", på den " }
    public func spaceX0OfTheMonth() -> String { " %s i måneden" }
    public func first() -> String { "første" }
    public func second() -> String { "anden" }
    public func third() -> String { "tredje" }
    public func fourth() -> String { "fjerde" }
    public func fifth() -> String { "femte" }

    public func everySecond() -> String { "hvert sekund" }
    public func everyXSeconds(_ n: String) -> String { "hvert \(n). sekund" }
    public func secondsXThroughXPastTheMinute() -> String { "sekunderne fra %s til og med %s hvert minut" }
    public func atXSecondsPastTheMinute() -> String { "%s sekunder efter minutskift" }

    public func daysOfTheWeek() -> [String] {
        ["søndag", "mandag", "tirsdag", "onsdag", "torsdag", "fredag", "lørdag"]
    }
    public func monthsOfTheYear() -> [String] {
        ["januar", "februar", "marts", "april", "maj", "juni",
         "juli", "august", "september", "oktober", "november", "december"]
    }
}
