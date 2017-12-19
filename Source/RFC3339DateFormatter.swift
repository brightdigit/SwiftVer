import Foundation

private let _rfc3339DateFormatter = {
  () -> DateFormatter in
  let formatter = DateFormatter()
  formatter.setupRFC3339DateFormatter()
  return formatter
}()

public extension DateFormatter {
  internal func setupRFC3339DateFormatter() {

    locale = Locale(identifier: "en_US_POSIX")
    dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssXXX"
    timeZone = TimeZone(secondsFromGMT: 0)
  }

  /**
   RFC3339 DateFormatter for reading dates from autorevision.
   */
  public static var rfc3339DateFormatter: DateFormatter {
    return _rfc3339DateFormatter
  }
}
