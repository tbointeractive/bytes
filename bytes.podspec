#
#  Be sure to run `pod spec lint bytes.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "bytes"
  s.version      = "0.1"
  s.summary      = "Have some bytes"

  s.description  = <<-DESC
                    bytes is a set of tools to cover many all-day tasks in iOS development.
                   DESC

  s.homepage     = "http://git.tbointeractive.com/chorstmann/bytes"

  s.license      = "MIT"

  s.author      = { "Cornelius Horstmann" => "horstmann@tbointeractive.com", "Thorsten Stark" => "stark@tbointeractive.com", "Bernhard Eiling" => "eiling@tbointeractive.com"  }

  s.platform     = :ios, "8.4"

  s.source       = { :git => "git@git.tbointeractive.com:chorstmann/bytes.git", :tag => '0.1'}

  s.source_files = "bytes/bytes/**/*.swift"

end
