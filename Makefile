dev-depends:
	brew install xcodegen
	brew install cocoapods
	brew install carthage
	brew cask install swimat

init:
	pod setup
	pod init

depends:
	carthage update --platform ios
	xcodegen
	pod install
