**STRUCT**

# `Version`

```swift
public struct Version: CustomStringConvertible
```

> Complete Version Information.

## Properties
### `semver`

```swift
public let semver: SemVer
```

> Semantic Version.

### `build`

```swift
public let build: Int
```

> Build Number.

### `versionControl`

```swift
public let versionControl: VersionControlInfo?
```

> Autorevision Version Control Info.

### `dictionary`

```swift
public let dictionary: StageBuildDictionaryProtocol
```

> Semantic Version, Build Number, and Stage Dictionary.

### `description`

```swift
public var description: String
```

> Creates a formatted string from the Version.

### `stageBuildNumber`

```swift
public var stageBuildNumber: Int?
```

> The build number offset based on the Version stage.
> Note: Starts at 1.

### `semverBuildNumber`

```swift
public var semverBuildNumber: Int
```

> The build number offset based on the Version Semantic Version.
> Note: Starts at 1.

### `stage`

```swift
public var stage: Stage?
```

> The stage based on the Version.

### `fullDescription`

```swift
public var fullDescription: String
```

> A Full Descripton which also contains the Sub-Semantic Version value
> parsed from the VersionControlInfo.

### `subSemVerValue`

```swift
public var subSemVerValue: Double
```

> The Sub-Semantic Version value parsed from the VersionControlInfo.

### `shortDescription`

```swift
public var shortDescription: String
```

> Creates a shortened formatted string from the Version.

## Methods
### `init(semver:build:dictionary:versionControlInfo:)`

```swift
public init(semver: SemVer, build: Int,
            dictionary: StageBuildDictionaryProtocol,
            versionControlInfo: VersionControlInfo? = nil)
```

> Create a Version based on a **SemVer**, Build Number, **StageBuildDictionaryProtocol**,
> and an optional **VersionControlInfo**.

### `init(cumulativeBuildNumber:dictionary:versionControlInfo:)`

```swift
public init(
  cumulativeBuildNumber: Int,
  dictionary: StageBuildDictionaryProtocol,
  versionControlInfo: VersionControlInfo? = nil
)
```

> Create a Version based on a Cumulative Build Number, **StageBuildDictionaryProtocol**,
> and an optional **VersionControlInfo**.

### `init(bundle:dictionary:versionControl:)`

```swift
public init?(
  bundle: InfoDictionaryContainerProtocol,
  dictionary: StageBuildDictionaryProtocol,
  versionControl: VersionControlInfo? = nil
)
```

> Create a Version based on a Bundle, **StageBuildDictionaryProtocol**,
> and an optional **VersionControlInfo**.

### `from(bundle:dictionary:withVersionControlInfoWithJsonResource:)`

```swift
public static func from(
  bundle: ResourceContainerProtocol & InfoDictionaryContainerProtocol,
  dictionary: StageBuildDictionaryProtocol,
  withVersionControlInfoWithJsonResource resource: String
) -> Version?
```

> Create a Version based on a Bundle, **StageBuildDictionaryProtocol**,
> and the name of the json resource file from autorevision.

### `suffixFormatter(forLocale:)`

```swift
public func suffixFormatter(forLocale locale: Locale?) -> NumberFormatter
```

### `fullDescription(withLocale:)`

```swift
public func fullDescription(withLocale locale: Locale?) throws -> String
```

### `fullDescription(withFormatter:)`

```swift
public func fullDescription(withFormatter formatter: NumberFormatter) throws -> String
```
