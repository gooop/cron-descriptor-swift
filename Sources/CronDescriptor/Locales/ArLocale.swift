public struct ArLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "حدث خطأ في إنشاء وصف المصطلح٠ تأكد من تركيب مصطلح الكرون" }

    public func everyMinute() -> String { "كل دقيقة" }
    public func everyHour() -> String { "كل ساعة" }
    public func onTheHour() -> String { "في تمام الساعة" }
    public func everyXMinutes(_ n: String) -> String { "كل \(n) دقائق" }
    public func everyXHours(_ n: String) -> String { "كل \(n) ساعات" }
    public func atSpace() -> String { " " }
    public func at() -> String { "" }
    public func spaceAnd() -> String { " و" }
    public func atX() -> String { "%s" }
    public func atXMinutesPastTheHour() -> String { "الدقيقة %s من بداية الساعة" }
    public func minutesXThroughXPastTheHour() -> String { "الدقائق %s حتى %s من بداية الساعة" }
    public func betweenXAndX() -> String { "بين %s و %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "كل دقيقة بين \(a) و \(b)" }

    public func commaEveryDay() -> String { "، كل يوم" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : "، كل \(n) أيام" }
    public func commaOnDayXOfTheMonth() -> String { "، في اليوم %s من الشهر" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { "، بين يوم %s و %s من الشهر" }
    public func commaOnlyOnX() -> String { "، %s فقط" }
    public func commaAndOnX() -> String { "، وفي %s" }
    public func commaXThroughX() -> String { "، %s حتى %s" }
    public func commaAndXThroughX() -> String { "، و %s حتى %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : "، كل \(n) أشهر" }
    public func commaMonthXThroughMonthX() -> String { "، %s حتى %s" }
    public func commaOnlyInX() -> String { "، %s فقط" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : "، كل \(n) من أيام الأسبوع" }
    public func commaStartingX(_ s: String) -> String { "، بداية من \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { "، في اخر يوم من الشهر" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { "، في اخر يوم أسبوع من الشهر" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { "، %s أيام قبل اخر يوم من الشهر" }
    public func lastDay() -> String { "اليوم الأخير" }
    public func firstWeekday() -> String { "اول ايام الأسبوع" }
    public func weekdayNearestDayX() -> String { "يوم الأسبوع الأقرب ليوم %s" }
    public func commaOnTheX0OfTheMonth() -> String { "، في %s من الشهر" }
    public func commaOnTheLastX0OfTheMonth() -> String { "، في اخر %s من الشهر" }
    public func commaOnThe() -> String { "، في ال" }
    public func spaceX0OfTheMonth() -> String { " %s من الشهر" }
    public func first() -> String { "أول" }
    public func second() -> String { "ثاني" }
    public func third() -> String { "ثالث" }
    public func fourth() -> String { "رابع" }
    public func fifth() -> String { "خامس" }

    public func everySecond() -> String { "كل ثانية" }
    public func everyXSeconds(_ n: String) -> String { "كل \(n) ثواني" }
    public func secondsXThroughXPastTheMinute() -> String { "الثواني %s حتى %s من بداية الدقيقة" }
    public func atXSecondsPastTheMinute() -> String { "الثانية %s من بداية الدقيقة" }

    public func daysOfTheWeek() -> [String] {
        ["الأحد", "الإثنين", "الثلاثاء", "الأربعاء", "الخميس", "الجمعة", "السبت"]
    }
    public func monthsOfTheYear() -> [String] {
        ["يناير", "فبراير", "مارس", "ابريل", "مايو", "يونيو",
         "يوليو", "أغسطس", "سبتمبر", "أكتوبر", "نوفمبر", "ديسمبر"]
    }
}
