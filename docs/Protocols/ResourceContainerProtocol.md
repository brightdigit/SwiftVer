**PROTOCOL**

# `ResourceContainerProtocol`

```swift
public protocol ResourceContainerProtocol
```

> Container for Resources.

## Methods
### `url(forResource:withExtension:subdirectory:)`

```swift
func url(forResource name: String?, withExtension ext: String?, subdirectory subpath: String?) -> URL?
```

> Returns the file URL for the resource file identified by
> the specified name and extension and residing in a given bundle directory.
