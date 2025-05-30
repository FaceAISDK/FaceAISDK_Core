//
//  TestSDKApp.swift
//  TestSDK
//
//  Created by anylife on 2025/5/30.
//

import SwiftUI
import FaceAISDK_Core


@main
struct TestSDKApp: App {
    


    public init(){
        // 测试主 Bundle 加载
//        if let modelData = TFLiteManager.loadModel(name: "MFN") {
//            print("✅ 主 Bundle 模型加载成功，大小: \(modelData.count) 字节")
//        }



        //resource_module

        // 测试子 Bundle 加载 tf_model
        if let sunModelData = TFLiteManager.loadModelFromSubBundle(
            subBundleName: "subModel",
            modelName: "resource_module2"
        ) {
            print("✅ Test SDK App 子 Bundle resource_module模型加载成功，大小: \(sunModelData.count) 字节")
        }


    }

    
    
    
    var body: some Scene {
        WindowGroup {
            FaceAINaviView()
        }
    }
}
