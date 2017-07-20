import Foundation

/**
 Container for the InfoDictionary.
 */
public protocol InfoDictionaryContainerProtocol {
  var infoDictionary: [String: Any]? { get }
}

extension Bundle: InfoDictionaryContainerProtocol {
}
