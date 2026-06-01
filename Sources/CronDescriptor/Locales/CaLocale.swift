public struct CaLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "S'ha produït un error mentres es generava la descripció de l'expressió. Revisi la sintaxi de la expressió de cron." }

    public func everyMinute() -> String { "cada minut" }
    public func everyHour() -> String { "cada hora" }
    public func onTheHour() -> String { "en punt" }
    public func everyXMinutes(_ n: String) -> String { "cada \(n) minuts" }
    public func everyXHours(_ n: String) -> String { "cada \(n) hores" }
    public func atSpace() -> String { "A les " }
    public func at() -> String { "A les" }
    public func spaceAnd() -> String { " i" }
    public func atX() -> String { "a les %s" }
    public func atXMinutesPastTheHour() -> String { "als %s minuts de l'hora" }
    public func minutesXThroughXPastTheHour() -> String { "del minut %s al %s passada l'hora" }
    public func betweenXAndX() -> String { "entre les %s i les %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "cada minut entre les \(a) i les \(b)" }

    public func commaEveryDay() -> String { ", cada dia" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", cada \(n) dies" }
    public func commaOnDayXOfTheMonth() -> String { ", el dia %s del mes" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", entre els dies %s i %s del mes" }
    public func commaOnlyOnX() -> String { ", només el %s" }
    public func commaAndOnX() -> String { ", i el %s" }
    public func commaXThroughX() -> String { ", de %s a %s" }
    public func commaAndXThroughX() -> String { ", i de %s a %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", cada \(n) mesos" }
    public func commaMonthXThroughMonthX() -> String { ", de %s a %s" }
    public func commaOnlyInX() -> String { ", sólo en %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", cada \(n) dies de la setmana" }
    public func commaStartingX(_ s: String) -> String { ", començant \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", en l'últim dia del mes" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", en l'últim dia de la setmana del mes" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dies abans de l'últim dia del mes" }
    public func lastDay() -> String { "l'últim dia" }
    public func firstWeekday() -> String { "primer dia de la setmana" }
    public func weekdayNearestDayX() -> String { "dia de la setmana més proper al %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", en el %s del mes" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", en l'últim %s del mes" }
    public func commaOnThe() -> String { ", en el " }
    public func spaceX0OfTheMonth() -> String { " %s del mes" }
    public func first() -> String { "primer" }
    public func second() -> String { "segon" }
    public func third() -> String { "tercer" }
    public func fourth() -> String { "quart" }
    public func fifth() -> String { "cinquè" }

    public func everySecond() -> String { "cada segon" }
    public func everyXSeconds(_ n: String) -> String { "cada \(n) segons" }
    public func secondsXThroughXPastTheMinute() -> String { "En els segons %s al %s de cada minut" }
    public func atXSecondsPastTheMinute() -> String { "als %s segonds del minut" }

    public func daysOfTheWeek() -> [String] {
        ["diumenge", "dilluns", "dimarts", "dimecres", "dijous", "divendres", "dissabte"]
    }
    public func monthsOfTheYear() -> [String] {
        ["gener", "febrer", "març", "abril", "maig", "juny",
         "juliol", "agost", "setembre", "octubre", "novembre", "desembre"]
    }
}
