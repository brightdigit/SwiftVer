import Foundation

public protocol InfoDictionaryContainerProtocol {
  var infoDictionary: [String: Any]? { get }
}

extension Bundle: InfoDictionaryContainerProtocol {
}
