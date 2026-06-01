public struct FiLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Virhe kuvauksen generoinnissa. Tarkista cron-syntaksi." }

    public func everyMinute() -> String { "joka minuutti" }
    public func everyHour() -> String { "joka tunti" }
    public func onTheHour() -> String { "tasalta" }
    public func everyXMinutes(_ n: String) -> String { "joka \(n). minuutti" }
    public func everyXHours(_ n: String) -> String { "joka \(n). tunti" }
    public func atSpace() -> String { "Klo " }
    public func at() -> String { "Klo" }
    public func spaceAnd() -> String { " ja" }
    public func atX() -> String { "klo %s" }
    public func atXMinutesPastTheHour() -> String { "%s minuuttia yli" }
    public func minutesXThroughXPastTheHour() -> String { "joka tunti minuuttien %s - %s välillä" }
    public func betweenXAndX() -> String { "%s - %s välillä" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "joka minuutti \(a) - \(b) välillä" }

    public func commaEveryDay() -> String { ", joka päivä" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", joka \(n). päivä" }
    public func commaOnDayXOfTheMonth() -> String { ", kuukauden %s päivä" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", kuukauden päivien %s ja %s välillä" }
    public func commaOnlyOnX() -> String { ", vain %s" }
    public func commaAndOnX() -> String { ", ja edelleen %s" }
    public func commaXThroughX() -> String { ", %s - %s" }
    public func commaAndXThroughX() -> String { ", %s - %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", joka \(n). kuukausi" }
    public func commaMonthXThroughMonthX() -> String { ", %s - %s" }
    public func commaOnlyInX() -> String { ", vain %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", joka \(n). viikonpäivä" }
    public func commaStartingX(_ s: String) -> String { ", alkaen \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", kuukauden viimeisenä päivänä" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", kuukauden viimeisenä viikonpäivänä" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s päivää ennen kuukauden viimeistä päivää" }
    public func lastDay() -> String { "viimeinen päivä" }
    public func firstWeekday() -> String { "ensimmäinen viikonpäivä" }
    public func weekdayNearestDayX() -> String { "viikonpäivä lähintä %s päivää" }
    public func commaOnTheX0OfTheMonth() -> String { ", kuukauden %s" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", kuukauden viimeinen %s" }
    public func commaOnThe() -> String { "," }
    public func spaceX0OfTheMonth() -> String { " %s kuukaudessa" }
    public func first() -> String { "ensimmäinen" }
    public func second() -> String { "toinen" }
    public func third() -> String { "kolmas" }
    public func fourth() -> String { "neljäs" }
    public func fifth() -> String { "viides" }

    public func everySecond() -> String { "joka sekunti" }
    public func everyXSeconds(_ n: String) -> String { "joka \(n). sekunti" }
    public func secondsXThroughXPastTheMinute() -> String { "joka minuutti sekunttien %s - %s välillä" }
    public func atXSecondsPastTheMinute() -> String { "%s sekunnnin jälkeen" }

    public func daysOfTheWeek() -> [String] {
        ["sunnuntai", "maanantai", "tiistai", "keskiviikko", "torstai", "perjantai", "lauantai"]
    }
    public func monthsOfTheYear() -> [String] {
        ["tammikuu", "helmikuu", "maaliskuu", "huhtikuu", "toukokuu", "kesäkuu",
         "heinäkuu", "elokuu", "syyskuu", "lokakuu", "marraskuu", "joulukuu"]
    }
}
