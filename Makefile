dep:
	brew install xcodegen
	brew install cocoapods
	brew install carthage

init:
	pod setup
	pod init

depends:
	carthage update --platform ios
	xcodegen
	pod install
