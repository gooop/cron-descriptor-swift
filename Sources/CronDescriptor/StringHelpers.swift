func zeroPadded(_ n: Int, width: Int = 2) -> String {
    let s = String(n)
    return String(repeating: "0", count: max(0, width - s.count)) + s
}

extension String {
    func trimmingWhitespace() -> String {
        String(drop(while: \.isWhitespace).reversed().drop(while: \.isWhitespace).reversed())
    }

    func splitOnWhitespace() -> [String] {
        split(whereSeparator: \.isWhitespace).map(String.init)
    }

    func replacing(_ target: String, with replacement: String) -> String {
        guard !target.isEmpty else { return self }
        var result = ""
        var idx = startIndex
        while idx < endIndex {
            if self[idx...].hasPrefix(target) {
                result += replacement
                idx = index(idx, offsetBy: target.count)
            } else {
                result.append(self[idx])
                idx = index(after: idx)
            }
        }
        return result
    }

    // Avoids firstRange(of:), which requires macOS 13+
    func replacingFirst(_ target: String, with replacement: String) -> String {
        guard !target.isEmpty else { return self }
        var idx = startIndex
        while idx < endIndex {
            if self[idx...].hasPrefix(target) {
                let end = index(idx, offsetBy: target.count)
                return String(self[..<idx]) + replacement + String(self[end...])
            }
            idx = index(after: idx)
        }
        return self
    }

    func replacingPattern(_ pattern: String, with replacement: String) -> String {
        replacing(pattern, with: replacement)
    }

    // Avoids Foundation's NSString.contains, which requires macOS 13+
    func contains(_ substring: String) -> Bool {
        guard !substring.isEmpty else { return true }
        var idx = startIndex
        while idx < endIndex {
            if self[idx...].hasPrefix(substring) { return true }
            idx = index(after: idx)
        }
        return false
    }
}
