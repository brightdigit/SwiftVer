**STRUCT**

# `SemVer`

```swift
public struct SemVer: CustomStringConvertible, Comparable, Equatable, Hashable
```

> Semantic Version.

## Properties
### `major`

```swift
public let major: Int
```

> Major version number when you make incompatible API changes.

### `minor`

```swift
public let minor: Int
```

> Minor version when you add functionality in a backwards-compatible manner.

### `patch`

```swift
public let patch: Int?
```

> Patch version when you make backwards-compatible bug fixes.

### `description`

```swift
public var description: String
```

> Formatted SemVer String.

## Methods
### `init(major:minor:patch:)`

```swift
public init(major: Int, minor: Int, patch: Int? = nil)
```

> Creates Semantic Version Object.

### `init(versionString:)`

```swift
public init?(versionString: String)
```

> Creates Semantic Version Object from a String.

### `init(major:minor:patch:)`

```swift
public init?(major: String, minor: String, patch: String? = nil)
```

> Creates Semantic Version Object from a series of Strings.

### `hash(into:)`

```swift
public func hash(into hasher: inout Hasher)
```

> HashValue for comparison.

### `==(_:_:)`

```swift
public static func == (lhs: SemVer, rhs: SemVer) -> Bool
```

> Equality comparison of SemVer objects.

### `<(_:_:)`

```swift
public static func < (lhs: SemVer, rhs: SemVer) -> Bool
```

> Comparison of SemVer objects.
