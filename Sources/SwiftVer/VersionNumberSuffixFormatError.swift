import Foundation

public struct VersionNumberSuffixFormatError: Error {
  public let formatter: NumberFormatter
  public let value: Double
}
