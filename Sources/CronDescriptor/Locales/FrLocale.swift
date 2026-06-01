public struct FrLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Une erreur est survenue en générant la description de l'expression cron. Vérifiez sa syntaxe." }

    public func everyMinute() -> String { "toutes les minutes" }
    public func everyHour() -> String { "toutes les heures" }
    public func onTheHour() -> String { "à l'heure pile" }
    public func everyXMinutes(_ n: String) -> String { "toutes les \(n) minutes" }
    public func everyXHours(_ n: String) -> String { "toutes les \(n) heures" }
    public func atSpace() -> String { "À " }
    public func at() -> String { "À" }
    public func spaceAnd() -> String { " et" }
    public func atX() -> String { "%s" }
    public func atXMinutesPastTheHour() -> String { "%s minutes après l'heure" }
    public func minutesXThroughXPastTheHour() -> String { "les minutes entre %s et %s après l'heure" }
    public func betweenXAndX() -> String { "de %s à %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Toutes les minutes entre \(a) et \(b)" }

    public func commaEveryDay() -> String { ", tous les jours" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", tous les \(n) jours" }
    public func commaOnDayXOfTheMonth() -> String { ", le %s du mois" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", du %s au %s du mois" }
    public func commaOnlyOnX() -> String { ", uniquement le %s" }
    public func commaAndOnX() -> String { ", et %s" }
    public func commaXThroughX() -> String { ", de %s à %s" }
    public func commaAndXThroughX() -> String { ", et de %s à %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", tous les \(n) mois" }
    public func commaMonthXThroughMonthX() -> String { ", de %s à %s" }
    public func commaOnlyInX() -> String { ", uniquement en %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", tous les \(n) jours de la semaine" }
    public func commaStartingX(_ s: String) -> String { ", à partir de \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", le dernier jour du mois" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", le dernier jour ouvrable du mois" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s jours avant le dernier jour du mois" }
    public func lastDay() -> String { "le dernier jour" }
    public func firstWeekday() -> String { "premier jour ouvrable" }
    public func weekdayNearestDayX() -> String { "jour ouvrable le plus proche du %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", le %s du mois" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", le dernier %s du mois" }
    public func commaOnThe() -> String { ", le " }
    public func spaceX0OfTheMonth() -> String { " %s du mois" }
    public func first() -> String { "premier" }
    public func second() -> String { "second" }
    public func third() -> String { "troisième" }
    public func fourth() -> String { "quatrième" }
    public func fifth() -> String { "cinquième" }

    public func everySecond() -> String { "toutes les secondes" }
    public func everyXSeconds(_ n: String) -> String { "toutes les \(n) secondes" }
    public func secondsXThroughXPastTheMinute() -> String { "les secondes entre %s et %s après la minute" }
    public func atXSecondsPastTheMinute() -> String { "%s secondes après la minute" }

    public func conciseVerbosityReplacements() -> [String: String] { ["de le": "du"] }

    public func daysOfTheWeek() -> [String] {
        ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"]
    }
    public func monthsOfTheYear() -> [String] {
        ["janvier", "février", "mars", "avril", "mai", "juin",
         "juillet", "août", "septembre", "octobre", "novembre", "décembre"]
    }
}
