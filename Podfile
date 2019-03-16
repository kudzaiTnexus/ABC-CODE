 platform :ios, '10.0'

target 'ABC-CODE' do
  use_frameworks!

    pod 'Swinject', '~> 2.5.0', :inhibit_warnings => true
    pod 'SVProgressHUD'

  target 'ABC-CODETests' do
    pod 'Cuckoo', '0.12.0', :inhibit_warnings => true
  end

  target 'ABC-CODEUITests' do
    pod 'Swifter', '~> 1.4.5'
  end

	post_install do |installer_representation|
	    installer_representation.pods_project.targets.each do |target|
	        target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '4.0'
	            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'YES'
	        end
	    end
	end
    
    ENV["COCOAPODS_DISABLE_STATS"] = "true"
end
