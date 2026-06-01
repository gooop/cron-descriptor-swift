import Testing
@testable import CronDescriptor

private func describe(_ expr: String, options: Options = Options()) throws -> String {
    try CronDescriptor.toString(expr, options: options)
}

struct CronDescriptorTests {

    // MARK: - Invalid expressions throw

    @Test("Invalid expressions throw", arguments: [
        "",
        "not-cron",
        "*****",
        "* * * *",
        "* * * * * *",
        "60 * * * *",
        "* 24 * * *",
        "* * 32 * *",
        "* * * 13 *",
        "* * * * 8",
    ]) func invalidExpression(expr: String) {
        #expect(throws: (any Error).self) { try describe(expr) }
    }

    // MARK: - Every minute / hour

    @Test func everyMinute() throws { #expect(try describe("* * * * *") == "Every minute") }
    @Test func everyHour()   throws { #expect(try describe("0 * * * *") == "Every hour") }

    // MARK: - Specific times

    @Test("Specific times", arguments: [
        ("0 0 * * *",   "At 12:00 AM"),
        ("0 9 * * *",   "At 9:00 AM"),
        ("0 12 * * *",  "At 12:00 PM"),
        ("0 21 * * *",  "At 9:00 PM"),
        ("30 9 * * *",  "At 9:30 AM"),
        ("15 14 * * *", "At 2:15 PM"),
    ]) func specificTime(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - Step values

    @Test("Every N minutes", arguments: [
        ("*/5 * * * *",  "Every 5 minutes"),
        ("*/15 * * * *", "Every 15 minutes"),
        ("*/30 * * * *", "Every 30 minutes"),
    ]) func everyNMinutes(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test func everyTwoHours() throws {
        #expect(try describe("0 */2 * * *") == "Every 2 hours")
    }

    // MARK: - Day of week

    @Test("DOW — single", arguments: [
        ("0 9 * * 1",   "At 9:00 AM, only on Monday"),
        ("0 9 * * Mon", "At 9:00 AM, only on Monday"),
        ("0 9 * * 0",   "At 9:00 AM, only on Sunday"),
        ("0 9 * * 5",   "At 9:00 AM, only on Friday"),
        ("0 0 * * Fri", "At 12:00 AM, only on Friday"),
    ]) func dowSingle(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test("DOW — range", arguments: [
        ("0 9 * * 1-5",     "At 9:00 AM, Monday through Friday"),
        ("0 9 * * Mon-Fri", "At 9:00 AM, Monday through Friday"),
        ("0 0 * * 1-5",     "At 12:00 AM, Monday through Friday"),
    ]) func dowRange(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - Hour range

    @Test func hourRange() throws {
        #expect(try describe("0 9-17 * * *") == "Every hour, between 9:00 AM and 5:00 PM")
    }

    @Test func hourRangeWithDow() throws {
        #expect(try describe("0 9-17 * * 1-5") == "Every hour, between 9:00 AM and 5:00 PM, Monday through Friday")
    }

    // MARK: - Multiple hours

    @Test func commaHours() throws {
        #expect(try describe("0 9,17 * * *") == "At 9:00 AM and 5:00 PM")
    }

    // MARK: - Multiple minutes

    @Test func commaMinutes() throws {
        #expect(try describe("0,30 * * * *") == "At 0 and 30 minutes past the hour")
    }

    // MARK: - Day of month

    @Test("Day of month", arguments: [
        ("0 0 1 * *",  "At 12:00 AM, on day 1 of the month"),
        ("0 0 15 * *", "At 12:00 AM, on day 15 of the month"),
        ("0 9 1 * *",  "At 9:00 AM, on day 1 of the month"),
    ]) func dayOfMonth(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    @Test func dayOfMonthCommaList() throws {
        #expect(try describe("0 9 1,15 * *") == "At 9:00 AM, on day 1 and 15 of the month")
    }

    // MARK: - Month

    @Test("Month constraints", arguments: [
        ("0 0 1 1 *",  "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 0 1 Jan *", "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 0 1 6 *",  "At 12:00 AM, on day 1 of the month, only in June"),
        ("0 0 * 6 *",  "At 12:00 AM, only in June"),
    ]) func monthConstraint(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - @-aliases

    @Test("@ aliases", arguments: [
        ("@hourly",   "Every hour"),
        ("@daily",    "At 12:00 AM"),
        ("@midnight", "At 12:00 AM"),
        ("@weekly",   "At 12:00 AM, only on Sunday"),
        ("@monthly",  "At 12:00 AM, on day 1 of the month"),
        ("@yearly",   "At 12:00 AM, on day 1 of the month, only in January"),
        ("@annually", "At 12:00 AM, on day 1 of the month, only in January"),
        ("@reboot",   "Run once, at startup"),
    ]) func atAliases(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }

    // MARK: - 24-hour format

    @Test("24-hour format") func format24Hour() throws {
        var opts = Options()
        opts.use24HourTimeFormat = true
        #expect(try describe("0 9 * * *",   options: opts) == "At 09:00")
        #expect(try describe("0 21 * * *",  options: opts) == "At 21:00")
        #expect(try describe("0 0 * * *",   options: opts) == "At 00:00")
        #expect(try describe("30 14 * * *", options: opts) == "At 14:30")
    }

    // MARK: - Verbose mode

    @Test("Verbose retains every-day") func verboseMode() throws {
        var opts = Options()
        opts.verbose = true
        let result = try describe("0 9 * * *", options: opts)
        #expect(result.contains("every day"))
    }

    // MARK: - Case-insensitive names

    @Test("Case-insensitive names", arguments: [
        ("0 9 * * mon",  "At 9:00 AM, only on Monday"),
        ("0 0 1 jan *",  "At 12:00 AM, on day 1 of the month, only in January"),
        ("0 9 * * MON",  "At 9:00 AM, only on Monday"),
    ]) func caseInsensitiveNames(expr: String, expected: String) throws {
        #expect(try describe(expr) == expected)
    }
}
