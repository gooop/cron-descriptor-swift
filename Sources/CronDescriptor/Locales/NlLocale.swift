public struct NlLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Er is een fout opgetreden bij het vertalen van de gegevens. Controleer de gegevens." }

    public func everyMinute() -> String { "elke minuut" }
    public func everyHour() -> String { "elk uur" }
    public func onTheHour() -> String { "op het hele uur" }
    public func everyXMinutes(_ n: String) -> String { "elke \(n) minuten" }
    public func everyXHours(_ n: String) -> String { "elke \(n) uur" }
    public func atSpace() -> String { "Om " }
    public func at() -> String { "Om" }
    public func spaceAnd() -> String { " en" }
    public func atX() -> String { "om %s" }
    public func atXMinutesPastTheHour() -> String { "op %s minuten na het uur" }
    public func minutesXThroughXPastTheHour() -> String { "minuut %s t/m %s na het uur" }
    public func betweenXAndX() -> String { "tussen %s en %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Elke minuut tussen \(a) en \(b)" }

    public func commaEveryDay() -> String { ", elke dag" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", elke \(n) dagen" }
    public func commaOnDayXOfTheMonth() -> String { ", op dag %s van de maand" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", tussen dag %s en %s van de maand" }
    public func commaOnlyOnX() -> String { ", alleen op %s" }
    public func commaAndOnX() -> String { ", en op %s" }
    public func commaXThroughX() -> String { ", %s t/m %s" }
    public func commaAndXThroughX() -> String { ", en %s t/m %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", elke \(n) maanden" }
    public func commaMonthXThroughMonthX() -> String { ", %s t/m %s" }
    public func commaOnlyInX() -> String { ", alleen in %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", elke \(n) dagen van de week" }
    public func commaStartingX(_ s: String) -> String { ", beginnend \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", op de laatste dag van de maand" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", op de laatste werkdag van de maand" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dagen vóór de laatste dag van de maand" }
    public func lastDay() -> String { "de laatste dag" }
    public func firstWeekday() -> String { "eerste werkdag" }
    public func weekdayNearestDayX() -> String { "werkdag dichtst bij dag %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", op de %s van de maand" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", op de laatste %s van de maand" }
    public func commaOnThe() -> String { ", op de " }
    public func spaceX0OfTheMonth() -> String { " %s van de maand" }
    public func first() -> String { "eerste" }
    public func second() -> String { "tweede" }
    public func third() -> String { "derde" }
    public func fourth() -> String { "vierde" }
    public func fifth() -> String { "vijfde" }

    public func everySecond() -> String { "elke seconde" }
    public func everyXSeconds(_ n: String) -> String { "elke \(n) seconden" }
    public func secondsXThroughXPastTheMinute() -> String { "seconden %s t/m %s na de minuut" }
    public func atXSecondsPastTheMinute() -> String { "op %s seconden na de minuut" }

    public func daysOfTheWeek() -> [String] {
        ["zondag", "maandag", "dinsdag", "woensdag", "donderdag", "vrijdag", "zaterdag"]
    }
    public func monthsOfTheYear() -> [String] {
        ["januari", "februari", "maart", "april", "mei", "juni",
         "juli", "augustus", "september", "oktober", "november", "december"]
    }
}
