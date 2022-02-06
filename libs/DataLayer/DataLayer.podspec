#
# Be sure to run `pod lib lint DataLayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DataLayer'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DataLayer.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/elonpark/DataLayer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'elonpark' => 'dev.sungwoon@gmail.com' }
  s.source           = { :git => 'https://github.com/elonpark/DataLayer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.static_framework = true

  s.source_files = 'DataLayer/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DataLayer' => ['DataLayer/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'EPLogger'
  s.dependency 'Moya/RxSwift', '~> 15.0'
  s.dependency 'RxReachability', '~> 1.2.1'
end
