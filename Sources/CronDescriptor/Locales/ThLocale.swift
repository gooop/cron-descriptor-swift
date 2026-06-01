public struct ThLocale: CronLocale {
    public init() {}

    public func use24HourTimeFormatByDefault() -> Bool { false }
    public func anErrorOccurred() -> String { "เกิดข้อผิดพลาดขณะสร้างคำอธิบายนิพจน์ ตรวจสอบไวยากรณ์นิพจน์ครอน" }

    public func everyMinute() -> String { "ทุกๆ นาที" }
    public func everyHour() -> String { "ทุกๆ ชั่วโมง" }
    public func onTheHour() -> String { "ตรงชั่วโมง" }
    public func everyXMinutes(_ n: String) -> String { "ทุกๆ \(n) นาที" }
    public func everyXHours(_ n: String) -> String { "ทุกๆ \(n) ชั่วโมง" }
    public func atSpace() -> String { "เมื่อ " }
    public func at() -> String { "เมื่อ" }
    public func spaceAnd() -> String { " และ" }
    public func atX() -> String { "เมื่อ %s" }
    public func atXMinutesPastTheHour() -> String { "เมื่อ %s นาที ชั่วโมงที่ผ่านมา" }
    public func minutesXThroughXPastTheHour() -> String { "นาที %s ถึง %s ชั่วโมงที่ผ่านมา" }
    public func betweenXAndX() -> String { "ระหว่าง %s ถึง %s" }
    public func everyMinuteBetweenXAndX(_ a: String, _ b: String) -> String { "ทุกๆ นาที \(a) และ \(b)" }

    public func commaEveryDay() -> String { ", ทุกๆ วัน" }
    public func commaEveryXDays(_ n: String) -> String { n == "1" ? commaEveryDay() : ", ทุกๆ \(n) วัน" }
    public func commaOnDayXOfTheMonth() -> String { ", ในวัน %s ของเดือน" }
    public func commaBetweenDayXAndXOfTheMonth() -> String { ", ระหว่างวัน %s และ %s ของเดือน" }
    public func commaOnlyOnX() -> String { ", เท่านั้น %s" }
    public func commaAndOnX() -> String { ", และใน %s" }
    public func commaXThroughX() -> String { ", %s ถึง %s" }
    public func commaAndXThroughX() -> String { ", %s ถึง %s" }
    public func commaEveryXMonths(_ n: String) -> String { n == "1" ? "" : ", ทุกๆ \(n) เดือน" }
    public func commaMonthXThroughMonthX() -> String { ", %s ถึง %s" }
    public func commaOnlyInX() -> String { ", เท่านั้น %s" }
    public func commaEveryXDaysOfTheWeek(_ n: String) -> String { n == "1" ? "" : ", ทุกๆ \(n) วันของสัปดาห์" }
    public func commaStartingX(_ s: String) -> String { ", เริ่ม \(s)" }

    public func commaOnTheLastDayOfTheMonth() -> String { ", ในวันสิ้นเดือน" }
    public func commaOnTheLastWeekdayOfTheMonth() -> String { ", ในวันธรรมดาสุดท้ายของเดือน" }
    public func commaDaysBeforeTheLastDayOfTheMonth() -> String { ", %s วันก่อนวันสุดท้ายของเดือน" }
    public func lastDay() -> String { "วันสุดท้าย" }
    public func firstWeekday() -> String { "วันธรรมดาวันแรก" }
    public func weekdayNearestDayX() -> String { "วันธรรมดาที่ใกล้ที่สุด %s" }
    public func commaOnTheX0OfTheMonth() -> String { ", ในวัน %s ของเดือน" }
    public func commaOnTheLastX0OfTheMonth() -> String { ", ณ สุดท้าย %s ของเดือน" }
    public func commaOnThe() -> String { ", ในวัน " }
    public func spaceX0OfTheMonth() -> String { " %s ของเดือน" }
    public func first() -> String { "แรก" }
    public func second() -> String { "ที่สอง" }
    public func third() -> String { "ที่สาม" }
    public func fourth() -> String { "ที่สี่" }
    public func fifth() -> String { "ที่ห้า" }

    public func everySecond() -> String { "ทุกๆ วินาที" }
    public func everyXSeconds(_ n: String) -> String { "ทุกๆ \(n) วินาที" }
    public func secondsXThroughXPastTheMinute() -> String { "วินาที %s ถึง %s นาทีที่ผ่านมา" }
    public func atXSecondsPastTheMinute() -> String { "เมื่อ %s วินาที นาทีที่ผ่านมา" }

    public func daysOfTheWeek() -> [String] {
        ["วันอาทิตย์", "วันจันทร์", "วันอังคาร", "วันพุธ", "วันพฤหัสบดี", "วันศุกร์", "วันเสาร์"]
    }
    public func monthsOfTheYear() -> [String] {
        ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน",
         "กรกฎาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"]
    }
}
