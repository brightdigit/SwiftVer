import Foundation

/**
 Container for the InfoDictionary.
 */
public protocol InfoDictionaryContainerProtocol {
  /**
   A dictionary, constructed from the bundle's Info.plist file, that contains information about the receiver.
   */
  var infoDictionary: [String: Any]? { get }
}

extension Bundle: InfoDictionaryContainerProtocol {
}
