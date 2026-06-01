public enum CronDescriptorError: Error, CustomStringConvertible {
    case parseError(String)

    public var description: String {
        switch self {
        case .parseError(let msg): return "CronDescriptor parse error: \(msg)"
        }
    }
}

public struct Options {
    public var verbose: Bool
    public var use24HourTimeFormat: Bool? // nil → use locale default
    public var dayOfWeekStartIndexZero: Bool
    public var locale: any CronLocale

    public init(
        verbose: Bool = false,
        use24HourTimeFormat: Bool? = nil,
        dayOfWeekStartIndexZero: Bool = true,
        locale: any CronLocale = EnLocale()
    ) {
        self.verbose = verbose
        self.use24HourTimeFormat = use24HourTimeFormat
        self.dayOfWeekStartIndexZero = dayOfWeekStartIndexZero
        self.locale = locale
    }
}

public enum CronDescriptor {
    /// Converts a cron expression to a human-readable description.
    /// Throws `CronDescriptorError` on invalid input.
    public static func toString(_ expression: String, options: Options = Options()) throws -> String {
        let descriptor = ExpressionDescriptor(expression: expression, options: options)
        return try descriptor.getFullDescription()
    }

    /// Converts a cron expression to a human-readable description.
    /// Non-throwing variant of `toString`. Returns a localized error message on invalid input instead of throwing.
    public static func toStringOrError(_ expression: String, options: Options = Options()) -> String {
        do {
            return try toString(expression, options: options)
        } catch {
            return options.locale.anErrorOccurred()
        }
    }
}
