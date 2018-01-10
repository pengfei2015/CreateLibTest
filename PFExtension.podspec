
Pod::Spec.new do |s|

  s.name         = "PFExtension"
  s.version      = "0.0.1"
  s.summary      = "some classes extension"
  s.homepage     = "https://github.com/pengfei2015/PFExtension"
  s.license      = { :type => "MIT" }
  s.author             = { "feiliu" => "feiliu@qufaya.com" }
  s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/pengfei2015/PFExtension.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/*.swift"

end
