import Foundation
import SwiftVer

let exampleVersion = Version(
  bundle: Bundle.main,
  dictionary: Stage.dictionary(fromPlistAtURL: Bundle.main.url(forResource: "versions", withExtension: "plist")!)!,
  versionControl: VersionControlInfo(
    type: VCS_TYPE,
    baseName: VCS_BASENAME,
    uuid: Hash(string: VCS_UUID!)!,
    number: VCS_NUM,
    date: VCS_DATE,
    branch: VCS_BRANCH,
    tag: VCS_TAG,
    tick: VCS_TICK,
    extra: VCS_EXTRA,
    hash: Hash(string: VCS_FULL_HASH)!,
    isWorkingCopyModified: VCS_WC_MODIFIED
  )
)

extension Version {
  var values: [(label: String, value: String?)] {
    var values = [(label: String, value: String?)]()
    values.append((label: "semverDescription", value: semver.description))
    values.append((label: "semverMajor", value: semver.major.description))
    values.append((label: "semverMinor", value: semver.minor.description))
    values.append((label: "semverPatch", value: semver.patch?.description))
    values.append((label: "build", value: build.description))
    values.append((label: "vcsBasename", value: versionControl!.baseName))
    values.append((label: "vcsBranch", value: versionControl!.branch))
    values.append((label: "vcsDate", value: versionControl!.date?.description))
    values.append((label: "vcsExtra", value: versionControl!.extra))
    values.append((label: "vcsFull_hash", value: versionControl!.hash.description))
    values.append((label: "vcsNum", value: versionControl!.number.description))
    values.append((label: "vcsTag", value: versionControl!.tag))
    values.append((label: "vcsTick", value: versionControl!.tick?.description))
    values.append((label: "vcsType", value: versionControl!.type.description))
    values.append((label: "vcsUuid", value: versionControl!.uuid?.description))
    values.append((label: "vcsWc_modified", value: versionControl!.isWorkingCopyModified.description))
    return values
  }

  static var example: Version! {
    return exampleVersion
  }
}
