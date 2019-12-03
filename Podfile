
target 'kuryeApp' do

pod 'IQKeyboardManagerSwift'
pod 'Validator'
pod 'Alamofire'
pod 'YPImagePicker'
pod 'ServiceSpaceX'

end


post_install do |pi|
    pi.pods_project.targets.each do |t|
        t.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '10.0'
        end
    end
end
