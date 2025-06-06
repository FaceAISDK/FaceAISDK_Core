Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '16.0'
s.name = "FaceAISDK_Core"

s.summary = "FaceAISDK 可以不用联网单机实现人脸录入，人脸识别和活体检验；Framework SDK for add face, face recognition, and liveness detection"

# 上传 pod trunk push FaceAISDK_Core.podspec --skip-import-validation
# 更新 pod install --repo-update
# 69 使用Xcode 15 打包，Debug 包

# 不同的电脑Swift 版本不一样 啊

s.version = "0.0.68.Intercept"


s.swift_version = "5.92"


# 3
s.license = { :type => "FaceAISDK License", :file => "LICENSE" }
s.author = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
s.homepage = "https://github.com/AnyLifeZLB/FaceAISDK_Core"
s.source = { :git => "https://github.com/AnyLifeZLB/FaceAISDK_Core.git",
             :tag => "#{s.version}" }

# 7
s.dependency 'GoogleMLKit/FaceDetection'
s.dependency 'TensorFlowLiteSwift'


# 忽略警告 http://gonghonglou.com/2021/03/09/xcode12-lint-error/
s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }


# 8
s.ios.vendored_frameworks  = 'BuildOut/*.framework'

# 009 上传
s.resources = ['Resources/subModel.bundle','Model.bundle']


end

