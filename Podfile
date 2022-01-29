# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'

target 'BookStoreTexture' do
  use_frameworks!
  inhibit_all_warnings!

  # Pods for BookStoreTexture

  # DI
  pod 'Pure'

  # Network
  pod 'Moya/RxSwift', '~> 15.0'
  pod 'RxReachability', '~> 1.2.1'

  # UI
  pod 'Texture', :git => 'https://github.com/TextureGroup/Texture.git'

  # Common
  pod 'Then'
  pod 'EPLogger'

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
