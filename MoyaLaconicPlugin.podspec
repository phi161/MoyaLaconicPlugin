#
# Be sure to run `pod lib lint MoyaLaconicPlugin.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = 'MoyaLaconicPlugin'
  s.version          = '0.2.0'
  s.summary          = 'A Moya plugin for one-line logs'
  s.description      = <<-DESC
  MoyaLaconicPlugin logs your Moya requests and their responses using a short message for each.
  In an application with many network calls, sometimes it is enough to just know when a request is fired and when its response comes back.
  Implement the Laconic protocol and assign an identifier to your endpoints.
  MoyaLaconicPlugin will use these and write into the Console a one-line message, together with the status code of each response.
                       DESC

  s.homepage         = 'https://github.com/phi161/MoyaLaconicPlugin'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'phi161' => 'phi@magneticpull.org' }
  s.source           = { :git => 'https://github.com/phi161/MoyaLaconicPlugin.git', :tag => s.version.to_s }

  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'

  s.source_files = 'MoyaLaconicPlugin/Classes/**/*'
  s.dependency 'Moya', '~> 14.0'
end
