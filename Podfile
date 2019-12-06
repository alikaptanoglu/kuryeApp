
target 'kuryeApp' do
pod 'IQKeyboardManagerSwift'
pod 'Alamofire'
pod 'YPImagePicker'
pod 'ServiceSpaceX'
pod 'SwiftValidator', :git => 'https://github.com/jpotts18/SwiftValidator.git', :tag => '4.2.0'
end


post_install do |pi|
    pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
        end
    end
end
