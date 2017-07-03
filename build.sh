#!/bin/bash

# Get a list of all schemes, then build each.
xcodebuild -project SwiftVer.xcodeproj -list | \
	sed -n '/Schemes/,/^$/p' | \
	grep -v "Schemes:" | \
	while read scheme; do
		if [ ! -z "$scheme" ]; then
			echo "Building ${scheme}…"

			xcodebuild -project SwiftVer.xcodeproj \
				-scheme "${scheme}" \
				-configuration Release | xcpretty -f `xcpretty-travis-formatter` && exit ${PIPESTATUS[0]}
		fi
	done

iOSVersions_TRAVIS=(8.1 8.2 8.3 8.4 9.0 9.1 9.2 9.3 10.0 10.1 10.2 10.3 11.0)
iOSVersions_LOCAL=(9.3 11.0)

[[ $TRAVIS ]] && iOSVersions=${iOSVersions_TRAVIS[*]} || iOSVersions=${iOSVersions_LOCAL[*]}

for iOSVersion in ${iOSVersions[@]}; do
	xcodebuild -project SwiftVer.xcodeproj -scheme "SwiftVer iOS" -destination "platform=iOS Simulator,name=iPhone 5s,OS=${iOSVersion}" clean test | xcpretty -f `xcpretty-travis-formatter` && exit ${PIPESTATUS[0]}
	xcodebuild -project SwiftVer.xcodeproj -scheme "SwiftVer iOS" -destination "platform=iOS Simulator,name=iPad Air,OS=${iOSVersion}" clean test | xcpretty -f `xcpretty-travis-formatter` && exit ${PIPESTATUS[0]}
done

tvOSVersions_TRAVIS=(9.0 9.1 9.2 10.0 10.1 10.2 11.0)
tvOSVersions_LOCAL=(11.0)

[[ $TRAVIS ]] && tvOSVersions=${tvOSVersions_TRAVIS[*]} || iOSVersions=${tvOSVersions_LOCAL[*]}

for tvOSVersion in ${tvOSVersions[@]}; do
	xcodebuild -project SwiftVer.xcodeproj -scheme "SwiftVer tvOS" -destination "platform=tvOS Simulator,name=Apple TV 1080p,OS=${tvOSVersion}" clean test | xcpretty -f `xcpretty-travis-formatter` && exit ${PIPESTATUS[0]}
done

xcodebuild -project SwiftVer.xcodeproj -scheme "SwiftVer macOS" -destination 'platform=OS X,arch=x86_64' clean test | xcpretty -f `xcpretty-travis-formatter` && exit ${PIPESTATUS[0]}
