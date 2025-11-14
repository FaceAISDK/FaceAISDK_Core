#!/bin/sh

# 1. 清理并构建真机框架 (iOS device)
xcodebuild clean archive \
  -scheme FaceAISDK \
  -configuration Release \
  -destination "generic/platform=iOS" \
  -archivePath "build/FaceAISDK-iOS.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# 2. 清理并构建模拟器框架 (iOS Simulator)
xcodebuild clean archive \
  -scheme FaceAISDK \
  -configuration Release \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "build/FaceAISDK-Simulator.xcarchive" \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# 3. 创建 XCFramework（包含分发支持）
xcodebuild -create-xcframework \
  -framework "build/FaceAISDK-iOS.xcarchive/Products/Library/Frameworks/FaceAISDK.framework" \
  -framework "build/FaceAISDK-Simulator.xcarchive/Products/Library/Frameworks/FaceAISDK.framework" \
  -output "build/FaceAISDK.xcframework"
