import Foundation

/**
 Container for Resources.
 */
public protocol ResourceContainerProtocol {
  func url(forResource name: String?, withExtension ext: String?, subdirectory subpath: String?) -> URL?
}

extension Bundle: ResourceContainerProtocol {
}
