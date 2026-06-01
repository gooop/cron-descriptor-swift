public struct IdLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Terjadi kesalahan saat membuat deskripsi ekspresi. Periksa sintaks ekspresi cron." }

    public func everyMinute() -> String { "setiap menit" }
    public func everyHour() -> String { "setiap jam" }
    public func onTheHour() -> String { "tepat pada jam" }
    public func everyXMinutes(_ n: String) -> String { "setiap \(n) menit" }
    public func everyXHours(_ n: String) -> String { "setiap \(n) jam" }
    public func atSpace() -> String { "Pada " }
    public func at() -> String { "Pada" }
    public func spaceAnd() -> String { " dan" }
    public func atX() -> String { "pada %s" }
    public func atXMinutesPastTheHour() -> String { "pada %s menit melewati jam" }
    public func minutesXThroughXPastTheHour() -> String { "menit ke %s sampai %s melewati jam" }
    public func betweenXAndX() -> String { "diantara %s dan %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Setiap menit diantara \(a) dan \(b)" }

    public func commaEveryDay() -> String { ", setiap hari" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", setiap \(n) hari" }
    public func commaOnDayXOfTheMonth() -> String { ", pada hari %s dalam sebulan" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", antara hari %s dan %s dalam sebulan" }
    public func commaOnlyOnX() -> String { ", hanya pada %s" }
    public func commaAndOnX() -> String { ", dan pada %s" }
    public func commaXThroughX() -> String { ", %s sampai %s" }
    public func commaAndXThroughX() -> String { ", dan %s sampai %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", setiap bulan \(n)" }
    public func commaMonthXThroughMonthX() -> String { ", %s sampai %s" }
    public func commaOnlyInX() -> String { ", hanya pada %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", setiap hari \(n) dalam seminggu" }
    public func commaStartingX(_ s: String) -> String { ", mulai pada \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", pada hari terakhir bulan ini" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", pada hari kerja terakhir setiap bulan" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s hari sebelum hari terakhir setiap bulan" }
    public func lastDay() -> String { "hari terakhir" }
    public func firstWeekday() -> String { "hari kerja pertama" }
    public func weekdayNearestDayX() -> String { "hari kerja terdekat %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", pada %s bulan ini" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", pada %s terakhir bulan ini" }
    public func commaOnThe() -> String { ", di " }
    public func spaceX0OfTheMonth() -> String { " %s pada bulan" }
    public func first() -> String { "pertama" }
    public func second() -> String { "kedua" }
    public func third() -> String { "ketiga" }
    public func fourth() -> String { "keempat" }
    public func fifth() -> String { "kelima" }

    public func everySecond() -> String { "setiap detik" }
    public func everyXSeconds(_ n: String) -> String { "setiap \(n) detik" }
    public func secondsXThroughXPastTheMinute() -> String { "detik ke %s sampai %s melewati menit" }
    public func atXSecondsPastTheMinute() -> String { "pada %s detik lewat satu menit" }

    public func daysOfTheWeek() -> [String] {
        ["Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
         "Juli", "Agustus", "September", "Oktober", "November", "Desember"]
    }
}
