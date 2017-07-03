import Foundation
import SwiftVer

let exampleVersion = Version(
  bundle: Bundle.main,
  versionControl: VersionControlInfo(
    TYPE: VCS_TYPE,
    BASENAME: VCS_BASENAME,
    UUID: VCS_UUID,
    NUM: VCS_NUM,
    DATE: VCS_DATE,
    BRANCH: VCS_BRANCH,
    TAG: VCS_TAG,
    TICK: VCS_TICK,
    EXTRA: VCS_EXTRA,
    FULL_HASH: VCS_FULL_HASH,
    SHORT_HASH: VCS_SHORT_HASH,
    WC_MODIFIED: VCS_WC_MODIFIED))

extension Version {
  var values: [(label: String, value: String?)] {
    var values = [(label: String, value: String?)]()
    values.append((label: "semverDescription", value: semver.description))
    values.append((label: "semverMajor", value: semver.major.description))
    values.append((label: "semverMinor", value: semver.minor.description))
    values.append((label: "semverPatch", value: semver.patch?.description))
    values.append((label: "build", value: build.description))
    values.append((label: "vcsBasename", value: versionControl!.BASENAME))
    values.append((label: "vcsBranch", value: versionControl!.BRANCH))
    values.append((label: "vcsDate", value: versionControl!.DATE?.description))
    values.append((label: "vcsExtra", value: versionControl!.EXTRA))
    values.append((label: "vcsFull_hash", value: versionControl!.FULL_HASH))
    values.append((label: "vcsNum", value: versionControl!.NUM.description))
    values.append((label: "vcsShortHash", value: versionControl!.SHORT_HASH))
    values.append((label: "vcsTag", value: versionControl!.TAG))
    values.append((label: "vcsTick", value: versionControl!.TICK?.description))
    values.append((label: "vcsType", value: versionControl!.TYPE.description))
    values.append((label: "vcsUuid", value: versionControl!.UUID))
    values.append((label: "vcsWc_modified", value: versionControl!.WC_MODIFIED.description))
    return values
  }

  static var example: Version! {
    return _exampleVersion
  }
}
