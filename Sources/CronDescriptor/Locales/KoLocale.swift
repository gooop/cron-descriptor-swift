public struct KoLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { false }
    public func anErrorOccurred() -> String { "표현식 설명을 생성하는 중 오류가 발생했습니다. cron 표현식 구문을 확인하십시오." }

    public func everyMinute() -> String { "1분마다" }
    public func everyHour() -> String { "1시간마다" }
    public func onTheHour() -> String { "정각" }
    public func everyXMinutes(_ n: String) -> String { "\(n)분마다" }
    public func everyXHours(_ n: String) -> String { "\(n)시간마다" }
    public func atSpace() -> String { "시간 " }
    public func at() -> String { "시간" }
    public func spaceAnd() -> String { " 및" }
    public func atX() -> String { "%s에서" }
    public func atXMinutesPastTheHour() -> String { "%s분" }
    public func minutesXThroughXPastTheHour() -> String { "%s~%s분" }
    public func betweenXAndX() -> String { "%s에서 %s 사이" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "매분 \(a)~\(b)" }

    public func commaEveryDay() -> String { ", 매일" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", \(n)일마다" }
    public func commaOnDayXOfTheMonth() -> String { ", 매월 %s일" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", 해당 월의 %s일에서 %s일까지" }
    public func commaOnlyOnX() -> String { ", %s에만" }
    public func commaAndOnX() -> String { ", 및 %s에" }
    public func commaXThroughX() -> String { ", %s에서 %s까지" }
    public func commaAndXThroughX() -> String { ", 및 %s에서 %s까지" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", \(n)개월마다" }
    public func commaMonthXThroughMonthX() -> String { ", %s에서 %s까지" }
    public func commaOnlyInX() -> String { ", %s에만" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", 주 중 \(n)일마다" }
    public func commaStartingX(_ s: String) -> String { ", \(s)부터" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", 해당 월의 마지막 날에" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", 매월 마지막 평일" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", 해당 월의 마지막 날 %s일 전" }
    public func lastDay() -> String { "마지막 날" }
    public func firstWeekday() -> String { "첫 번째 평일" }
    public func weekdayNearestDayX() -> String { "%s일과 가장 가까운 평일" }
    public func commaOnTheX0OfTheMonth() -> String { ", 매월 %s" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", 해당 월의 마지막 %s" }
    public func commaOnThe() -> String { ", 매월 " }
    public func spaceX0OfTheMonth() -> String { " %s" }
    public func first() -> String { "첫 번째" }
    public func second() -> String { "두 번째" }
    public func third() -> String { "세 번째" }
    public func fourth() -> String { "네 번째" }
    public func fifth() -> String { "다섯 번째" }

    public func everySecond() -> String { "1초마다" }
    public func everyXSeconds(_ n: String) -> String { "\(n)초마다" }
    public func secondsXThroughXPastTheMinute() -> String { "%s~%s초" }
    public func atXSecondsPastTheMinute() -> String { "%s초" }

    public func daysOfTheWeek() -> [String] {
        ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"]
    }
    public func monthsOfTheYear() -> [String] {
        ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
    }
}
