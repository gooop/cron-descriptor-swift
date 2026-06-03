# cron-descriptor-swift
[![CI](https://github.com/gooop/cron-descriptor-swift/actions/workflows/ci.yml/badge.svg)](https://github.com/gooop/cron-descriptor-swift/actions/workflows/ci.yml)

A cron descriptor for Swift. It takes a cron expression in and outputs human readable text.

This package is a port of the Javascript package [cRonstrue](https://github.com/bradymholt/cRonstrue). The original library was written in C# as [cron-expression-descriptor](https://github.com/bradymholt/cron-expression-descriptor)

# Features
* Zero dependencies
* Supports all cron expression special characters including * / , - ? L W, #
* Supports special cron expressions like `@reboot`
* Supports 5 or 6 part cron entries
* Localization support for 29 locales (list below)
* Supports verbose flags
* Supports 24 hour time format

> [!NOTE]
> * This package was written heavily by AI agents. However, thorough output validation was done against the original Javascript code.
> * The most validated localizations are for English and Spanish. Mileage may vary on other languages. Feel free to contribute if you believe you can improve the translation.
> * This is not a cron validator. If you pass in invalid cron, an output may come out — it may or may not make sense.

# Gaps in Parity
* Does not support 7 part cron entries (seconds and year included)

# Install
Add to `Package.swift`:

```swift
.package(url: "https://github.com/gooop/cron-descriptor-swift.git", from: "1.0.0"),
```

Add the product to your target:

```swift
.product(name: "CronDescriptor", package: "cron-descriptor-swift"),
```

In Xcode: **File → Add Package Dependencies…** and paste the repo URL.

# Usage

```swift
import CronDescriptor

try CronDescriptor.toString("* * * * *")
// "Every minute"

CronDescriptor.toStringOrError("* * * * *")
// "Every minute"
```

# Supported Locales
`af, ar, ca, da, de, en, es, fa, fi, fr, he, hu, id, it, ja, ko, my, nb, nl, pt-BR, pt-PT, ro, sv, sw, th, tr, vi, zh-CN, zh-TW`
