public struct AfLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Daar was 'n fout om die tydsuitdrukking the genereer. Raadpleeg asb die uitdrukking formaat." }

    public func everyMinute() -> String { "elke minuut" }
    public func everyHour() -> String { "elke uur" }
    public func onTheHour() -> String { "op die uur" }
    public func everyXMinutes(_ n: String) -> String { "elke \(n) minute" }
    public func everyXHours(_ n: String) -> String { "elke \(n) ure" }
    public func atSpace() -> String { "Teen " }
    public func at() -> String { "Teen" }
    public func spaceAnd() -> String { " en" }
    public func atX() -> String { "teen %s" }
    public func atXMinutesPastTheHour() -> String { "teen %s minute na die uur" }
    public func minutesXThroughXPastTheHour() -> String { "minute %s deur na %s na die uur" }
    public func betweenXAndX() -> String { "tussen %s en %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Elke minuut tussen \(a) en \(b)" }

    public func commaEveryDay() -> String { ", elke dag" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", elke \(n) dae" }
    public func commaOnDayXOfTheMonth() -> String { ", op dag %s van die maand" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", tussen dag %s en %s van die maand" }
    public func commaOnlyOnX() -> String { ", net op %s" }
    public func commaAndOnX() -> String { ", en op %s" }
    public func commaXThroughX() -> String { ", %s deur na %s" }
    public func commaAndXThroughX() -> String { ", en %s deur na %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", elke \(n) maande" }
    public func commaMonthXThroughMonthX() -> String { ", %s deur na %s" }
    public func commaOnlyInX() -> String { ", net in %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", elke \(n) dae van die week" }
    public func commaStartingX(_ s: String) -> String { ", beginnende \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", op die laaste dag van die maand" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", op die laaste weeksdag van die maand" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dae voor die laaste dag van die maand" }
    public func lastDay() -> String { "die laaste dag" }
    public func firstWeekday() -> String { "eerste weeksdag" }
    public func weekdayNearestDayX() -> String { "weeksdag naaste aan dag %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", op die %s van die maande" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", op die laaste %s van die maand" }
    public func commaOnThe() -> String { ", op die " }
    public func spaceX0OfTheMonth() -> String { " %s van die maand" }
    public func first() -> String { "eerste" }
    public func second() -> String { "tweede" }
    public func third() -> String { "derde" }
    public func fourth() -> String { "vierde" }
    public func fifth() -> String { "vyfde" }

    public func everySecond() -> String { "elke sekonde" }
    public func everyXSeconds(_ n: String) -> String { "elke \(n) sekonde" }
    public func secondsXThroughXPastTheMinute() -> String { "sekonde %s deur na %s na die minuut" }
    public func atXSecondsPastTheMinute() -> String { "teen %s sekondes na die minuut" }

    public func daysOfTheWeek() -> [String] {
        ["Sondag", "Maandag", "Dinsdag", "Woensdag", "Donderdag", "Vrydag", "Saterdag"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Januarie", "Februarie", "Maart", "April", "Mei", "Junie",
         "Julie", "Augustus", "September", "Oktober", "November", "Desember"]
    }
}
