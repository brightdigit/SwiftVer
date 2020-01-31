**STRUCT**

# `Hash`

```swift
public struct Hash: CustomStringConvertible, Equatable, Hashable
```

> Hash struct used for VersionControlInfo.

## Properties
### `data`

```swift
public let data: Data
```

> The Data of the Hash.

### `description`

```swift
public var description: String
```

> Formats the data into a hex **String**.

## Methods
### `init(string:)`

```swift
public init?(string: String)
```

> Creates a Hash object based on a string.

### `hash(into:)`

```swift
public func hash(into hasher: inout Hasher)
```

> Hash value for equality.

### `==(_:_:)`

```swift
public static func == (lhs: Hash, rhs: Hash) -> Bool
```

> Equality comparison of Hash objects.
