Pod::Spec.new do |spec|
  spec.name         = "BDSASR"
  spec.version      = "3.0.11.0"
  spec.summary      = "BDSASR 百度语音SDK."
  spec.description      = <<-DESC
  BDSASR 百度语音SDK的pod版本.
  DESC
  
  spec.homepage         = 'https://github.com/stephen5652/STBDSASR.git'
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "stephenchen" => "stephen5652@126.com" }
  spec.ios.deployment_target = '9.0'
  
  spec.source = { :git => "https://github.com/stephen5652/STBDSASR.git", :tag => spec.version.to_s }
  
  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #  spec.source_files = 'BDSASR_lib/ASR_iOS_v33.0.11.0.84e4d91_20230523143352/{Public,Private}/**/*.{h,m,mm,c,cpp,swift}'
  # spec.exclude_files = "BDSASR/Exclude" #排除文件
  
  #  spec.project_header_files = 'BDSASR/Private/**/*.{h}'
  spec.public_header_files = 'BDSASR_lib/**/*.h' #此处放置组件的对外暴漏的头文件
  
  # ――― binary framework/lib ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #spec.vendored_frameworks = 'BDSASR/Private/**/*.framework'
  spec.vendored_libraries = 'BDSASR_lib/**/*.a'
  
  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # 放置 json,font,jpg,png等资源
  
  spec.resources = ["BDSASR_lib/**/*.{dat,caf,bundle}"]
  #  spec.resource_bundles = {
  #    'BDSASR' => ['BDSASR/Assets/*.xcassets', "BDSASR/{Public,Private}/**/*.{png,jpg,font,json}"]
  #  }
  
  
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.framework  = "SomeFramework"
  spec.frameworks = "GLKit", "SystemConfiguration", "AudioToolbox", "AVFoundation", "CFNetwork", "CoreLocation", "CoreTelephony"
  # spec.library   = "iconv"
  spec.libraries = "sqlite3.0", "z.1.2.5", "iconv", "c++"
  
  
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # spec.requires_arc = true
  
  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  
  
  # 其他依赖pod
  # spec.dependency "XXXXXXXX"
  
  #   spec.subspec 'WithLoad' do |ss|
  #       ss.source_files = 'YKHawkeye/Src/MethodUseTime/**/*{.h,.m}'
  #       ss.pod_target_xcconfig = {
  #         'GCC_PREPROCESSOR_DEFINITIONS' => '$(inherited) YKHawkeyeWithLoad'
  #       }
  #       ss.dependency 'YKHawkeye/Core'
  #       ss.vendored_frameworks = 'YKHawkeye/Framework/*.framework'
  #     end
  
  spec.prepare_command  =  <<-CMD
  tr -d '\r' < ./shell/install_pod.sh > ./shell/install_pod_fixed.sh
  chmod +x ./shell/install_pod_fixed.sh
  ./shell/install_pod_fixed.sh
  CMD
end
