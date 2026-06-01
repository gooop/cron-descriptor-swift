public struct NbLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "En feil inntraff ved generering av uttrykksbeskrivelse. Sjekk cron syntaks." }

    public func everyMinute() -> String { "hvert minutt" }
    public func everyHour() -> String { "hver time" }
    public func onTheHour() -> String { "på timen" }
    public func everyXMinutes(_ n: String) -> String { "hvert \(n) minutt" }
    public func everyXHours(_ n: String) -> String { "hver \(n) time" }
    public func atSpace() -> String { "Kl." }
    public func at() -> String { "Kl." }
    public func spaceAnd() -> String { " og" }
    public func atX() -> String { "på %s" }
    public func atXMinutesPastTheHour() -> String { "på %s minutter etter timen" }
    public func minutesXThroughXPastTheHour() -> String { "minuttene fra %s til og med %s etter timen" }
    public func betweenXAndX() -> String { "mellom %s og %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Hvert minutt mellom \(a) og \(b)" }

    public func commaEveryDay() -> String { ", hver dag" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", hver \(n) dag" }
    public func commaOnDayXOfTheMonth() -> String { ", på dag %s av måneden" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", mellom dag %s og %s av måneden" }
    public func commaOnlyOnX() -> String { ", på %s" }
    public func commaAndOnX() -> String { ", og på %s" }
    public func commaXThroughX() -> String { ", %s til og med %s" }
    public func commaAndXThroughX() -> String { ", og %s til og med %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", hver \(n) måned" }
    public func commaMonthXThroughMonthX() -> String { ", %s til og med %s" }
    public func commaOnlyInX() -> String { ", bare i %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", hver \(n) ukedag" }
    public func commaStartingX(_ s: String) -> String { ", starter \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", på den siste dagen i måneden" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", den siste ukedagen i måneden" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dager før den siste dagen i måneden" }
    public func lastDay() -> String { "den siste dagen" }
    public func firstWeekday() -> String { "første ukedag" }
    public func weekdayNearestDayX() -> String { "ukedag nærmest dag %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", på den %s av måneden" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", på den siste %s av måneden" }
    public func commaOnThe() -> String { ", på " }
    public func spaceX0OfTheMonth() -> String { " %s i måneden" }
    public func first() -> String { "første" }
    public func second() -> String { "andre" }
    public func third() -> String { "tredje" }
    public func fourth() -> String { "fjerde" }
    public func fifth() -> String { "femte" }

    public func everySecond() -> String { "hvert sekund" }
    public func everyXSeconds(_ n: String) -> String { "hvert \(n) sekund" }
    public func secondsXThroughXPastTheMinute() -> String { "sekundene fra %s til og med %s etter minuttet" }
    public func atXSecondsPastTheMinute() -> String { "på %s sekunder etter minuttet" }

    public func daysOfTheWeek() -> [String] {
        ["søndag", "mandag", "tirsdag", "onsdag", "torsdag", "fredag", "lørdag"]
    }
    public func monthsOfTheYear() -> [String] {
        ["januar", "februar", "mars", "april", "mai", "juni",
         "juli", "august", "september", "oktober", "november", "desember"]
    }
}
