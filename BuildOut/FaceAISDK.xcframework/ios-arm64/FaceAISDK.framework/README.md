## Swift XCFramework 静态库设置
- 1. 打开 Edit Scheme，将 Run 下面的 Build Configuration 设置为 Release
- 2. 选中 Target 点击 Build Settings，Mach-O Type 选择 Static Library




## 打包XCFrameWork 命令

首先CD 到Product 目录然后命令 xcodebuild -create-xcframework -framework Release-iphoneos/FaceAISDK.framework -output FaceAISDK.xcframework


