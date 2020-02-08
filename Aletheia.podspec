#
# Be sure to run `pod lib lint Aletheia.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Aletheia'
  s.version          = '0.1.0'
  s.summary          = 'A bunch of helper code for swift projcect include network, log, and cache layer.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A bunch of helper code for swift projcect include network, log, and cache layer.
  DESC
   
  s.homepage         = 'https://github.com/5SMNOONMS5/Aletheia'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chen stephen' => 'tasb00429@gmail.com' }
  s.source           = { :git => 'https://github.com/5SMNOONMS5/Aletheia.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.cocoapods_version = '>= 1.4.0'
  s.default_subspec = "Core"

  s.source_files = 'Aletheia/Classes/**/*'
  
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'

  
  # s.resource_bundles = {
  #   'Aletheia' => ['Aletheia/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'

  s.subspec "Core" do |ss|
    ss.source_files  = "Aletheia/Classes/", "Aletheia/Classes/Plugins/"
    ss.dependency 'Alamofire', '4.8.0'
    ss.dependency 'Kingfisher', '4.10.0'
    ss.dependency 'Log'
    ss.framework  = "Foundation"
  end
end
