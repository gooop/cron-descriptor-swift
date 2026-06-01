public struct PtPtLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Ocorreu um erro ao gerar a descrição da expressão Cron." }

    public func everyMinute() -> String { "a cada minuto" }
    public func everyHour() -> String { "a cada hora" }
    public func onTheHour() -> String { "à hora certa" }
    public func everyXMinutes(_ n: String) -> String { "a cada \(n) minutos" }
    public func everyXHours(_ n: String) -> String { "a cada \(n) horas" }
    public func atSpace() -> String { "às " }
    public func at() -> String { "às" }
    public func spaceAnd() -> String { " e" }
    public func atX() -> String { "Às %s" }
    public func atXMinutesPastTheHour() -> String { "aos %s minutos da hora" }
    public func minutesXThroughXPastTheHour() -> String { "do minuto %s até %s de cada hora" }
    public func betweenXAndX() -> String { "entre %s e %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "a cada minuto entre \(a) e \(b)" }

    public func commaEveryDay() -> String { ", a cada dia" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", a cada \(n) dias" }
    public func commaOnDayXOfTheMonth() -> String { ", no dia %s do mês" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", entre os dias %s e %s do mês" }
    public func commaOnlyOnX() -> String { ", somente de %s" }
    public func commaAndOnX() -> String { ", e de %s" }
    public func commaXThroughX() -> String { ", de %s a %s" }
    public func commaAndXThroughX() -> String { ", e de %s a %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", a cada \(n) meses" }
    public func commaMonthXThroughMonthX() -> String { ", de %s a %s" }
    public func commaOnlyInX() -> String { ", somente em %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", a cada \(n) dias de semana" }
    public func commaStartingX(_ s: String) -> String { ", iniciando \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", no último dia do mês" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", no último dia da semana do mês" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s dias antes do último dia do mês" }
    public func lastDay() -> String { "o último dia" }
    public func firstWeekday() -> String { "primeiro dia da semana" }
    public func weekdayNearestDayX() -> String { "dia da semana mais próximo do dia %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", no %s do mês" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", na última %s do mês" }
    public func commaOnThe() -> String { ", na " }
    public func spaceX0OfTheMonth() -> String { " %s do mês" }
    public func first() -> String { "primeiro" }
    public func second() -> String { "segundo" }
    public func third() -> String { "terceiro" }
    public func fourth() -> String { "quarto" }
    public func fifth() -> String { "quinto" }

    public func everySecond() -> String { "a cada segundo" }
    public func everyXSeconds(_ n: String) -> String { "a cada \(n) segundos" }
    public func secondsXThroughXPastTheMinute() -> String { "No segundo %s até %s de cada minuto" }
    public func atXSecondsPastTheMinute() -> String { "aos %s segundos do minuto" }

    public func daysOfTheWeek() -> [String] {
        ["domingo", "segunda-feira", "terça-feira", "quarta-feira", "quinta-feira", "sexta-feira", "sábado"]
    }
    public func monthsOfTheYear() -> [String] {
        ["janeiro", "fevereiro", "março", "abril", "maio", "junho",
         "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
    }
}
