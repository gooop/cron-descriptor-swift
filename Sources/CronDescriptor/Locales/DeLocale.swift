public struct DeLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Beim Generieren der Ausdrucksbeschreibung ist ein Fehler aufgetreten. Überprüfen Sie die Syntax des Cron-Ausdrucks." }

    public func everyMinute() -> String { "jede Minute" }
    public func everyHour() -> String { "jede Stunde" }
    public func onTheHour() -> String { "zur vollen Stunde" }
    public func everyXMinutes(_ n: String) -> String { "alle \(n) Minuten" }
    public func everyXHours(_ n: String) -> String { "alle \(n) Stunden" }
    public func atSpace() -> String { "Um " }
    public func at() -> String { "Um" }
    public func spaceAnd() -> String { " und" }
    public func atX() -> String { "um %s" }
    public func atXMinutesPastTheHour() -> String { "bei Minute %s" }
    public func minutesXThroughXPastTheHour() -> String { "Minuten %s bis %s" }
    public func betweenXAndX() -> String { "zwischen %s und %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Jede Minute zwischen \(a) und \(b)" }

    public func commaEveryDay() -> String { ", jeden Tag" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", alle \(n) Tage" }
    public func commaOnDayXOfTheMonth() -> String { ", an Tag %s des Monats" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", zwischen Tag %s und %s des Monats" }
    public func commaOnlyOnX() -> String { ", nur jeden %s" }
    public func commaAndOnX() -> String { ", und jeden %s" }
    public func commaXThroughX() -> String { ", %s bis %s" }
    public func commaAndXThroughX() -> String { ", und %s bis %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", alle \(n) Monate" }
    public func commaMonthXThroughMonthX() -> String { ", %s bis %s" }
    public func commaOnlyInX() -> String { ", nur im %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", alle \(n) Tage der Woche" }
    public func commaStartingX(_ s: String) -> String { ", beginnend \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", am letzten Tag des Monats" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", am letzten Werktag des Monats" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s Tage vor dem letzten Tag des Monats" }
    public func lastDay() -> String { "der letzte Tag" }
    public func firstWeekday() -> String { "ersten Werktag" }
    public func weekdayNearestDayX() -> String { "Werktag am nächsten zum %s Tag" }
    public func commaOnTheX0OfTheMonth() -> String { ", am %s des Monats" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", am letzten %s des Monats" }
    public func commaOnThe() -> String { ", am " }
    public func spaceX0OfTheMonth() -> String { " %s des Monats" }
    public func first() -> String { "ersten" }
    public func second() -> String { "zweiten" }
    public func third() -> String { "dritten" }
    public func fourth() -> String { "vierten" }
    public func fifth() -> String { "fünften" }

    public func everySecond() -> String { "Jede Sekunde" }
    public func everyXSeconds(_ n: String) -> String { "alle \(n) Sekunden" }
    public func secondsXThroughXPastTheMinute() -> String { "Sekunden %s bis %s" }
    public func atXSecondsPastTheMinute() -> String { "bei Sekunde %s" }

    public func daysOfTheWeek() -> [String] {
        ["Sonntag", "Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Januar", "Februar", "März", "April", "Mai", "Juni",
         "Juli", "August", "September", "Oktober", "November", "Dezember"]
    }
}
