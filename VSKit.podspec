#
# Be sure to run `pod lib lint VSKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VSKit'
  s.version          = '0.2.0'
  s.summary          = 'A framework of some usefull general purpose code I have created.'
  s.description      = 'A framework of some usefull general purpose code I have created. This code has been used in production for several projects.'
  s.homepage         = 'https://github.com/pjvea/VSKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PJ Vea' => 'pj@veasoftware.com' }
  s.source           = { :git => 'https://github.com/pjvea/VSKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'VSKit/Classes/**/*'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.swift_version = '4.2'
end
