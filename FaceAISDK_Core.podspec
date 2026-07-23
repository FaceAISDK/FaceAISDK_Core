Pod::Spec.new do |s|
  s.name         = "FaceAISDK_Core"
  s.version      = "2026.07.19"
  s.platform     = :ios, '15.5'
  s.summary      = "on_device Face Recognition 、 Liveness detection"
  s.homepage     = "https://github.com/FaceAISDK/FaceAISDK_Core"
  s.license      = { :type => "FaceAISDK License", :file => "LICENSE" }
  s.author       = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
  s.source       = { :git => "https://github.com/FaceAISDK/FaceAISDK_Core.git", :tag => "#{s.version}" }
  
  
  # git tag version
  # git push origin version
  # 上传发布（调试不需要）  pod trunk push FaceAISDK_Core.podspec --skip-import-validation
  # 更新 pod install --repo-update

  s.swift_versions = ['5.9', '6.3']
  s.static_framework = true #通常建议作为静态框架

  # --- 依赖配置 ---
  s.dependency 'GoogleMLKit/FaceDetection', '9.0.0'
  s.dependency 'TensorFlowLiteSwift', '2.17.0'

  
  # --- 框架二进制配置 (核心修复：合并数组) ---
  s.ios.vendored_frameworks = [
    'BuildOut/*.xcframework',
    'Silent/framework/ncnn.xcframework'
  ]

  # --- 资源文件 ---
  s.resources = ['Resources/subModel.bundle']

  # 合并所有的 xcconfig
  s.libraries = 'c++' # 链接 C++ 标准库
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-lc++ -ObjC',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'SKIP_INSTALL' => 'NO'
  }

  s.user_target_xcconfig = {
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES'
  }

end
