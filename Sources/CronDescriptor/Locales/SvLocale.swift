public struct SvLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Ett fel inträffade vid generering av uttryckets beskrivning. Kontrollera cron-uttryckets syntax." }

    public func everyMinute() -> String { "varje minut" }
    public func everyHour() -> String { "varje timme" }
    public func onTheHour() -> String { "på heltimmen" }
    public func everyXMinutes(_ n: String) -> String { "var \(n) minut" }
    public func everyXHours(_ n: String) -> String { "var \(n) timme" }
    public func atSpace() -> String { "Kl " }
    public func at() -> String { "Kl" }
    public func spaceAnd() -> String { " och" }
    public func atX() -> String { "kl %s" }
    public func atXMinutesPastTheHour() -> String { "på %s minuten efter timmen" }
    public func minutesXThroughXPastTheHour() -> String { "minuterna från %s till och med %s efter timmen" }
    public func betweenXAndX() -> String { "mellan %s och %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Varje minut mellan \(a) och \(b)" }

    public func commaEveryDay() -> String { ", varje dag" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", var \(n) dag" }
    public func commaOnDayXOfTheMonth() -> String { ", på dag %s av månaden" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", mellan dag %s och %s av månaden" }
    public func commaOnlyOnX() -> String { ", varje %s" }
    public func commaAndOnX() -> String { ", och på %s" }
    public func commaXThroughX() -> String { ", %s till %s" }
    public func commaAndXThroughX() -> String { ", och %s till %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", var \(n) månad" }
    public func commaMonthXThroughMonthX() -> String { ", %s till %s" }
    public func commaOnlyInX() -> String { ", bara på %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", var \(n) dag i veckan" }
    public func commaStartingX(_ s: String) -> String { ", startar \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", på sista dagen av månaden" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", på sista veckodag av månaden" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dagar före den sista dagen i månaden" }
    public func lastDay() -> String { "den sista dagen" }
    public func firstWeekday() -> String { "första veckodag" }
    public func weekdayNearestDayX() -> String { "veckodagen närmast dag %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", på den %s av månaden" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", på sista %s av månaden" }
    public func commaOnThe() -> String { ", den " }
    public func spaceX0OfTheMonth() -> String { " %sen av månaden" }
    public func first() -> String { "första" }
    public func second() -> String { "andra" }
    public func third() -> String { "tredje" }
    public func fourth() -> String { "fjärde" }
    public func fifth() -> String { "femte" }

    public func everySecond() -> String { "varje sekund" }
    public func everyXSeconds(_ n: String) -> String { "varje \(n) sekund" }
    public func secondsXThroughXPastTheMinute() -> String { "sekunderna från %s till och med %s efter minuten" }
    public func atXSecondsPastTheMinute() -> String { "på %s sekunder efter minuten" }

    public func daysOfTheWeek() -> [String] {
        ["söndag", "måndag", "tisdag", "onsdag", "torsdag", "fredag", "lördag"]
    }
    public func monthsOfTheYear() -> [String] {
        ["januari", "februari", "mars", "april", "maj", "juni",
         "juli", "augusti", "september", "oktober", "november", "december"]
    }
}
