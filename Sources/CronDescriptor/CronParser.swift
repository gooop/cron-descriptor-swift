import Foundation

struct CronParser {
    private static let dowNames = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    private static let monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]

    private let expression: String
    private let dayOfWeekStartIndexZero: Bool

    init(_ expression: String, dayOfWeekStartIndexZero: Bool = true) {
        self.expression = expression
        self.dayOfWeekStartIndexZero = dayOfWeekStartIndexZero
    }

    // Returns 5-element array: [minute, hour, dom, month, dow]
    func parse() throws -> [String] {
        let upper = expression.trimmingCharacters(in: .whitespaces).uppercased()

        // @-aliases
        switch upper {
        case "@REBOOT": return ["@reboot", "", "", "", ""]
        case "@YEARLY", "@ANNUALLY": return ["0", "0", "1", "1", "*"]
        case "@MONTHLY": return ["0", "0", "1", "*", "*"]
        case "@WEEKLY": return ["0", "0", "*", "*", "0"]
        case "@DAILY", "@MIDNIGHT": return ["0", "0", "*", "*", "*"]
        case "@HOURLY": return ["0", "*", "*", "*", "*"]
        default: break
        }

        var parts = expression.trimmingCharacters(in: .whitespaces)
            .components(separatedBy: .whitespaces)
            .filter { !$0.isEmpty }

        guard parts.count == 5 else {
            throw CronDescriptorError.parseError("Expression must have exactly 5 fields, found \(parts.count)")
        }

        // Normalize each field
        parts[0] = try normalize(parts[0], field: .minute)
        parts[1] = try normalize(parts[1], field: .hour)
        parts[2] = try normalize(parts[2], field: .dom)
        parts[3] = try normalizeMonth(parts[3])
        parts[4] = try normalizeDow(parts[4])

        // Validate ranges
        try validate(parts[0], range: 0...59, field: "minute")
        try validate(parts[1], range: 0...23, field: "hour")
        try validate(parts[2], range: 1...31, field: "day of month")
        try validate(parts[3], range: 1...12, field: "month")
        try validate(parts[4], range: 0...6, field: "day of week")

        return parts
    }

    // MARK: - Normalization

    private enum Field { case minute, hour, dom }

    private func normalize(_ field: String, field fieldType: Field) throws -> String {
        var f = field
        if f == "?" { f = "*" }
        // 0/n → */n
        if f.hasPrefix("0/") { f = "*/" + f.dropFirst(2) }
        return f
    }

    private func normalizeMonth(_ field: String) throws -> String {
        var f = field
        if f == "?" { f = "*" }
        if f.hasPrefix("0/") { f = "*/" + f.dropFirst(2) }
        // Replace month names (case-insensitive already uppercased by caller? No — field comes from original)
        let upper = f.uppercased()
        var result = upper
        for (i, name) in CronParser.monthNames.enumerated() {
            result = result.replacingOccurrences(of: name, with: String(i + 1))
        }
        return result
    }

    private func normalizeDow(_ field: String) throws -> String {
        var f = field
        if f == "?" { f = "*" }
        if f.hasPrefix("0/") { f = "*/" + f.dropFirst(2) }
        var result = f.uppercased()
        for (i, name) in CronParser.dowNames.enumerated() {
            result = result.replacingOccurrences(of: name, with: String(i))
        }
        if dayOfWeekStartIndexZero {
            // 7 is an alias for Sunday (0)
            result = replaceTokens(in: result) { token in
                if let n = Int(token), n == 7 { return "0" }
                return token
            }
        } else {
            // User uses 1-indexed (Sun=1, Sat=7). Normalize to 0-indexed.
            result = replaceTokens(in: result) { token in
                if let n = Int(token), n >= 1 { return String(n - 1) }
                return token
            }
        }
        return result
    }

    // Replace each standalone numeric token in a cron field value using a transform.
    private func replaceTokens(in expression: String, transform: (String) -> String) -> String {
        // Split on special chars, transform numeric parts, reassemble
        var result = ""
        var current = ""
        let specials: Set<Character> = ["/", "-", ",", "*"]
        for ch in expression {
            if specials.contains(ch) {
                result += transform(current) + String(ch)
                current = ""
            } else {
                current.append(ch)
            }
        }
        result += transform(current)
        return result
    }

    // MARK: - Validation

    private func validate(_ field: String, range: ClosedRange<Int>, field fieldName: String) throws {
        if field == "*" || field.isEmpty { return }
        for segment in field.split(separator: ",").map(String.init) {
            try validateSegment(segment, range: range, field: fieldName)
        }
    }

    private func validateSegment(_ segment: String, range: ClosedRange<Int>, field: String) throws {
        if segment == "*" { return }
        // step: */n or start/n
        if segment.contains("/") {
            let parts = segment.split(separator: "/", maxSplits: 1).map(String.init)
            guard parts.count == 2, let step = Int(parts[1]), step > 0 else {
                throw CronDescriptorError.parseError("Invalid step in \(field): \(segment)")
            }
            if parts[0] != "*" {
                try validateSegment(parts[0], range: range, field: field)
            }
            return
        }
        // range: a-b
        if segment.contains("-") {
            let parts = segment.split(separator: "-", maxSplits: 1).map(String.init)
            guard parts.count == 2 else {
                throw CronDescriptorError.parseError("Invalid range in \(field): \(segment)")
            }
            try validateSingleValue(parts[0], range: range, field: field)
            try validateSingleValue(parts[1], range: range, field: field)
            return
        }
        try validateSingleValue(segment, range: range, field: field)
    }

    private func validateSingleValue(_ value: String, range: ClosedRange<Int>, field: String) throws {
        guard let n = Int(value) else {
            throw CronDescriptorError.parseError("Non-numeric value '\(value)' in \(field)")
        }
        guard range.contains(n) else {
            throw CronDescriptorError.parseError("Value \(n) out of range \(range.lowerBound)-\(range.upperBound) for \(field)")
        }
    }
}
