Pod::Spec.new do |s|
  s.name         = "FaceAISDK_Core"
  s.version      = "2026.03.04"
  s.platform     = :ios, '15.5'
  s.summary      = "FaceAISDK人脸识别和活体检验，可离线无需网络端侧实现"
  s.homepage     = "https://github.com/FaceAISDK/FaceAISDK_Core"
  s.license      = { :type => "FaceAISDK License", :file => "LICENSE" }
  s.author       = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
  s.source       = { :git => "https://github.com/FaceAISDK/FaceAISDK_Core.git", :tag => "#{s.version}" }
  
  
  # git tag version
  # git push origin version
  # 上传 pod trunk push FaceAISDK_Core.podspec --skip-import-validation
  # 更新 pod install --repo-update
  

  s.swift_versions = ['5.9', '6.0', '6.1', '6.2']
  s.static_framework = true #通常建议作为静态框架

  # --- 依赖配置 ---
  s.dependency 'GoogleMLKit/FaceDetection', '9.0.0'
  s.dependency 'TensorFlowLiteSwift', '~> 2.17'

  # --- 框架二进制配置 (核心修复：合并数组) ---
  s.ios.vendored_frameworks = [
    'BuildOut/*.xcframework',
    'FaceAISDK_Core/silent/framework/ncnn.framework',
    'FaceAISDK_Core/silent/framework/openmp.framework'
  ]

  # --- 资源文件 ---
  s.resources = ['Resources/subModel.bundle']

  # 合并所有的 xcconfig
  s.libraries = 'c++' # 链接 C++ 标准库
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-lc++ -ObjC', # 确保链接器能找到 C++ 符号
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_ROOT}/FaceAISDK_Core/FaceAISDK_Core/silent/framework"',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'OTHER_SWIFT_FLAGS' => '-Xfrontend -enable-library-evolution',
    'SKIP_INSTALL' => 'NO',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.user_target_xcconfig = {
    'OTHER_LDFLAGS' => '-lc++',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

end
