// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "FaceAISDK_Core",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "FaceAISDK_Core",
            targets: ["FaceAISDK_Core"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/google/mlkit.git",
            exact: "9.0.0"
        ),
        .package(
            url: "https://github.com/tensorflow/tflite-swift",
            exact: "2.17.0"
        )
    ],
    targets: [
        // 主二进制目标
        .binaryTarget(
            name: "FaceAISDKCoreBinary",
            path: "BuildOut/FaceAISDK_Core.xcframework"
        ),
        
        // 资源包目标
        .target(
            name: "FaceAISDKCoreResources",
            resources: [
                .process("Resources/subModel.bundle"),
                .process("Model.bundle")
            ]
        ),
        
        // 主聚合目标
        .target(
            name: "FaceAISDK_Core",
            dependencies: [
                "FaceAISDKCoreBinary",
                "FaceAISDKCoreResources",
                .product(name: "MLKitFaceDetection", package: "mlkit"),
                .product(name: "TensorFlowLite", package: "tflite-swift")
            ]
        )
    ],
    swiftLanguageVersions: [.v6]
)
