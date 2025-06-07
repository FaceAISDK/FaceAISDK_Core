Pod::Spec.new do |s|

s.platform = :ios
s.ios.deployment_target = '16.0'
s.name = "FaceAISDK_Core"

s.summary = "FaceAISDK 可以不用联网单机实现人脸录入，人脸识别和活体检验；Framework SDK for add face, face recognition, and liveness detection"

# 上传 pod trunk push FaceAISDK_Core.podspec --skip-import-validation
# 更新 pod install --repo-update

s.version = "0.0.91.airXC"
s.swift_version = "5.92"


# 3
s.license = { :type => "FaceAISDK License", :file => "LICENSE" }
s.author = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }
s.homepage = "https://github.com/AnyLifeZLB/FaceAISDK_Core"
s.source = { :git => "https://github.com/AnyLifeZLB/FaceAISDK_Core.git",
             :tag => "#{s.version}" }

s.dependency 'GoogleMLKit/FaceDetection'
s.dependency 'TensorFlowLiteSwift'

s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

s.ios.vendored_frameworks  = 'BuildOut/*.xcframework'
s.resources = ['Resources/subModel.bundle','Model.bundle']

end

