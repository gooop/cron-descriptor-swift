public struct RoLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Eroare la generarea descrierii. Verificați sintaxa." }

    public func everyMinute() -> String { "în fiecare minut" }
    public func everyHour() -> String { "în fiecare oră" }
    public func onTheHour() -> String { "fix la oră" }
    public func everyXMinutes(_ n: String) -> String { "la fiecare \(n) minute" }
    public func everyXHours(_ n: String) -> String { "la fiecare \(n) ore" }
    public func atSpace() -> String { "La " }
    public func at() -> String { "La" }
    public func spaceAnd() -> String { " și" }
    public func atX() -> String { "la %s" }
    public func atXMinutesPastTheHour() -> String { "la și %s minute" }
    public func minutesXThroughXPastTheHour() -> String { "între minutele %s și %s" }
    public func betweenXAndX() -> String { "între %s și %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "În fiecare minut între \(a) și \(b)" }

    public func commaEveryDay() -> String { ", în fiecare zi" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", la fiecare \(n) zile" }
    public func commaOnDayXOfTheMonth() -> String { ", în ziua %s a lunii" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", între zilele %s și %s ale lunii" }
    public func commaOnlyOnX() -> String { ", doar %s" }
    public func commaAndOnX() -> String { ", și %s" }
    public func commaXThroughX() -> String { ", de %s până %s" }
    public func commaAndXThroughX() -> String { ", și de %s până %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", la fiecare \(n) luni" }
    public func commaMonthXThroughMonthX() -> String { ", din %s până în %s" }
    public func commaOnlyInX() -> String { ", doar în %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", la fiecare a \(n)-a zi a săptămânii" }
    public func commaStartingX(_ s: String) -> String { ", pornire \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", în ultima zi a lunii" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", în ultima zi lucrătoare a lunii" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s zile înainte de ultima zi a lunii" }
    public func lastDay() -> String { "ultima zi" }
    public func firstWeekday() -> String { "prima zi a săptămânii" }
    public func weekdayNearestDayX() -> String { "cea mai apropiată zi a săptămânii de ziua %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", în %s a lunii" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", în ultima %s a lunii" }
    public func commaOnThe() -> String { ", în " }
    public func spaceX0OfTheMonth() -> String { " %s a lunii" }
    public func first() -> String { "prima" }
    public func second() -> String { "a doua" }
    public func third() -> String { "a treia" }
    public func fourth() -> String { "a patra" }
    public func fifth() -> String { "a cincea" }

    public func everySecond() -> String { "în fiecare secundă" }
    public func everyXSeconds(_ n: String) -> String { "la fiecare \(n) secunde" }
    public func secondsXThroughXPastTheMinute() -> String { "între secunda %s și secunda %s" }
    public func atXSecondsPastTheMinute() -> String { "la și %s secunde" }

    public func daysOfTheWeek() -> [String] {
        ["duminică", "luni", "marți", "miercuri", "joi", "vineri", "sâmbătă"]
    }
    public func monthsOfTheYear() -> [String] {
        ["ianuarie", "februarie", "martie", "aprilie", "mai", "iunie",
         "iulie", "august", "septembrie", "octombrie", "noiembrie", "decembrie"]
    }
}
