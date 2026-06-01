public struct FaLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "خطایی در نمایش توضیحات این وظیفه رخ داد. لطفا ساختار آن را بررسی کنید." }

    public func everyMinute() -> String { "هر دقیقه" }
    public func everyHour() -> String { "هر ساعت" }
    public func onTheHour() -> String { "سر ساعت" }
    public func everyXMinutes(_ n: String) -> String { "هر \(n) دقیقه" }
    public func everyXHours(_ n: String) -> String { "هر \(n) ساعت" }
    public func atSpace() -> String { "در " }
    public func at() -> String { "در" }
    public func spaceAnd() -> String { " و" }
    public func atX() -> String { "در %s" }
    public func atXMinutesPastTheHour() -> String { "در %s دقیقه پس از ساعت" }
    public func minutesXThroughXPastTheHour() -> String { "دقیقه %s تا %s ساعت گذشته" }
    public func betweenXAndX() -> String { "بین %s و %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "هر دقیقه بین \(a) و \(b)" }

    public func commaEveryDay() -> String { ", هر روز" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", هر \(n) روز" }
    public func commaOnDayXOfTheMonth() -> String { ", در %s ماه" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", بین روز %s و %s ماه" }
    public func commaOnlyOnX() -> String { ", فقط در %s" }
    public func commaAndOnX() -> String { ", و در %s" }
    public func commaXThroughX() -> String { ", %s تا %s" }
    public func commaAndXThroughX() -> String { ", و %s تا %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", هر \(n) ماه" }
    public func commaMonthXThroughMonthX() -> String { ", %s تا %s" }
    public func commaOnlyInX() -> String { ", فقط در %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", هر \(n) روز از هفته" }
    public func commaStartingX(_ s: String) -> String { ", آغاز \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", در آخرین روز ماه" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", در آخرین روز ماه" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s روز قبل از آخرین روز ماه" }
    public func lastDay() -> String { "آخرین روز" }
    public func firstWeekday() -> String { "اولین روز" }
    public func weekdayNearestDayX() -> String { "روز نزدیک به روز %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", در %s ماه" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", در %s ماه" }
    public func commaOnThe() -> String { ", در " }
    public func spaceX0OfTheMonth() -> String { " %s ماه" }
    public func first() -> String { "اول" }
    public func second() -> String { "دوم" }
    public func third() -> String { "سوم" }
    public func fourth() -> String { "چهارم" }
    public func fifth() -> String { "پنجم" }

    public func everySecond() -> String { "هر ثانیه" }
    public func everyXSeconds(_ n: String) -> String { "هر \(n) ثانیه" }
    public func secondsXThroughXPastTheMinute() -> String { "ثانیه %s تا %s دقیقه گذشته" }
    public func atXSecondsPastTheMinute() -> String { "در %s قانیه از دقیقه گذشته" }

    public func daysOfTheWeek() -> [String] {
        ["یک‌شنبه", "دوشنبه", "سه‌شنبه", "چهارشنبه", "پنج‌شنبه", "جمعه", "شنبه"]
    }
    public func monthsOfTheYear() -> [String] {
        ["ژانویه", "فوریه", "مارس", "آپریل", "مه", "ژوئن",
         "ژوئیه", "آگوست", "سپتامبر", "اکتبر", "نوامبر", "دسامبر"]
    }
}
