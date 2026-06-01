// Note: locale code "my" is used by cRonstrue for Malay (ISO 639-1 "my" is actually Burmese/Myanmar).
public struct MyLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { false }
    public func anErrorOccurred() -> String { "Terdapat ralat semasa menjana penerangan ungkapan. Sila periksa sintaks ungkapan cron." }

    public func everyMinute() -> String { "setiap minit" }
    public func everyHour() -> String { "setiap jam" }
    public func onTheHour() -> String { "pada waktu yang tepat" }
    public func everyXMinutes(_ n: String) -> String { "setiap \(n) minit" }
    public func everyXHours(_ n: String) -> String { "setiap \(n) jam" }
    public func atSpace() -> String { "Pada " }
    public func at() -> String { "Pada" }
    public func spaceAnd() -> String { " dan" }
    public func atX() -> String { "pada %s" }
    public func atXMinutesPastTheHour() -> String { "pada %s minit selepas jam" }
    public func minutesXThroughXPastTheHour() -> String { "minit ke %s hingga %s selepas jam" }
    public func betweenXAndX() -> String { "antara %s dan %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Setiap minit antara \(a) dan \(b)" }

    public func commaEveryDay() -> String { ", setiap hari" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", setiap \(n) hari" }
    public func commaOnDayXOfTheMonth() -> String { ", pada hari %s dalam bulan" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", antara hari %s dan %s dalam bulan" }
    public func commaOnlyOnX() -> String { ", hanya pada %s" }
    public func commaAndOnX() -> String { ", dan pada %s" }
    public func commaXThroughX() -> String { ", %s hingga %s" }
    public func commaAndXThroughX() -> String { ", dan %s hingga %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", setiap bulan \(n)" }
    public func commaMonthXThroughMonthX() -> String { ", %s hingga %s" }
    public func commaOnlyInX() -> String { ", hanya pada %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", setiap \(n) hari dalam minggu" }
    public func commaStartingX(_ s: String) -> String { ", bermula \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", pada hari terakhir bulan" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", pada minggu terakhir bulan" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s hari sebelum hari terakhir bulan" }
    public func lastDay() -> String { "hari terakhir" }
    public func firstWeekday() -> String { "hari pertama minggu bekerja" }
    public func weekdayNearestDayX() -> String { "hari bekerja yang terdekat dengan %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", pada %s bulan" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", pada %s terakhir bulan" }
    public func commaOnThe() -> String { ", pada " }
    public func spaceX0OfTheMonth() -> String { " %s pada bulan" }
    public func first() -> String { "pertama" }
    public func second() -> String { "kedua" }
    public func third() -> String { "ketiga" }
    public func fourth() -> String { "keempat" }
    public func fifth() -> String { "kelima" }

    public func everySecond() -> String { "setiap saat" }
    public func everyXSeconds(_ n: String) -> String { "setiap \(n) saat" }
    public func secondsXThroughXPastTheMinute() -> String { "saat ke %s hingga %s selepas minit" }
    public func atXSecondsPastTheMinute() -> String { "pada %s saat selepas minit" }

    public func daysOfTheWeek() -> [String] {
        ["Ahad", "Isnin", "Selasa", "Rabu", "Khamis", "Jumaat", "Sabtu"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Januari", "Februari", "Mac", "April", "Mei", "Jun",
         "Julai", "Ogos", "September", "Oktober", "November", "Disember"]
    }
}
