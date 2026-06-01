public struct EsLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Ocurrió un error mientras se generaba la descripción de la expresión. Revise la sintaxis de la expresión de cron." }

    public func everyMinute() -> String { "cada minuto" }
    public func everyHour() -> String { "cada hora" }
    public func onTheHour() -> String { "en punto" }
    public func everyXMinutes(_ n: String) -> String { "cada \(n) minutos" }
    public func everyXHours(_ n: String) -> String { "cada \(n) horas" }
    public func atSpace() -> String { "A las " }
    public func at() -> String { "A las" }
    public func spaceAnd() -> String { " y" }
    public func atX() -> String { "a las %s" }
    public func atXMinutesPastTheHour() -> String { "a los %s minutos de la hora" }
    public func minutesXThroughXPastTheHour() -> String { "del minuto %s al %s pasada la hora" }
    public func betweenXAndX() -> String { "entre las %s y las %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "cada minuto entre las \(a) y las \(b)" }

    public func commaEveryDay() -> String { ", cada día" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", cada \(n) días" }
    public func commaOnDayXOfTheMonth() -> String { ", el día %s del mes" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", entre los días %s y %s del mes" }
    public func commaOnlyOnX() -> String { ", sólo el %s" }
    public func commaAndOnX() -> String { ", y el %s" }
    public func commaXThroughX() -> String { ", de %s a %s" }
    public func commaAndXThroughX() -> String { ", y de %s a %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", cada \(n) meses" }
    public func commaMonthXThroughMonthX() -> String { ", de %s a %s" }
    public func commaOnlyInX() -> String { ", sólo en %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", cada \(n) días de la semana" }
    public func commaStartingX(_ s: String) -> String { ", comenzando \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", en el último día del mes" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", en el último día de la semana del mes" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s días antes del último día del mes" }
    public func lastDay() -> String { "el último día" }
    public func firstWeekday() -> String { "primer día de la semana" }
    public func weekdayNearestDayX() -> String { "día de la semana más próximo al %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", en el %s del mes" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", en el último %s del mes" }
    public func commaOnThe() -> String { ", en el " }
    public func spaceX0OfTheMonth() -> String { " %s del mes" }
    public func first() -> String { "primero" }
    public func second() -> String { "segundo" }
    public func third() -> String { "tercer" }
    public func fourth() -> String { "cuarto" }
    public func fifth() -> String { "quinto" }

    public func everySecond() -> String { "cada segundo" }
    public func everyXSeconds(_ n: String) -> String { "cada \(n) segundos" }
    public func secondsXThroughXPastTheMinute() -> String { "En los segundos %s al %s de cada minuto" }
    public func atXSecondsPastTheMinute() -> String { "a los %s segundos del minuto" }

    public func daysOfTheWeek() -> [String] {
        ["domingo", "lunes", "martes", "miércoles", "jueves", "viernes", "sábado"]
    }
    public func monthsOfTheYear() -> [String] {
        ["enero", "febrero", "marzo", "abril", "mayo", "junio",
         "julio", "agosto", "septiembre", "octubre", "noviembre", "diciembre"]
    }
}
