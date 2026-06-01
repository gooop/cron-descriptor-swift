public struct HeLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { true }
    public func anErrorOccurred() -> String { "אירעה שגיאה בעת יצירת תיאור הביטוי. בדוק את תחביר הביטוי cron." }

    public func everyMinute() -> String { "כל דקה" }
    public func everyHour() -> String { "כל שעה" }
    public func onTheHour() -> String { "בשעה עגולה" }
    public func everyXMinutes(_ n: String) -> String { "כל \(n) דקות" }
    public func everyXHours(_ n: String) -> String { "כל \(n) שעות" }
    public func atSpace() -> String { "ב " }
    public func at() -> String { "ב" }
    public func spaceAnd() -> String { " ו" }
    public func atX() -> String { "ב %s" }
    public func atXMinutesPastTheHour() -> String { "ב %s דקות של השעה" }
    public func minutesXThroughXPastTheHour() -> String { "%s עד %s דקות של השעה" }
    public func betweenXAndX() -> String { "%s עד %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "כל דקה \(a) עד \(b)" }

    public func commaEveryDay() -> String { ", כל יום" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", כל \(n) ימים" }
    public func commaOnDayXOfTheMonth() -> String { ", ביום ה%s של החודש" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", בין היום ה%s וה%s של החודש" }
    public func commaOnlyOnX() -> String { ", רק ב %s" }
    public func commaAndOnX() -> String { ", וב %s" }
    public func commaXThroughX() -> String { ", %s עד %s" }
    public func commaAndXThroughX() -> String { ", ו %s עד %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", כל \(n) חודשים" }
    public func commaMonthXThroughMonthX() -> String { ", %s עד %s" }
    public func commaOnlyInX() -> String { ", רק ב %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", כל \(n) ימים בשבוע" }
    public func commaStartingX(_ s: String) -> String { ", החל מ \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", ביום האחרון של החודש" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", ביום החול האחרון של החודש" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s ימים לפני היום האחרון בחודש" }
    public func lastDay() -> String { "היום האחרון" }
    public func firstWeekday() -> String { "יום החול הראשון" }
    public func weekdayNearestDayX() -> String { "יום החול הראשון הקרוב אל %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", ביום ה%s של החודש" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", רק ב %s של החודש" }
    public func commaOnThe() -> String { ", ב " }
    public func spaceX0OfTheMonth() -> String { " %s של החודש" }
    public func first() -> String { "ראשון" }
    public func second() -> String { "שני" }
    public func third() -> String { "שלישי" }
    public func fourth() -> String { "רביעי" }
    public func fifth() -> String { "חמישי" }

    public func everySecond() -> String { "כל שניה" }
    public func everyXSeconds(_ n: String) -> String { "כל \(n) שניות" }
    public func secondsXThroughXPastTheMinute() -> String { "%s עד %s שניות של הדקה" }
    public func atXSecondsPastTheMinute() -> String { "ב %s שניות של הדקה" }

    public func daysOfTheWeek() -> [String] {
        ["יום ראשון", "יום שני", "יום שלישי", "יום רביעי", "יום חמישי", "יום שישי", "יום שבת"]
    }
    public func monthsOfTheYear() -> [String] {
        ["ינואר", "פברואר", "מרץ", "אפריל", "מאי", "יוני",
         "יולי", "אוגוסט", "ספטמבר", "אוקטובר", "נובמבר", "דצמבר"]
    }
}
