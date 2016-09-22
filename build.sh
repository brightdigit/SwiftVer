#!/bin/bash

# Builds all targets and places IPAs in build/

# Constants
#SIGNING_IDENTITY="iPhone Distribution: Detroit Labs, LLC"

# Get a list of all schemes, then build each.
xcodebuild -project SwiftVer.xcodeproj -list | \
	sed -n '/Schemes/,/^$/p' | \
	grep -v "Schemes:" | \
	while read scheme; do
		if [ ! -z "$scheme" ]; then
		echo "Building ${scheme}…"

		#build_dir="$(pwd)/build"
		#archivePath="${build_dir}/Archives/${scheme}.xcarchive"
		#exportPath="${build_dir}/${scheme}.ipa"

		xcodebuild -project SwiftVer.xcodeproj \
			-scheme "${scheme}" \
			-configuration Release

		#xcodebuild -exportArchive \
		#	-exportFormat IPA \
		#	-archivePath "${archivePath}" \
		#	-exportPath "${exportPath}" \
		#	-exportSigningIdentity "${SIGNING_IDENTITY}" || exit $?
	fi
	done
