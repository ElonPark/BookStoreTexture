#
# Be sure to run `pod lib lint BookStoreTextureUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BookStoreTextureUI'
  s.version          = '0.1.0'
  s.summary          = 'A short description of BookStoreTextureUI.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/elonpark/BookStoreTextureUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'elonpark' => 'dev.sungwoon@gmail.com' }
  s.source           = { :git => 'https://github.com/elonpark/BookStoreTextureUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'

  s.source_files = 'BookStoreTextureUI/Classes/**/*'
  
  s.resource_bundles = {
    'BookStoreTextureUI' => ['BookStoreTextureUI/Assets/BookStoreTextureUI.xcassets']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Then'
  s.dependency 'Texture'
end
