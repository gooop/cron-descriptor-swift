public struct ItLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "È verificato un errore durante la generazione la descrizione espressione. Controllare la sintassi delle espressioni cron." }

    public func everyMinute() -> String { "ogni minuto" }
    public func everyHour() -> String { "ogni ora" }
    public func onTheHour() -> String { "all'ora esatta" }
    public func everyXMinutes(_ n: String) -> String { "ogni \(n) minuti" }
    public func everyXHours(_ n: String) -> String { "ogni \(n) ore" }
    public func atSpace() -> String { "Alle " }
    public func at() -> String { "Alle" }
    public func spaceAnd() -> String { " e" }
    public func atX() -> String { "alle %s" }
    public func atXMinutesPastTheHour() -> String { "al %s minuto passata l'ora" }
    public func minutesXThroughXPastTheHour() -> String { "minuti %s al %s dopo l'ora" }
    public func betweenXAndX() -> String { "tra le %s e le %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Ogni minuto tra le \(a) e le \(b)" }

    public func commaEveryDay() -> String { ", ogni giorno" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", ogni \(n) giorni" }
    public func commaOnDayXOfTheMonth() -> String { ", il giorno %s del mese" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", tra il giorno %s e %s del mese" }
    public func commaOnlyOnX() -> String { ", solo il %s" }
    public func commaAndOnX() -> String { ", e il %s" }
    public func commaXThroughX() -> String { ", %s al %s" }
    public func commaAndXThroughX() -> String { ", e %s al %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", ogni \(n) mesi" }
    public func commaMonthXThroughMonthX() -> String { ", %s al %s" }
    public func commaOnlyInX() -> String { ", solo in %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", ogni \(n) giorni della settimana" }
    public func commaStartingX(_ s: String) -> String { ", a partire \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", l'ultimo giorno del mese" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", nell'ultima settimana del mese" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s giorni prima dell'ultimo giorno del mese" }
    public func lastDay() -> String { "l'ultimo giorno" }
    public func firstWeekday() -> String { "primo giorno della settimana" }
    public func weekdayNearestDayX() -> String { "giorno della settimana più vicino al %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", il %s del mese" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", l'ultimo %s del mese" }
    public func commaOnThe() -> String { ", il " }
    public func spaceX0OfTheMonth() -> String { " %s del mese" }
    public func first() -> String { "primo" }
    public func second() -> String { "secondo" }
    public func third() -> String { "terzo" }
    public func fourth() -> String { "quarto" }
    public func fifth() -> String { "quinto" }

    public func everySecond() -> String { "ogni secondo" }
    public func everyXSeconds(_ n: String) -> String { "ogni \(n) secondi" }
    public func secondsXThroughXPastTheMinute() -> String { "secondi %s al %s oltre il minuto" }
    public func atXSecondsPastTheMinute() -> String { "al %s secondo passato il minuto" }

    public func daysOfTheWeek() -> [String] {
        ["domenica", "lunedì", "martedì", "mercoledì", "giovedì", "venerdì", "sabato"]
    }
    public func monthsOfTheYear() -> [String] {
        ["gennaio", "febbraio", "marzo", "aprile", "maggio", "giugno",
         "luglio", "agosto", "settembre", "ottobre", "novembre", "dicembre"]
    }
}
