import Foundation

public struct VersionNumberSuffixParseError: Error {
  public let formatter: NumberFormatter
  public let value: Double
}
