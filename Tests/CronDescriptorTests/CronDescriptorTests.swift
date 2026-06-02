@testable import CronDescriptor
import Testing

private func describe(_ expr: String, options: Options = Options()) throws -> String {
    try CronDescriptor.toString(expr, options: options)
}

private func describeOrError(_ expr: String, options: Options = Options()) -> String {
    CronDescriptor.toStringOrError(expr, options: options)
}

struct CronDescriptorTests {
    // MARK: - Invalid expressions throw

    @Test("Invalid expressions throw", arguments: [
        "",
        "not-cron",
        "*****",
        "* * * *",
        "* * * * * * *",
        "60 * * * *",
        "* 24 * * *",
        "* * 32 * *",
        "* * * 13 *",
        "* * * * 8",
    ]) func invalidExpression(expr: String) {
        #expect(throws: (any Error).self) { try describe(expr) }
    }

    // MARK: - Every minute / hour

    @Test func everyMinute() throws {
        #expect(try describe("* * * * *") == "Every minute")
    }

    @Test func everyHour() throws {
        #expect(try describe("0 * * * *") == "Every hour")
    }

    // MARK: - Specific times

    @Test("Specific times", arguments: [
        ("0 0 * * *", "At 12:00 AM"),
        ("0 9 * * *", "At 09:00 AM"),
        ("0 12 * * *", "At 12:00 PM"),
        ("0 21 * * *", "At 09:00 PM"),
        ("30 9 * * *", "At 09:30 AM"),
        ("15 14 * * *", "At 02:15 PM"),
    ]) func specificTime(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - Step values

    @Test("Every N minutes", arguments: [
        ("*/5 * * * *", "Every 5 minutes"),
        ("*/15 * * * *", "Every 15 minutes"),
        ("*/30 * * * *", "Every 30 minutes"),
    ]) func everyNMinutes(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test func everyTwoHours() throws {
        #expect(try describe("0 */2 * * *") == "On the hour, every 2 hours")
    }

    // MARK: - Day of week

    @Test("DOW — single", arguments: [
        ("0 9 * * 1", "At 09:00 AM, only on Monday"),
        ("0 9 * * Mon", "At 09:00 AM, only on Monday"),
        ("0 9 * * 0", "At 09:00 AM, only on Sunday"),
        ("0 9 * * 5", "At 09:00 AM, only on Friday"),
        ("0 0 * * Fri", "At 12:00 AM, only on Friday"),
    ]) func dowSingle(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test("DOW — range", arguments: [
        ("0 9 * * 1-5", "At 09:00 AM, Monday through Friday"),
        ("0 9 * * Mon-Fri", "At 09:00 AM, Monday through Friday"),
        ("0 0 * * 1-5", "At 12:00 AM, Monday through Friday"),
    ]) func dowRange(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - Hour range

    @Test func hourRange() throws {
        #expect(try describe("0 9-17 * * *") == "Every hour, between 09:00 AM and 05:00 PM")
    }

    @Test func hourRangeWithDow() throws {
        #expect(try describe("0 9-17 * * 1-5") == "Every hour, between 09:00 AM and 05:00 PM, Monday through Friday")
    }

    // MARK: - Multiple hours

    @Test func commaHours() throws {
        #expect(try describe("0 9,17 * * *") == "At 09:00 AM and 05:00 PM")
    }

    // MARK: - Multiple minutes

    @Test func commaMinutes() throws {
        #expect(try describe("0,30 * * * *") == "At 0 and 30 minutes past the hour")
    }

    // MARK: - Day of month

    @Test("Day of month", arguments: [
        ("0 0 1 * *", "At 12:00 AM, on day 1 of the month"),
        ("0 0 15 * *", "At 12:00 AM, on day 15 of the month"),
        ("0 9 1 * *", "At 09:00 AM, on day 1 of the month"),
    ]) func dayOfMonth(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test func dayOfMonthCommaList() throws {
        #expect(try describe("0 9 1,15 * *") == "At 09:00 AM, on day 1 and 15 of the month")
    }

    // MARK: - Month

    @Test("Month constraints", arguments: [
        ("0 0 1 1 *", "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 0 1 Jan *", "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 0 1 6 *", "At 12:00 AM, on day 1 of the month, only in June"),
        ("0 0 * 6 *", "At 12:00 AM, only in June"),
    ]) func monthConstraint(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - @-aliases

    @Test("@ aliases", arguments: [
        ("@hourly", "Every hour"),
        ("@daily", "At 12:00 AM"),
        ("@midnight", "At 12:00 AM"),
        ("@weekly", "At 12:00 AM, only on Sunday"),
        ("@monthly", "At 12:00 AM, on day 1 of the month"),
        ("@yearly", "At 12:00 AM, on day 1 of the month, only in January"),
        ("@annually", "At 12:00 AM, on day 1 of the month, only in January"),
        ("@reboot", "Run once, at startup"),
    ]) func atAliases(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - 24-hour format

    @Test("24-hour format") func format24Hour() throws {
        var opts = Options()
        opts.use24HourTimeFormat = true
        #expect(try describe("0 9 * * *", options: opts) == "At 09:00")
        #expect(try describe("0 21 * * *", options: opts) == "At 21:00")
        #expect(try describe("0 0 * * *", options: opts) == "At 00:00")
        #expect(try describe("30 14 * * *", options: opts) == "At 14:30")
    }

    // MARK: - trimHoursLeadingZero

    @Test func trimHoursLeadingZero() throws {
        var opts = Options()
        opts.trimHoursLeadingZero = true
        #expect(try describe("30 10 * * *", options: opts) == "At 10:30 AM") // 2-digit, no change
        #expect(try describe("29 9 * * *", options: opts) == "At 9:29 AM") // single-digit trimmed

        var opts24 = Options()
        opts24.trimHoursLeadingZero = true
        opts24.use24HourTimeFormat = true
        #expect(try describe("31 10 * * *", options: opts24) == "At 10:31") // 24h 2-digit, no change
        #expect(try describe("30 9 * * *", options: opts24) == "At 9:30") // 24h single-digit trimmed
        #expect(try describe("0 0 * * *", options: opts24) == "At 0:00") // 24h midnight trimmed
    }


    // MARK: - Verbose mode

    @Test("Verbose retains every-day") func verboseMode() throws {
        var opts = Options()
        opts.verbose = true
        let result = try describe("0 9 * * *", options: opts)
        #expect(result.contains("every day"))
    }

    @Test func verboseStepOneNormalizationInDow() throws {
        var opts = Options()
        opts.verbose = true
        #expect(try describe("*/1 */1 */1 */1 */1", options: opts) == "Every minute, every hour, every day")
    }

    // MARK: - Case-insensitive names

    @Test("Case-insensitive names", arguments: [
        ("0 9 * * mon", "At 09:00 AM, only on Monday"),
        ("0 0 1 jan *", "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 9 * * MON", "At 09:00 AM, only on Monday"),
    ]) func caseInsensitiveNames(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - Whitespace normalization

    @Test("Whitespace normalization", arguments: [
        ("  * * * * *  ", "Every minute"),
        ("*  *  *  *  *", "Every minute"),
        ("0 9 * * * ", "At 09:00 AM"),
    ]) func whitespaceNormalization(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - ? wildcard

    @Test func questionMarkWildcard() throws {
        #expect(try describe("0 9 ? * *") == "At 09:00 AM")
        #expect(try describe("0 0 * * ?") == "At 12:00 AM")
    }

    // MARK: - DOW 7 = Sunday alias

    @Test func dow7IsSunday() throws {
        #expect(try describe("0 0 * * 7") == "At 12:00 AM, only on Sunday")
    }

    // MARK: - 0/n → */n normalization

    @Test func zeroSlashNormalization() throws {
        #expect(try describe("0/5 * * * *") == "Every 5 minutes")
        #expect(try describe("0 0/2 * * *") == "On the hour, every 2 hours")
    }

    // MARK: - Minute range

    @Test func minuteRangeSpecificHour() throws {
        #expect(try describe("0-10 11 * * *") == "Every minute between 11:00 AM and 11:10 AM")
    }

    @Test func minuteRangeWildHour() throws {
        #expect(try describe("0-30 * * * *") == "Minutes 0 through 30 past the hour")
    }

    // MARK: - Step from non-zero start

    @Test func minuteStepFromOffset() throws {
        #expect(try describe("1/5 * * * *") == "Every 5 minutes, starting at 1 minutes past the hour")
    }

    @Test func hourStepFromOffset() throws {
        #expect(try describe("0 2/3 * * *") == "On the hour, every 3 hours, starting at 02:00 AM")
    }

    // MARK: - DOM range and step

    @Test func domRange() throws {
        #expect(try describe("0 0 1-15 * *") == "At 12:00 AM, between day 1 and 15 of the month")
    }

    // MARK: - Month range and step

    @Test("Month range", arguments: [
        ("0 0 * 1-3 *", "At 12:00 AM, January through March"),
        ("0 0 * JAN-MAR *", "At 12:00 AM, January through March"),
    ]) func monthRange(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test func monthStep() throws {
        #expect(try describe("0 0 1 */3 *") == "At 12:00 AM, on day 1 of the month, every 3 months")
    }

    // MARK: - Multiple comma values

    @Test func commaMultipleMonths() throws {
        #expect(try describe("0 0 * 3,6 *") == "At 12:00 AM, only in March and June")
    }

    @Test func commaDow() throws {
        #expect(try describe("0 9 * * 1,3") == "At 09:00 AM, only on Monday and Wednesday")
    }

    @Test func commaMultipleMinutes() throws {
        #expect(try describe("0,15,30,45 * * * *") == "At 0, 15, 30, and 45 minutes past the hour")
    }

    @Test func commaMultipleHours() throws {
        #expect(try describe("0 6,12,18 * * *") == "At 06:00 AM, 12:00 PM and 06:00 PM")
    }

    // MARK: - DOM + DOW both specified

    @Test func domAndDowBothSpecified() throws {
        #expect(try describe("0 0 1 * 1") == "At 12:00 AM, on day 1 of the month, and on Monday")
    }

    // MARK: - Verbose full description

    @Test func verboseEveryMinute() throws {
        var opts = Options()
        opts.verbose = true
        #expect(try describe("* * * * *", options: opts) == "Every minute, every hour, every day")
    }

    // MARK: - 6-field (seconds)

    @Test("6-field seconds", arguments: [
        ("* * * * * *", "Every second"),
        ("*/30 * * * * *", "Every 30 seconds"),
        ("0 * * * * *", "Every minute"),
        ("30 0 9 * * *", "At 30 seconds past the minute, at 09:00 AM"),
        ("0 30 9 * * *", "At 09:30 AM"),
        ("*/5 * * * * *", "Every 5 seconds"),
    ]) func sixFieldSeconds(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - toStringOrError

    @Test func toStringOrErrorValid() {
        #expect(describeOrError("* * * * *") == "Every minute")
    }

    @Test func toStringOrErrorInvalid() {
        let result = describeOrError("not-cron")
        #expect(result == EnLocale().anErrorOccurred())
        #expect(!result.isEmpty)
    }

    // MARK: - L modifier

    @Test("L — DOM", arguments: [
        ("0 0 L * *", "At 12:00 AM, on the last day of the month"),
        ("0 0 LW * *", "At 12:00 AM, on the last weekday of the month"),
        ("0 0 WL * *", "At 12:00 AM, on the last weekday of the month"),
        ("0 0 L-5 * *", "At 12:00 AM, 5 days before the last day of the month"),
    ]) func lModifierDom(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test("L — DOW (last weekday of month)", arguments: [
        ("0 0 * * 5L", "At 12:00 AM, on the last Friday of the month"),
        ("0 0 * * 1L", "At 12:00 AM, on the last Monday of the month"),
    ]) func lModifierDow(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - W modifier

    @Test("W — nearest weekday", arguments: [
        ("0 0 1W * *", "At 12:00 AM, on the first weekday of the month"),
        ("0 0 15W * *", "At 12:00 AM, on the weekday nearest day 15 of the month"),
    ]) func wModifier(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test func wModifierInvalidRange() {
        #expect(throws: (any Error).self) { try describe("0 0 1W,15W * *") }
        #expect(throws: (any Error).self) { try describe("0 0 1W-5W * *") }
    }

    // MARK: - # modifier

    @Test("# — Nth weekday", arguments: [
        ("0 0 * * 1#1", "At 12:00 AM, on the first Monday of the month"),
        ("0 0 * * 1#2", "At 12:00 AM, on the second Monday of the month"),
        ("0 0 * * 5#3", "At 12:00 AM, on the third Friday of the month"),
        ("0 0 * * 0#4", "At 12:00 AM, on the fourth Sunday of the month"),
    ]) func hashModifier(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - monthStartIndexZero = true

    @Test func monthZeroBased() throws {
        var opts = Options()
        opts.monthStartIndexZero = true
        #expect(try describe("0 0 1 0 *", options: opts) == "At 12:00 AM, on day 1 of the month, only in January")
        #expect(try describe("0 0 1 5 *", options: opts) == "At 12:00 AM, on day 1 of the month, only in June")
        #expect(try describe("0 0 * 0-2 *", options: opts) == "At 12:00 AM, January through March")
        #expect(try describe("0 0 1 */3 *", options: opts) == "At 12:00 AM, on day 1 of the month, every 3 months")
    }

    // MARK: - dayOfWeekStartIndexZero = false

    @Test func dowOneBased() throws {
        var opts = Options()
        opts.dayOfWeekStartIndexZero = false
        #expect(try describe("0 9 * * 2", options: opts) == "At 09:00 AM, only on Monday")
    }

    @Test("DOW one-based: 0 is out of range and should throw", arguments: [
        "0 0 * * 0",
        "0 0 1 1 0",
        "0 0 * * 0,6",
        "0 0 * * 0-6",
        "0 0 * * 0-7",
        "0 0 * * 0#1",
        "0 0 * * 0L",
    ]) func dowOneBasedZeroIsInvalid(expr: String) {
        var opts = Options()
        opts.dayOfWeekStartIndexZero = false
        #expect(throws: (any Error).self) { try describe(expr, options: opts) }
    }

    @Test("DOW one-based: named days must not be shifted", arguments: [
        ("0 0 * * MON",     "At 12:00 AM, only on Monday"),
        ("0 0 * * SAT",     "At 12:00 AM, only on Saturday"),
        ("0 0 * * MON-FRI", "At 12:00 AM, Monday through Friday"),
        ("0 0 * * SAT,SUN", "At 12:00 AM, only on Saturday and Sunday"),
        ("0 0 * * SUN-SAT", "At 12:00 AM, Sunday through Saturday"),
    ]) func dowOneBasedNamedDaysNotShifted(expr: String, expected: String) throws {
        var opts = Options()
        opts.dayOfWeekStartIndexZero = false
        #expect(try describe(expr, options: opts) == expected)
    }

    @Test("DOW one-based: step values must not be shifted", arguments: [
        ("*/15 */6 */10 */3 */2", "Every 15 minutes, every 6 hours, every 10 days in a month, every 2 days of the week, every 3 months"),
        ("0 0 1-10/3 1-6/2 1-5/2", "At 12:00 AM, every 3 days in a month, between day 1 and 10 of the month, every 2 days of the week, Sunday through Thursday, every 2 months, January through June"),
    ]) func dowOneBasedStepNotShifted(expr: String, expected: String) throws {
        var opts = Options()
        opts.dayOfWeekStartIndexZero = false
        #expect(try describe(expr, options: opts) == expected)
    }

    // MARK: - Additional coverage (cRonstrue parity)

    @Test func stepOfOneNormalized() throws {
        #expect(try describe("*/1 * * * *") == "Every minute")
    }

    @Test func everyMinuteOnlyInMarch() throws {
        #expect(try describe("* * * 3 *") == "Every minute, only in March")
    }

    @Test func every4Hours() throws {
        #expect(try describe("0 */4 * * *") == "On the hour, every 4 hours")
    }

    @Test func dowStep() throws {
        #expect(try describe("* * * * */2") == "Every minute, every 2 days of the week")
    }

    @Test func multipleHoursWithMinutes() throws {
        #expect(try describe("30 14,16 * * *") == "At 02:30 PM and 04:30 PM")
    }

    @Test func mixedMinuteListAndRange() throws {
        #expect(try describe("2,4-5 1 * * *") == "At 2 and 4 through 5 minutes past the hour, at 01:00 AM")
    }

    @Test func lInDomCommaList() throws {
        #expect(try describe("0 20 15,L * *") == "At 08:00 PM, on day 15 and the last day of the month")
    }

    @Test func rangeToLInDom() throws {
        #expect(try describe("0 20 1-10,20-L * *") == "At 08:00 PM, on day 1 through 10 and 20 through the last day of the month")
    }

    @Test func hourRangeEndExpansion() throws {
        // When minutes are wildcard, hour range end expands to X:59
        #expect(try describe("* 9-17 * * *") == "Every minute, between 09:00 AM and 05:59 PM")
        #expect(try describe("* 10-12 * * *") == "Every minute, between 10:00 AM and 12:59 PM")
        // Non-wildcard minutes: no expansion
        #expect(try describe("0 9-17 * * *") == "Every hour, between 09:00 AM and 05:00 PM")
    }

    @Test func domCommaSorted() throws {
        #expect(try describe("0 45 12 22,17,6,30,26 * *") == "At 12:45 PM, on day 6, 17, 22, 26, and 30 of the month")
    }

    @Test func dowStepFromOffset() throws {
        #expect(try describe("0 0 * * 1/2") == "At 12:00 AM, every 2 days of the week, starting only on Monday")
    }

    // MARK: - Wildcard minute + specific hour

    @Test func wildcardMinuteSpecificHour() throws {
        #expect(try describe("* 0 * * *") == "Every minute, between 12:00 AM and 12:59 AM")
        #expect(try describe("* 9 * * *") == "Every minute, between 09:00 AM and 09:59 AM")
        #expect(try describe("* 14 * * *") == "Every minute, between 02:00 PM and 02:59 PM")
    }

    // MARK: - Gaps found via cRonstrue comparison

    @Test func domStepDescriptionMissingInAMonth() throws {
        #expect(try describe("0 0 1-15/2 * *") == "At 12:00 AM, every 2 days in a month, between day 1 and 15 of the month")
    }

    @Test func dowRangeExtraAndWhenDomSpecified() throws {
        #expect(try describe("0 0 1 JAN MON-FRI") == "At 12:00 AM, on day 1 of the month, Monday through Friday, only in January")
    }

    @Test func dowRangeStepWithSevenAlias() throws {
        #expect(try describe("0 0 * * 0-7/7") == "At 12:00 AM, every 7 days of the week, Sunday through Sunday")
    }

    @Test func hourRangeEndExpansionWithEffectiveFullMinutes() throws {
        #expect(try describe("1-59/2 0-23/3 * * *") == "Every 2 minutes, minutes 1 through 59 past the hour, every 3 hours, between 12:00 AM and 11:59 PM")
    }

    @Test func dowListSortingWithSevenAlias() throws {
        #expect(try describe("0 0 * * 7,1,7,2,7,3,7,4,7,5,7,6,7") == "At 12:00 AM, only on Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday, Sunday, Sunday, Sunday, Sunday, Sunday, and Sunday")
    }

    @Test func emptyStepInDOWFieldCausesError() throws {
        #expect(try describe("*/5 */4 */3 */2 */") == "Every 5 minutes, every 4 hours, every 3 days in a month, every  days of the week, every 2 months")
    }

    // MARK: - cRonstrue parity: not necessarily correct, but from fuzz testing where there were differences between cRonstrue and this cron-descriptor-swift

    @Test("Extended names — partial names throw", arguments: [
        "0 0 * * MonDay",
    ]) func extendedNamesThrow(expr: String) {
        #expect(throws: (any Error).self) { try describe(expr) }
    }

    @Test("Extended names — mixed-case valid", arguments: [
        ("0 0 1 jAn *", "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 0 * * mOn", "At 12:00 AM, only on Monday"),
    ]) func extendedNamesMixedCase(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test("Impossible dates — described, not rejected", arguments: [
        ("0 0 29 FEB *", "At 12:00 AM, on day 29 of the month, only in February"),
        ("0 0 31 APR *", "At 12:00 AM, on day 31 of the month, only in April"),
        ("0 0 30 FEB *", "At 12:00 AM, on day 30 of the month, only in February"),
        ("0 0 31 SEP *", "At 12:00 AM, on day 31 of the month, only in September"),
        ("0 0 31 JUN *", "At 12:00 AM, on day 31 of the month, only in June"),
        ("0 0 31 NOV *", "At 12:00 AM, on day 31 of the month, only in November"),
        ("0 0 31 * 0", "At 12:00 AM, on day 31 of the month, and on Sunday"),
    ]) func impossibleDates(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test("Mixed names and numbers — valid", arguments: [
        ("0 0 1 JAN,2,FEB,3 *", "At 12:00 AM, on day 1 of the month, only in January, February, February, and March"),
        ("0 0 * * 1,MON,3,TUE", "At 12:00 AM, only on Monday, Monday, Wednesday, and Tuesday"),
        ("0 0 * JAN,2,MAR,4 *", "At 12:00 AM, only in January, February, March, and April"),
        ("0 0 * * MON,3,WED,5", "At 12:00 AM, only on Monday, Wednesday, Wednesday, and Friday"),
    ]) func mixedNamesNumbersValid(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test("Mixed names and numbers — invalid field cross-contamination", arguments: [
        "0 0 1 1,JAN,15 *",
        "0 0 1-15,JAN-MAR * *",
        "0 0 1,15,JAN,FEB * *",
    ]) func mixedNamesNumbersErrors(expr: String) {
        #expect(throws: (any Error).self) { try describe(expr) }
    }

    @Test func monthCommaListWithStepMissingSeparator() throws {
        #expect(try describe("0 0 * */3,6 *") == "At 12:00 AM, every 3 months and only in June")
    }

    @Test func monthPureRangeFirstInStepListMissingSeparator() throws {
        #expect(try describe("0 0 * 1-3,4-6/2 *") == "At 12:00 AMJanuary through March and , every 2 months, April through June")
    }

    @Test func wrapAroundMinuteRange() throws {
        #expect(try describe("20-10 * * * *") == "Minutes 20 through 10 past the hour")
    }

    @Test("Redundant full ranges", arguments: [
        ("0-59 * * * *", "Minutes 0 through 59 past the hour"),
        ("0-59/1 * * * *", "Every 1 minutes, minutes 0 through 59 past the hour"),
        ("0-23/1 * * * *", "Every 1 minutes, minutes 0 through 23 past the hour"),
        ("1-31/1 * * * *", "Every 1 minutes, minutes 1 through 31 past the hour"),
        ("1-12/1 * * * *", "Every 1 minutes, minutes 1 through 12 past the hour"),
        ("0-6/1 * * * *", "Every 1 minutes, minutes 0 through 6 past the hour"),
        ("0-7/1 * * * *", "Every 1 minutes, minutes 0 through 7 past the hour"),
    ]) func redundantFullRanges(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - EsLocale bugs

    @Test("EsLocale #modifier — spaceX0OfTheMonth contains extra %s", arguments: [
        ("0 0 * * 1#1", "A las 00:00, en el primero lunes del mes"),
        ("0 0 * * 1#2", "A las 00:00, en el segundo lunes del mes"),
        ("0 0 * * 5#3", "A las 00:00, en el tercer viernes del mes"),
        ("0 0 * * 0#4", "A las 00:00, en el cuarto domingo del mes"),
    ]) func esLocaleHashModifier(expr: String, expected: String) throws {
        var opts = Options()
        opts.locale = EsLocale()
        #expect(try describe(expr, options: opts) == expected)
    }

    @Test("EsLocale DOW range missing 'y' when DOM specified", arguments: [
        ("0 0 1 JAN MON-FRI", "A las 00:00, el día 1 del mes, y de lunes a viernes, sólo en enero"),
        ("0 0 1 1 1-5",       "A las 00:00, el día 1 del mes, y de lunes a viernes, sólo en enero"),
        ("0 0 1,15 * 1-5",    "A las 00:00, el día 1 y 15 del mes, y de lunes a viernes"),
        ("0 0 1-10 1-6 1-5",  "A las 00:00, entre los días 1 y 10 del mes, y de lunes a viernes, de enero a junio"),
        ("0 0 L * MON-FRI",   "A las 00:00, en el último día del mes, y de lunes a viernes"),
    ]) func esLocaleDowRangeWithDom(expr: String, expected: String) throws {
        var opts = Options()
        opts.locale = EsLocale()
        #expect(try describe(expr, options: opts) == expected)
    }
}
