import Foundation

public extension Data {
  /**
   Creates a Data object based on a hex **String**.
   */
  init?(hexString: String) {
    var hex = hexString[hexString.startIndex...]
    self.init()
    while hex.count > 0 {
      let index = hex.index(hex.startIndex, offsetBy: 2)
      let characterString = hex[..<index]
      hex = hex[index...]
      var characterValue: UInt32 = 0
      guard Scanner(string: String(characterString)).scanHexInt32(&characterValue) else {
        return nil
      }
      var char = UInt8(characterValue)
      append(&char, count: 1)
    }
  }
}
