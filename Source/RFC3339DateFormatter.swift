import Foundation

extension DateFormatter {
  func setupRFC3339DateFormatter() {

    locale = Locale(identifier: "en_US_POSIX")
    dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssXXX"
    timeZone = TimeZone(secondsFromGMT: 0)
  }
}

public final class RFC3339DateFormatter: DateFormatter {
  public static let instance = RFC3339DateFormatter()

  public override init() {
    super.init()
    setupRFC3339DateFormatter()
  }

  public required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupRFC3339DateFormatter()
  }
}
