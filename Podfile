# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'BookStoreTexture' do
  use_frameworks!
  inhibit_all_warnings!

  # Pods for BookStoreTexture

  # DI
  pod 'Pure'

  # Network
  pod 'DataLayer', :path => './libs/DataLayer'

  # UI
  pod 'Texture', :git => 'https://github.com/TextureGroup/Texture.git'
  pod 'BookStoreTextureUI', :path => './libs/BookStoreTextureUI'
  
  # Common
  pod 'Then'
  pod 'EPLogger'
  pod 'Utility', :path => './libs/Utility'

  target 'BookStoreTextureTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
  end

  target 'BookStoreTextureUITests' do
    # Pods for testing
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"

      if Gem::Version.new('9.0') > Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'])
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '9.0'
      end
    end
  end
end
