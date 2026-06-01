public struct ZhCnLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { false }
    public func anErrorOccurred() -> String { "生成表达式描述时发生了错误，请检查cron表达式语法。" }

    public func everyMinute() -> String { "每分钟" }
    public func everyHour() -> String { "每小时" }
    public func onTheHour() -> String { "整点" }
    public func everyXMinutes(_ n: String) -> String { "每隔 \(n) 分钟" }
    public func everyXHours(_ n: String) -> String { "每隔 \(n) 小时" }
    public func atSpace() -> String { "在" }
    public func at() -> String { "在" }
    public func spaceAnd() -> String { " 和" }
    public func atX() -> String { "在%s" }
    public func atXMinutesPastTheHour() -> String { "在整点后的第 %s 分钟" }
    public func minutesXThroughXPastTheHour() -> String { "在整点后的第 %s 到 %s 分钟" }
    public func betweenXAndX() -> String { "在 %s 和 %s 之间" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "在 \(a) 至 \(b) 之间的每分钟" }

    public func commaEveryDay() -> String { ", 每天" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", 每隔 \(n) 天" }
    public func commaOnDayXOfTheMonth() -> String { ", 限每月%s" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", 限每月的 %s 至 %s 之间" }
    public func commaOnlyOnX() -> String { ", 仅%s" }
    public func commaAndOnX() -> String { ", 或者为%s" }
    public func commaXThroughX() -> String { ", %s至%s" }
    public func commaAndXThroughX() -> String { ", 和%s至%s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", 每隔 \(n) 个月" }
    public func commaMonthXThroughMonthX() -> String { ", %s至%s" }
    public func commaOnlyInX() -> String { ", 仅限%s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", 每周的每 \(n) 天" }
    public func commaStartingX(_ s: String) -> String { ", \(s)开始" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", 限每月的最后一天" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", 限每月的最后一个工作日" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", 限每月最后%s天" }
    public func lastDay() -> String { "本月最后一天" }
    public func firstWeekday() -> String { "第一个工作日" }
    public func weekdayNearestDayX() -> String { "最接近 %s 号的工作日" }
    public func commaOnTheX0OfTheMonth() -> String { ", 限每月的%s" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", 限每月的最后一个%s" }
    public func commaOnThe() -> String { ", 限每月的" }
    public func spaceX0OfTheMonth() -> String { "%s" }
    public func first() -> String { "第一个" }
    public func second() -> String { "第二个" }
    public func third() -> String { "第三个" }
    public func fourth() -> String { "第四个" }
    public func fifth() -> String { "第五个" }

    public func everySecond() -> String { "每秒" }
    public func everyXSeconds(_ n: String) -> String { "每隔 \(n) 秒" }
    public func secondsXThroughXPastTheMinute() -> String { "在一分钟后的第 %s 到 %s 秒" }
    public func atXSecondsPastTheMinute() -> String { "在一分钟后的第 %s 秒" }

    public func daysOfTheWeek() -> [String] {
        ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"]
    }
    public func monthsOfTheYear() -> [String] {
        ["一月", "二月", "三月", "四月", "五月", "六月",
         "七月", "八月", "九月", "十月", "十一月", "十二月"]
    }
}
