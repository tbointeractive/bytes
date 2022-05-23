#
#  Be sure to run `pod spec lint bytes.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "bytes"
  s.version      = "1.2"
  s.summary      = "bytes is a set of Swift tools to cover many all-day tasks in iOS development."

  s.description  = <<-DESC
                    bytes is a set of Swift tools to cover many all-day tasks in iOS development.
                   DESC

  s.homepage     = "https://github.com/tbointeractive/bytes"

  s.license      = "MIT"

  s.author      = { "Cornelius Horstmann" => "horstmann@tbointeractive.com", "Thorsten Stark" => "stark@tbo.de", "Bernhard Eiling" => "eiling@tbointeractive.com", "Pascal Stüdlein" => "stuedlein@tbointeractive.com"  }

  s.platform     = :ios, "10.0"
  
  s.swift_versions = ['4.2', '5.0']

  s.source       = { :git => "https://github.com/tbointeractive/bytes.git", :tag => '1.2'}

  s.source_files = "Sources/**/*.swift"

  s.preserve_paths = 'CocoaPods/**/*'
  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS[sdk=macosx*]'           => '$(PODS_ROOT)/bytes/CocoaPods/macosx',
    'SWIFT_INCLUDE_PATHS[sdk=iphoneos*]'         => '$(PODS_ROOT)/bytes/CocoaPods/iphoneos',
    'SWIFT_INCLUDE_PATHS[sdk=iphonesimulator*]'  => '$(PODS_ROOT)/bytes/CocoaPods/iphonesimulator',
    'SWIFT_INCLUDE_PATHS[sdk=appletvos*]'        => '$(PODS_ROOT)/bytes/CocoaPods/appletvos',
    'SWIFT_INCLUDE_PATHS[sdk=appletvsimulator*]' => '$(PODS_ROOT)/bytes/CocoaPods/appletvsimulator',
    'SWIFT_INCLUDE_PATHS[sdk=watchos*]'          => '$(PODS_ROOT)/bytes/CocoaPods/watchos',
    'SWIFT_INCLUDE_PATHS[sdk=watchsimulator*]'   => '$(PODS_ROOT)/bytes/CocoaPods/watchsimulator'
  }
end
