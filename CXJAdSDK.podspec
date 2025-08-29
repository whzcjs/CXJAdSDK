#
# Be sure to run `pod lib lint CXJAdSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CXJAdSDK'
  s.version          = '1.0.0.1'
  s.summary          = 'CXJAdSDK for iOS.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description      = <<-DESC
      宸星广告SDK.支持开屏、插屏、banner、激励视频、信息流等
  DESC
  
  s.homepage         = 'https://github.com/whzcjs/CXJAdSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AustinYang' => '625635129@qq.com' }
  s.source           = { :git => 'https://github.com/whzcjs/CXJAdSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '12.0'
  
  # s.resource_bundles = {
  #   'CXJAdSDK' => ['CXJAdSDK/Assets/*.png']
  # }
  
  
  s.frameworks = 'AdSupport', 'CoreTelephony', 'SystemConfiguration','AVFoundation', 'CoreMotion', 'StoreKit', 'AdSupport', 'WebKit'
  
  s.pod_target_xcconfig = {
    'OTHER_LDFLAGS' => '-ObjC',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',
    'VALID_ARCHS' => 'arm64 armv7 x86_64'
  }
  
  #  s.vendored_frameworks = 'CXJAdSDK/Frameworks/*.xcframework'
  #  s.resource = 'CXJAdSDK/Resources/CXAdsBundle.bundle'
  #
  #  s.public_header_files = 'CXJAdSDK/Frameworks/CXJAdSDK.framework/Headers/*.h'
  s.static_framework = true
  
  s.default_subspec = 'CXJAdSDK'
  
  s.subspec 'CXJAdSDK' do |ss|
    ss.vendored_frameworks = [
    'CXJAdSDK/Frameworks/CXJAdSDK.xcframework',
    'CXJAdSDK/Frameworks/CXAdSDK.xcframework'
    ]
    ss.resource = 'CXJAdSDK/Resources/CXAdsBundle.bundle'
    
  end
  
  s.subspec 'CXBDAdapter' do |ss|
    ss.vendored_frameworks = [
    'CXJAdSDK/Frameworks/CXBDAdapter.xcframework',
    ]
    ss.dependency 'BaiduMobAdSDK'
  end
  
  s.subspec 'CXFWAdapter' do |ss|
    ss.vendored_frameworks = [
    'CXJAdSDK/Frameworks/CXFWAdapter.xcframework',
    ]
    
    ss.dependency 'JADYun'
  end
  
  s.subspec 'CXJADAdapter' do |ss|
    ss.vendored_frameworks = [
    'CXJAdSDK/Frameworks/CXJADAdapter.xcframework',
    ]
    
    ss.dependency 'PTGAdFramework'
  end
  
  s.subspec 'CXQMAdapter' do |ss|
    ss.vendored_frameworks = [
    'CXJAdSDK/Frameworks/CXQMAdapter.xcframework',
    ]
    
    ss.dependency 'QuMengAdSDK'
  end
  
end
