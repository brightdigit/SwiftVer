**ENUM**

# `Stage`

```swift
public enum Stage: CustomStringConvertible
```

> Stage Enumeration.

## Cases
### `alpha`

```swift
case alpha,
```

> Alpha

## Properties
### `description`

```swift
public var description: String
```

> Returns a String Description of the Stage.

## Methods
### `dictionary(fromPlistAtURL:)`

```swift
public static func dictionary(fromPlistAtURL url: URL) -> StageBuildDictionaryProtocol?
```

> Builds a StageBuildDictionaryProtocol from a plist.

### `init(string:)`

```swift
public init?(string: String)
```

> Tries to create the Stage based on the String.
