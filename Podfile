# Uncomment the next line to define a global platform for your project
 platform :ios, '8.0'

target 'HelooTest' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
  # use_frameworks!

  # Pods for HelooTest
  pod 'Toast', '~> 4.0.0'
  pod 'BeeHive', '~> 1.6.0'
  pod 'ReactiveCocoa', :git => 'https://github.com/zhao0/ReactiveCocoa.git', :tag => '2.5.2'
  pod 'HMSegmentedControl'
  pod 'lottie-ios', '~> 2.5.0'
  pod 'AFNetworking', '~> 3.2.1'
  pod 'SVProgressHUD', '~> 2.2.5'
  pod 'Masonry', '~> 1.1.0'
  pod 'Texture', '~> 2.6'
  pod 'SDWebImage'
  pod 'IQKeyboardManager-Broadlink', :path => '../../IQKeyboardManager-Broadlink'
  pod 'JSONModel', '~> 1.8.0'
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '8.0'
        end
    end
end
