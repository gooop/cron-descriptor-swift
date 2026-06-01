public struct ViLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "Đã xảy ra lỗi khi tạo mô tả biểu thức. Vui lòng kiểm tra cú pháp biểu thức cron." }

    public func everyMinute() -> String { "mỗi phút" }
    public func everyHour() -> String { "mỗi giờ" }
    public func onTheHour() -> String { "đúng giờ" }
    public func everyXMinutes(_ n: String) -> String { "mỗi \(n) phút" }
    public func everyXHours(_ n: String) -> String { "mỗi \(n) tiếng" }
    public func atSpace() -> String { "Vào " }
    public func at() -> String { "Vào" }
    public func spaceAnd() -> String { " và" }
    public func atX() -> String { "vào %s" }
    public func atXMinutesPastTheHour() -> String { "vào %s phút của mỗi tiếng" }
    public func minutesXThroughXPastTheHour() -> String { "phút thứ %s qua %s tiếng" }
    public func betweenXAndX() -> String { "giữa %s và %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "Mỗi phút giữa \(a) và \(b)" }

    public func commaEveryDay() -> String { ", mỗi ngày" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", mỗi \(n) ngày" }
    public func commaOnDayXOfTheMonth() -> String { ", vào %s ngày trong tháng" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", giữa ngày %s và %s trong tháng" }
    public func commaOnlyOnX() -> String { ", chỉ trên %s" }
    public func commaAndOnX() -> String { ", và hơn %s" }
    public func commaXThroughX() -> String { ", %s đến %s" }
    public func commaAndXThroughX() -> String { ", %s đến %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", mỗi ngày \(n) tháng" }
    public func commaMonthXThroughMonthX() -> String { ", %s đến %s" }
    public func commaOnlyInX() -> String { ", chỉ trong %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", mỗi \(n) ngày trong tuần" }
    public func commaStartingX(_ s: String) -> String { ", bắt đầu \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", vào ngày cuối cùng của tháng" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", vào ngày cuối tuần của tháng" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s ngày trước ngày cuối cùng của tháng" }
    public func lastDay() -> String { "ngày cuối cùng" }
    public func firstWeekday() -> String { "ngày đầu tuần" }
    public func weekdayNearestDayX() -> String { "ngày trong tuần ngày gần nhất %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", vào ngày %s của tháng" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", vào ngày %s cuối cùng của tháng" }
    public func commaOnThe() -> String { ", trên " }
    public func spaceX0OfTheMonth() -> String { " %s của tháng" }
    public func first() -> String { "đầu tiên" }
    public func second() -> String { "thứ 2" }
    public func third() -> String { "thứ 3" }
    public func fourth() -> String { "thứ 4" }
    public func fifth() -> String { "thứ 5" }

    public func everySecond() -> String { "mỗi giây" }
    public func everyXSeconds(_ n: String) -> String { "mỗi \(n) giây" }
    public func secondsXThroughXPastTheMinute() -> String { "giây thứ %s qua phút thứ %s" }
    public func atXSecondsPastTheMinute() -> String { "tại giây thứ %s của mỗi phút" }

    public func daysOfTheWeek() -> [String] {
        ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"]
    }
    public func monthsOfTheYear() -> [String] {
        ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
         "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"]
    }
}
