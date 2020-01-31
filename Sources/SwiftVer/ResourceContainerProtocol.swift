import Foundation

/**
 Container for Resources.
 */
public protocol ResourceContainerProtocol {
  /**
   Returns the file URL for the resource file identified by
   the specified name and extension and residing in a given bundle directory.
   */
  func url(forResource name: String?, withExtension ext: String?, subdirectory subpath: String?) -> URL?
}

extension Bundle: ResourceContainerProtocol {}
