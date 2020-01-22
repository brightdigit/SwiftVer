import Foundation

public extension Data {
  /**
   Creates a Data object based on a hex **String**.
   */
  init?(hexString: String) {
    var hex = hexString
    self.init()
    while hex.count > 0 {
      let characterString: String = hex.substring(to: hex.index(hex.startIndex, offsetBy: 2))
      hex = hex.substring(from: hex.index(hex.startIndex, offsetBy: 2))
      var characterValue: UInt32 = 0
      guard Scanner(string: characterString).scanHexInt32(&characterValue) else {
        return nil
      }
      var char = UInt8(characterValue)
      append(&char, count: 1)
    }
  }
}
