Pod::Spec.new do |s|
  s.name         = "FaceAISDK_Core"
  s.version      = "2026.04.07.aqtivehr"
  s.platform     = :ios, '15.5'
  s.summary      = "FaceAISDK人脸识别和活体检验，可离线无需网络端侧实现"
  s.homepage     = "https://github.com/FaceAISDK/FaceAISDK_Core"
  s.license      = { :type => "FaceAISDK License", :file => "LICENSE" }
  s.author       = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
  s.source       = { :git => "https://github.com/FaceAISDK/FaceAISDK_Core.git", :tag => "#{s.version}" }
  
  
  # git tag version
  # git push origin version
  # 上传发布（调试不需要）  pod trunk push FaceAISDK_Core.podspec --skip-import-validation
  # 更新 pod install --repo-update
  

  s.swift_versions = ['5.9', '6.0', '6.1', '6.2']
  s.static_framework = true #通常建议作为静态框架

  # --- 依赖配置 ---
  s.dependency 'GoogleMLKit/FaceDetection', '9.0.0'
  s.dependency 'TensorFlowLiteSwift', '~> 2.17'

  # --- 框架二进制配置 (核心修复：合并数组) ---
  s.ios.vendored_frameworks = [
    'BuildOut/*.xcframework',
    'Silent/framework/ncnn.framework',  # 去掉多余的 FaceAISDK_Core前缀
    'Silent/framework/openmp.framework'
  ]

  # --- 资源文件 ---
  s.resources = ['Resources/subModel.bundle']

  # 合并所有的 xcconfig
  s.libraries = 'c++' # 链接 C++ 标准库
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-lc++ -ObjC', # 确保链接器能找到 C++ 符号
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/Silent/framework"',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'OTHER_SWIFT_FLAGS' => '-Xfrontend -enable-library-evolution',
    'SKIP_INSTALL' => 'NO',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  s.user_target_xcconfig = {
    # 强制宿主工程链接 ncnn 和 openmp
    'OTHER_LDFLAGS' => '$(inherited) -lc++ -framework "ncnn" -framework "openmp"',
    # 将框架搜索路径暴露给宿主工程
    'FRAMEWORK_SEARCH_PATHS' => '$(inherited) "${PODS_TARGET_SRCROOT}/Silent/framework"',
    'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

end
