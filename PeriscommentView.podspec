Pod::Spec.new do |s|
  s.name         = "PeriscommentView"
  s.version      = "0.0.1"
  s.summary      = "Showing comments like Periscope"

  s.homepage     = "http://github.com/yoavlt/PeriscommentView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Takuma Yoshida" => "yoa.jmpr.w@gmail.com" }
  s.social_media_url   = "http://twitter.com/yoavlt"

  s.platform     = :ios
  s.ios.deployment_target = "8.0"

  s.source       = { :git => "http://github.com/yoavlt/PeriscommentView.git", :tag => "0.0.1" }
  s.source_files  = "PeriscommentView", "PeriscommentView/**/*.swift"
  s.exclude_files = "PeriscommentView/Exclude"

end
