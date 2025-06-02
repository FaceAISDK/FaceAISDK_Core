Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '16.0'
s.name = "FaceAISDK_Core"

s.summary = "识别花花草草类型 测试验证 0010"

#s.summary = "FaceAISDK 可以不用联网单机实现人脸录入，人脸识别和活体检验；Framework SDK for add face, face recognition, and liveness detection"

#  33 版本修改Resources 中的submodel 名字，希望能成功啊

# 上传 pod trunk push FaceAISDK_Core.podspec --skip-import-validation
# 更新 pod install --repo-update

# 007 SDK 中的SubModl 重新命名 tf_model.tflite，本工程下面还是Resources_module
# 008 SDK 中的SubModl 重新命名 tf_model.tflite，本工程下面还是Resources_module ，但是podspec不上传了
# 0010 从新生存了framework
# 0011 从VK Imac。迁移到 AIR
# 12 和11 一样


# 不同的电脑Swift 版本不一样 啊
s.version = "0.0.77"
s.swift_version = "6.1"


# 3
s.license = { :type => "FaceAISDK License", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "FaceAISDK_Core" => "FaceAISDK.Service@gmail.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/AnyLifeZLB/FaceAISDK_Core"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/AnyLifeZLB/FaceAISDK_Core.git",
             :tag => "#{s.version}" }

# 7
s.dependency 'GoogleMLKit/FaceDetection'
s.dependency 'TensorFlowLiteSwift'



# 忽略警告 http://gonghonglou.com/2021/03/09/xcode12-lint-error/
s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }



# 8

s.ios.vendored_frameworks   = 'BuildOut/*.framework'

# 009 上传
s.resources = ['Resources/subModel.bundle','Model.bundle']


end

