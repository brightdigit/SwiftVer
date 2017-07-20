import Foundation

public struct Hash: CustomStringConvertible, CustomDebugStringConvertible {
  public let data: Data
  public init(string: String) {
    data = Data(hexString: string)
  }

  public var description: String {
    return data.map { String(format: "%02x", $0) }
      .joined(separator: "")
  }

  public var debugDescription: String {
    return description
  }
}
