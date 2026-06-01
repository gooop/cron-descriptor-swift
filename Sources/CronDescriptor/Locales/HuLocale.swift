public struct HuLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Hiba történt a kifejezésleírás generálásakor. Ellenőrizze a cron kifejezés szintaxisát." }

    public func everyMinute() -> String { "minden percben" }
    public func everyHour() -> String { "minden órában" }
    public func onTheHour() -> String { "órakor" }
    public func everyXMinutes(_ n: String) -> String { "minden \(n). percben" }
    public func everyXHours(_ n: String) -> String { "minden \(n) órában" }
    public func atSpace() -> String { "Ekkor: " }
    public func at() -> String { "Ekkor:" }
    public func spaceAnd() -> String { " és" }
    public func atX() -> String { "ekkor %s" }
    public func atXMinutesPastTheHour() -> String { "%s. percben" }
    public func minutesXThroughXPastTheHour() -> String { "%s. percben %s óra után" }
    public func betweenXAndX() -> String { "%s és %s között" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "percenként \(a) és \(b) között" }

    public func commaEveryDay() -> String { ", minden nap" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", \(n) naponként" }
    public func commaOnDayXOfTheMonth() -> String { ", a hónap %s napján" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", a hónap %s és %s napja között" }
    public func commaOnlyOnX() -> String { ", csak ekkor: %s" }
    public func commaAndOnX() -> String { ", és %s" }
    public func commaXThroughX() -> String { ", %s - %s" }
    public func commaAndXThroughX() -> String { ", és %s - %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", minden \(n) hónapban" }
    public func commaMonthXThroughMonthX() -> String { ", %s - %s" }
    public func commaOnlyInX() -> String { ", csak ekkor: %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", a hét minden \(n) napján" }
    public func commaStartingX(_ s: String) -> String { ", \(s) kezdettel" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", a hónap utolsó napján" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", a hónap utolsó hétköznapján" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s nappal a hónap utolsó napja előtt" }
    public func lastDay() -> String { "az utolsó nap" }
    public func firstWeekday() -> String { "első hétköznap" }
    public func weekdayNearestDayX() -> String { "hétköznap legközelebbi nap %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", a hónap %s" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", a hónap utolsó %s" }
    public func commaOnThe() -> String { ", " }
    public func spaceX0OfTheMonth() -> String { " %s a hónapban" }
    public func first() -> String { "első" }
    public func second() -> String { "második" }
    public func third() -> String { "harmadik" }
    public func fourth() -> String { "negyedik" }
    public func fifth() -> String { "ötödik" }

    public func everySecond() -> String { "minden másodpercben" }
    public func everyXSeconds(_ n: String) -> String { "\(n) másodpercenként" }
    public func secondsXThroughXPastTheMinute() -> String { "%s. másodpercben %s perc után" }
    public func atXSecondsPastTheMinute() -> String { "%s. másodpercben" }

    public func daysOfTheWeek() -> [String] {
        ["vasárnap", "hétfő", "kedd", "szerda", "csütörtök", "péntek", "szombat"]
    }
    public func monthsOfTheYear() -> [String] {
        ["január", "február", "március", "április", "május", "június",
         "július", "augusztus", "szeptember", "október", "november", "december"]
    }
}
