public struct JaLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "式の記述を生成する際にエラーが発生しました。Cron 式の構文を確認してください。" }

    public func everyMinute() -> String { "毎分" }
    public func everyHour() -> String { "毎時" }
    public func onTheHour() -> String { "時ちょうど" }
    public func everyXMinutes(_ n: String) -> String { "\(n) 分ごと" }
    public func everyXHours(_ n: String) -> String { "\(n) 時間ごと" }
    public func atSpace() -> String { "次において実施" }
    public func at() -> String { "次において実施" }
    public func spaceAnd() -> String { "と" }
    public func atX() -> String { "次において実施 %s" }
    public func atXMinutesPastTheHour() -> String { "毎時 %s 分過ぎ" }
    public func minutesXThroughXPastTheHour() -> String { "毎時 %s 分から %s 分まで" }
    public func betweenXAndX() -> String { "%s と %s の間" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "\(a) から \(b) まで毎分" }

    public func commaEveryDay() -> String { "、毎日" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : "、\(n) 日ごと" }
    public func commaOnDayXOfTheMonth() -> String { "、月の %s 日目" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { "、月の %s 日から %s 日の間" }
    public func commaOnlyOnX() -> String { "%s にのみ" }
    public func commaAndOnX() -> String { "、〜と %s" }
    public func commaXThroughX() -> String { "、%s から %s まで" }
    public func commaAndXThroughX() -> String { "、%s から %s まで" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : "、\(n) か月ごと" }
    public func commaMonthXThroughMonthX() -> String { "、%s から %s まで" }
    public func commaOnlyInX() -> String { "%s でのみ" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : "、週のうち \(n) 日ごと" }
    public func commaStartingX(_ s: String) -> String { "、\(s) に開始" }

    public func commaOnTheLastDayOfTheMonth() -> String { "次の最終日に" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { "月の最後の平日に" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { "月の最終日の %s 日前" }
    public func lastDay() -> String { "最終日" }
    public func firstWeekday() -> String { "最初の平日" }
    public func weekdayNearestDayX() -> String { "%s 日の直近の平日" }
    public func commaOnTheX0OfTheMonth() -> String { "月の %s に" }
    public func commaOnTheLastX0OfTheMonth() -> String { "月の最後の %s に" }
    public func commaOnThe() -> String { "次に" }
    public func spaceX0OfTheMonth() -> String { "月のうち %s" }
    public func first() -> String { "1 番目" }
    public func second() -> String { "2 番目" }
    public func third() -> String { "3 番目" }
    public func fourth() -> String { "4 番目" }
    public func fifth() -> String { "5 番目" }

    public func everySecond() -> String { "毎秒" }
    public func everyXSeconds(_ n: String) -> String { "\(n) 秒ごと" }
    public func secondsXThroughXPastTheMinute() -> String { "毎分 %s 秒から %s 秒まで" }
    public func atXSecondsPastTheMinute() -> String { "毎分 %s 秒過ぎ" }

    public func daysOfTheWeek() -> [String] {
        ["日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日", "土曜日"]
    }
    public func monthsOfTheYear() -> [String] {
        ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
    }
}
