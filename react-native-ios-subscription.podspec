require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-ios-subscription"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.description  = <<-DESC
                   react-native-ios-subscription
                   DESC

  s.homepage     = "https://github.com/devapps-systems/react-native-ios-subscription"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Mahendra Liya" => "liyamahendra4@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/devapps-systems/react-native-ios-subscription.git", :tag => "master" }
  s.source_files  = "RNNativeSubscription/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "RMStore"

end

  