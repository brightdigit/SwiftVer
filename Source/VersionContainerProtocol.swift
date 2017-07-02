import Foundation

public protocol VersionContainerProtocol {
  var infoDictionary: [String: Any]? { get }
}

extension Bundle: VersionContainerProtocol {
}
