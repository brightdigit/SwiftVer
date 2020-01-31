**PROTOCOL**

# `StageBuildDictionaryProtocol`

```swift
public protocol StageBuildDictionaryProtocol
```

> Dictionary which has Semantic Versions, Stages, and Minimum Builds.

## Properties
### `semvers`

```swift
var semvers: [SemVer]
```

> List of all Semantic Versions.

## Methods
### `minimumBuild(forSemVer:atStage:)`

```swift
func minimumBuild(forSemVer semver: SemVer, atStage stage: Stage?) -> Int?
```

> Minimum Build Number for a Semantic Version and Stage.

### `stage(withBuildForVersion:)`

```swift
func stage(withBuildForVersion version: Version) -> StageBuild?
```

> StageBuild based on Version
