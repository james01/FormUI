Pod::Spec.new do |s|
  s.name             = "FormUI"
  s.version          = "0.1.0"
  s.summary          = "Powerfully simple form builder for UIKit."
  s.homepage         = "https://github.com/james01/FormUI"
  s.screenshots      = ["https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Event.gif",
                        "https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Profile.gif",
                        "https://raw.githubusercontent.com/james01/FormUI/main/Docs/Images/Display.gif"
                        ]
  s.license          = { :type => "MIT", :file => "LICENSE" }
  s.author           = { "James Randolph" => "jwrand16@gmail.com" }
  s.social_media_url = "https://twitter.com/jamesrandolph01"
  s.platform         = :ios, "13.0"
  s.source           = { :git => "https://github.com/james01/FormUI.git", :tag => "#{s.version}" }
  s.source_files     = "Sources/**/*.{swift}"
  s.frameworks       = "UIKit"
  s.swift_version    = "5.3"
end
