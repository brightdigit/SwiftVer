import Foundation

public struct Hash: CustomStringConvertible, Equatable, Hashable {
  /**
   The Data of the Hash.
   */
  public let data: Data

  /**
   Creates a Hash object based on a string.
   */
  public init(string: String) {
    data = Data(hexString: string)
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
  public var hashValue: Int {
    return data.hashValue
  }

  /**
   Equality comparison of Hash objects.
   */
  public static func == (lhs: Hash, rhs: Hash) -> Bool {
    return lhs.data == rhs.data
  }
}
