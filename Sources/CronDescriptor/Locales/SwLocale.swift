public struct SwLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Kuna tatizo wakati wa kutunga msemo. Angalia cron expression syntax." }

    public func everyMinute() -> String { "kila dakika" }
    public func everyHour() -> String { "kila saa" }
    public func onTheHour() -> String { "saa kamili" }
    public func everyXMinutes(_ n: String) -> String { "kila dakika \(n)" }
    public func everyXHours(_ n: String) -> String { "every \(n) hours" }
    public func atSpace() -> String { "Kwa " }
    public func at() -> String { "Kwa" }
    public func spaceAnd() -> String { " na" }
    public func atX() -> String { "kwenye %s" }
    public func atXMinutesPastTheHour() -> String { "at %s minutes past the hour" }
    public func minutesXThroughXPastTheHour() -> String { "minutes %s through %s past the hour" }
    public func betweenXAndX() -> String { "kati ya %s na %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Kila dakika kwanzia \(a) hadi \(b)" }

    public func commaEveryDay() -> String { ", kila siku" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", kila siku \(n)" }
    public func commaOnDayXOfTheMonth() -> String { ", siku ya %s ya mwezi" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", kati ya siku %s na %s ya mwezi" }
    public func commaOnlyOnX() -> String { ", kwa %s tu" }
    public func commaAndOnX() -> String { ", na pia %s" }
    public func commaXThroughX() -> String { ", %s hadi %s" }
    public func commaAndXThroughX() -> String { ", na %s hadi %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", kila mwezi wa \(n)" }
    public func commaMonthXThroughMonthX() -> String { ", %s hadi %s" }
    public func commaOnlyInX() -> String { ", kwa %s tu" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", kila siku \(n) ya wiki" }
    public func commaStartingX(_ s: String) -> String { ", kwanzia \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", siku ya mwisho wa mwezi" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", wikendi ya mwisho wa mwezi" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", siku ya %s kabla ya siku ya mwisho wa mwezi" }
    public func lastDay() -> String { "siku ya mwisho" }
    public func firstWeekday() -> String { "siku za kazi ya kwanza" }
    public func weekdayNearestDayX() -> String { "siku ya kazi karibu na siku ya %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", siku ya %s ya mwezi" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", siku ya %s ya mwezi" }
    public func commaOnThe() -> String { ", kwenye " }
    public func spaceX0OfTheMonth() -> String { " siku %s ya mwezi" }
    public func first() -> String { "ya kwanza" }
    public func second() -> String { "ya pili" }
    public func third() -> String { "ya tatu" }
    public func fourth() -> String { "ya nne" }
    public func fifth() -> String { "ya tano" }

    public func everySecond() -> String { "kila sekunde" }
    public func everyXSeconds(_ n: String) -> String { "kila sekunde \(n)" }
    public func secondsXThroughXPastTheMinute() -> String { "sekunde ya %s hadi %s baada ya dakika" }
    public func atXSecondsPastTheMinute() -> String { "sekunde %s baada ya dakika" }

    public func daysOfTheWeek() -> [String] {
        ["Jumapili", "Jumatatu", "Jumanne", "Jumatano", "Alhamisi", "Ijumaa", "Jumamosi"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Januari", "Februari", "Machi", "Aprili", "Mei", "Juni",
         "Julai", "Agosti", "Septemba", "Oktoba", "Novemba", "Desemba"]
    }
}
