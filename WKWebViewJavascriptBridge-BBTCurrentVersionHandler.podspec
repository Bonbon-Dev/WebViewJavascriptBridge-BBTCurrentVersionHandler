#
# Be sure to run `pod lib lint WKWebViewJavascriptBridge-BBTCurrentVersionHandler.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'WKWebViewJavascriptBridge-BBTCurrentVersionHandler'
    s.version          = '0.1.0'
    s.summary          = 'Summary of WKWebViewJavascriptBridge-BBTCurrentVersionHandler.'
    s.description      = <<-DESC
                          A description of WKWebViewJavascriptBridge-BBTCurrentVersionHandler.
                         DESC
    s.homepage         = 'https://github.com/Bonbon-Dev/WebViewJavascriptBridge-BBTCurrentVersionHandler'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Andy__M' => 'andy_m129@163.com' }
    s.source           = { :git => 'https://github.com/Bonbon-Dev/WebViewJavascriptBridge-BBTCurrentVersionHandler.git', :tag => s.version.to_s }
    s.social_media_url = ''
    s.ios.deployment_target = '8.0'
    s.source_files = 'WKWebViewJavascriptBridge-BBTCurrentVersionHandler/Classes/**/*.{h,m}'
    s.public_header_files = 'WKWebViewJavascriptBridge-BBTCurrentVersionHandler/Classes/**/*.h'
    s.frameworks = 'UIKit'
    s.dependency 'WebViewJavascriptBridge'
    s.dependency 'AMKCategories/Foundation/NSObject/MethodSwizzling'
end