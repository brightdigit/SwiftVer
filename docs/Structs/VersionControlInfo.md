**STRUCT**

# `VersionControlInfo`

```swift
public struct VersionControlInfo
```

> The Current-Revision Metadata from the Version Control Repository.

## Properties
### `type`

```swift
public let type: VersionControlType
```

> The VersionControlType.

### `baseName`

```swift
public let baseName: String
```

> The basename of the directory root.

### `uuid`

```swift
public let uuid: Hash?
```

> A universally unique identifier, generated from the root commit in git and hg;
> for svn it uses the supplied UUID.

### `number`

```swift
public let number: Int
```

> A count of revisions between the current one and the initial one; useful for reporting build numbers.

### `date`

```swift
public let date: Date?
```

> The date of the most recent commit.

### `branch`

```swift
public let branch: String
```

> The name of the branch of the commit graph that was selected when autoversion was run.

### `tag`

```swift
public let tag: String?
```

> The name of the most recent tag ancestral to the current commit.

### `tick`

```swift
public let tick: Int?
```

> A count of commits since most recent tag ancestral to the current commit.

### `extra`

```swift
public let extra: String?
```

> A symbol set aside specifically to be set by the user through the environment or via scripts.

### `hash`

```swift
public let hash: Hash
```

> A full unique identifier for the current revision.

### `isWorkingCopyModified`

```swift
public let isWorkingCopyModified: Bool
```

> If the current working directory has been modified.

## Methods
### `init(type:baseName:uuid:number:date:branch:tag:tick:extra:hash:isWorkingCopyModified:)`

```swift
public init(type: String,
            baseName: String,
            uuid: Hash?,
            number: Int,
            date: String,
            branch: String,
            tag: String?,
            tick: Int?,
            extra: String?,
            hash: Hash,
            isWorkingCopyModified: Bool)
```

> Creates a VersionControlInfo object.

### `init(basedOn:tick:extra:)`

```swift
public init(basedOn parent: VersionControlInfo, tick: Int, extra: String?)
```

> Creates a VersionControlInfo object based a previous one with an updated tick and extra info.

### `init(jsonResource:fromBundle:inDirectory:)`

```swift
public init?(
  jsonResource: String,
  fromBundle bundle: ResourceContainerProtocol,
  inDirectory directory: String? = nil
)
```

> Tries to parse the json resource from the bundle based on the directory.

### `init(fromUrl:)`

```swift
public init?(
  fromUrl url: URL
)
```

> Tries to parse the json resource from the bundle based on the directory.
