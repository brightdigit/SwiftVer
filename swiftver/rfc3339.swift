import Foundation

/// Parse RFC 3339 date string to NSDate
///
/// :param: rfc3339DateTimeString string with format "yyyy-MM-ddTHH:mm:ssZ"
/// :returns: NSDate, or nil if string cannot be parsed
public func dateForRFC3339DateTimeString(rfc3339DateTimeString: String) -> NSDate? {
    let formatter = getThreadLocalRFC3339DateFormatter()
    return formatter.dateFromString(rfc3339DateTimeString)
}

/// Generate RFC 3339 date string for an NSDate
///
/// :param: date NSDate
/// :returns: String
public func rfc3339DateTimeStringForDate(date: NSDate) -> String {
    let formatter = getThreadLocalRFC3339DateFormatter()
    return formatter.stringFromDate(date)
}

// Date formatters are not thread-safe, so use a thread-local instance
private func getThreadLocalRFC3339DateFormatter() -> NSDateFormatter {
    return cachedThreadLocalObjectWithKey("net.kristopherjohnson.getThreadLocalRFC3339DateFormatter") {
        let en_US_POSIX = NSLocale(localeIdentifier: "en_US_POSIX")
        let rfc3339DateFormatter = NSDateFormatter()
        rfc3339DateFormatter.locale = en_US_POSIX
        rfc3339DateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssXXX"
        rfc3339DateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        return rfc3339DateFormatter
    }
}

/// Return a thread-local object, creating it if it has not already been created
///
/// :param: create closure that will be invoked to create the object
/// :returns: object of type T
private func cachedThreadLocalObjectWithKey<T: AnyObject>(key: String, create: () -> T) -> T {
    let threadDictionary = NSThread.currentThread().threadDictionary
        if let cachedObject = threadDictionary[key] as? T {
            return cachedObject
        }
        else {
            let newObject = create()
            threadDictionary[key] = newObject
            return newObject
        }
  
}
