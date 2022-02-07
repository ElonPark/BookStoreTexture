#
# Be sure to run `pod lib lint Utility.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Utility'
  s.version          = '0.1.0'
  s.summary          = 'A short description of Utility.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/elonpark/Utility'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'elonpark' => 'dev.sungwoon@gmail.com' }
  s.source           = { :git => 'https://github.com/elonpark/Utility.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.static_framework = true

  s.source_files = 'Utility/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Utility' => ['Utility/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'RxSwift'


end
