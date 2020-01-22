import Foundation

/**
 Hash struct used for VersionControlInfo.
 */
public struct Hash: CustomStringConvertible, Equatable, Hashable {
  /**
   The Data of the Hash.
   */
  public let data: Data

  /**
   Creates a Hash object based on a string.
   */
  public init?(string: String) {
    guard let data = Data(hexString: string) else {
      return nil
    }

    self.data = data
  }

  /**
   Formats the data into a hex **String**.
   */
  public var description: String {
    return data.map { String(format: "%02x", $0) }.joined(separator: "")
  }

  /**
   Hash value for equality.
   */
  public func hash(into hasher: inout Hasher) {
    hasher.combine(data)
  }
  /**
   Equality comparison of Hash objects.
   */
  public static func == (lhs: Hash, rhs: Hash) -> Bool {
    return lhs.data == rhs.data
  }
}
