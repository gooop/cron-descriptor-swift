public struct ZhTwLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "產生表達式描述時發生了錯誤，請檢查 cron 表達式語法。" }

    public func everyMinute() -> String { "每分鐘" }
    public func everyHour() -> String { "每小時" }
    public func onTheHour() -> String { "整點" }
    public func everyXMinutes(_ n: String) -> String { "每 \(n) 分鐘" }
    public func everyXHours(_ n: String) -> String { "每 \(n) 小時" }
    public func atSpace() -> String { "在 " }
    public func at() -> String { "在" }
    public func spaceAnd() -> String { " 和" }
    public func atX() -> String { "在 %s" }
    public func atXMinutesPastTheHour() -> String { "在整點後的 %s 分" }
    public func minutesXThroughXPastTheHour() -> String { "在整點後的 %s 到 %s 分鐘" }
    public func betweenXAndX() -> String { "在 %s 和 %s 之間" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "在 \(a) 和 \(b) 之間的每分鐘" }

    public func commaEveryDay() -> String { ", 每天" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", 每 \(n) 天" }
    public func commaOnDayXOfTheMonth() -> String { ", 每月的 %s" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", 在每月的 %s 和 %s 之間" }
    public func commaOnlyOnX() -> String { ", 僅在 %s" }
    public func commaAndOnX() -> String { ", 或 %s" }
    public func commaXThroughX() -> String { ", %s 到 %s" }
    public func commaAndXThroughX() -> String { ", 和 %s 到 %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", 每 \(n) 月" }
    public func commaMonthXThroughMonthX() -> String { ", %s 到 %s" }
    public func commaOnlyInX() -> String { ", 僅在 %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", 每週的每 \(n) 天" }
    public func commaStartingX(_ s: String) -> String { ", \(s) 開始" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", 每月的最後一天" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", 每月的最後一個工作日" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s 這個月的最後一天的前幾天" }
    public func lastDay() -> String { "最後一天" }
    public func firstWeekday() -> String { "第一個工作日" }
    public func weekdayNearestDayX() -> String { "最接近 %s 號的工作日" }
    public func commaOnTheX0OfTheMonth() -> String { ", 每月的 %s " }
    public func commaOnTheLastX0OfTheMonth() -> String { ", 每月的最後一個 %s " }
    public func commaOnThe() -> String { ", 在每月 " }
    public func spaceX0OfTheMonth() -> String { "%s " }
    public func first() -> String { "第一個" }
    public func second() -> String { "第二個" }
    public func third() -> String { "第三個" }
    public func fourth() -> String { "第四個" }
    public func fifth() -> String { "第五個" }

    public func everySecond() -> String { "每秒" }
    public func everyXSeconds(_ n: String) -> String { "每 \(n) 秒" }
    public func secondsXThroughXPastTheMinute() -> String { "在一分鐘後的 %s 到 %s 秒" }
    public func atXSecondsPastTheMinute() -> String { "在一分鐘後的 %s 秒" }

    public func daysOfTheWeek() -> [String] {
        ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
    }
    public func monthsOfTheYear() -> [String] {
        ["一月", "二月", "三月", "四月", "五月", "六月",
         "七月", "八月", "九月", "十月", "十一月", "十二月"]
    }
}
