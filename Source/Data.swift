import Foundation

public extension Data {
  /**
   Creates a Data object based on a hex **String**.
   */
  public init(hexString: String) {
    var hex = hexString
    self.init()
    while hex.characters.count > 0 {
      let c: String = hex.substring(to: hex.index(hex.startIndex, offsetBy: 2))
      hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
      var ch: UInt32 = 0
      Scanner(string: c).scanHexInt32(&ch)
      var char = UInt8(ch)
      append(&char, count: 1)
    }
  }
}
