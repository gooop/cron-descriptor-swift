public struct TrLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "İfade açıklamasını oluştururken bir hata oluştu. Cron ifadesini gözden geçirin." }

    public func everyMinute() -> String { "her dakika" }
    public func everyHour() -> String { "her saat" }
    public func onTheHour() -> String { "saatin başında" }
    public func everyXMinutes(_ n: String) -> String { "her \(n) dakikada bir" }
    public func everyXHours(_ n: String) -> String { "her \(n) saatte" }
    public func atSpace() -> String { "Saat " }
    public func at() -> String { "Saat" }
    public func spaceAnd() -> String { " ve" }
    public func atX() -> String { "saat %s" }
    public func atXMinutesPastTheHour() -> String { "saatlerin %s. dakikasında" }
    public func minutesXThroughXPastTheHour() -> String { "saatlerin %s. ve %s. dakikaları arası" }
    public func betweenXAndX() -> String { "%s ile %s arasında" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Saat \(a) ve \(b) arasındaki her dakika" }

    public func commaEveryDay() -> String { ", her gün" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", \(n) günde bir" }
    public func commaOnDayXOfTheMonth() -> String { ", ayın %s. günü" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", ayın %s. ve %s. günleri arası" }
    public func commaOnlyOnX() -> String { ", sadece %s günü" }
    public func commaAndOnX() -> String { ", ve %s" }
    public func commaXThroughX() -> String { ", %s ile %s arasında" }
    public func commaAndXThroughX() -> String { ", ve %s ile %s arasında" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", \(n) ayda bir" }
    public func commaMonthXThroughMonthX() -> String { ", %s - %s" }
    public func commaOnlyInX() -> String { ", sadece %s için" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", ayın her \(n) günü" }
    public func commaStartingX(_ s: String) -> String { ", başlangıç \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", ayın son günü" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", ayın son iş günü" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s ayın son gününden önceki günler" }
    public func lastDay() -> String { "son gün" }
    public func firstWeekday() -> String { "ilk iş günü" }
    public func weekdayNearestDayX() -> String { "%s. günü sonrasındaki ilk iş günü" }
    public func commaOnTheX0OfTheMonth() -> String { ", ayın %s" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", ayın son %s günü" }
    public func commaOnThe() -> String { ", ayın " }
    public func spaceX0OfTheMonth() -> String { " %s günü" }
    public func first() -> String { "ilk" }
    public func second() -> String { "ikinci" }
    public func third() -> String { "üçüncü" }
    public func fourth() -> String { "dördüncü" }
    public func fifth() -> String { "beşinci" }

    public func everySecond() -> String { "her saniye" }
    public func everyXSeconds(_ n: String) -> String { "her \(n) saniyede bir" }
    public func secondsXThroughXPastTheMinute() -> String { "dakikaların %s. ve %s. saniyeleri arası" }
    public func atXSecondsPastTheMinute() -> String { "dakikaların %s. saniyesinde" }

    public func daysOfTheWeek() -> [String] {
        ["Pazar", "Pazartesi", "Salı", "Çarşamba", "Perşembe", "Cuma", "Cumartesi"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran",
         "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık"]
    }
}
