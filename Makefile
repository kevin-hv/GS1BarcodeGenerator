GO_SOURCE_DIR := GoBarcodeGenerator
FRAMEWORK_NAME := Gs1barcodegen
TMP_FRAMEWORK_DIR := .build/framework

generate-macos-framework:
	cd $(GO_SOURCE_DIR) && gomobile bind -target=macos -o ../$(TMP_FRAMEWORK_DIR)/macos/Gs1barcodegen.xcframework

generate-ios-framework:
	cd $(GO_SOURCE_DIR) && gomobile bind -target=ios -o ../$(TMP_FRAMEWORK_DIR)/ios/Gs1barcodegen.xcframework

remove-already-existing-framework:
	rm -rf $(FRAMEWORK_NAME).xcframework

merge-frameworks:
	xcodebuild -create-xcframework \
  		-framework $(TMP_FRAMEWORK_DIR)/ios/$(FRAMEWORK_NAME).xcframework/ios-arm64/$(FRAMEWORK_NAME).framework \
  		-framework $(TMP_FRAMEWORK_DIR)/ios/$(FRAMEWORK_NAME).xcframework/ios-arm64_x86_64-simulator/$(FRAMEWORK_NAME).framework \
  		-framework $(TMP_FRAMEWORK_DIR)/macos/$(FRAMEWORK_NAME).xcframework/macos-arm64_x86_64/$(FRAMEWORK_NAME).framework \
  		-output $(FRAMEWORK_NAME).xcframework

remove-tmp-frameworks:
	rm -rf ./.build/framework

generate-apple-xcframework:
	$(MAKE) remove-already-existing-framework
	$(MAKE) generate-macos-framework
	$(MAKE) generate-ios-framework
	$(MAKE) merge-frameworks
	$(MAKE) remove-tmp-frameworks

build:
	$(MAKE) generate-apple-xcframework

test:
	swift test

build-test:
	$(MAKE) build
	$(MAKE) test
