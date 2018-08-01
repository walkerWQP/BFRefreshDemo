
Pod::Spec.new do |s|


  s.name         = "BFRefresh"
  s.version      = "1.3"
  s.summary      = "列表的加载提示"
  s.swift_version = "4.1"

  s.homepage     = "https://github.com/JQHee/BFRefresh"
  s.license      = "MIT"
  s.author             = { "huangjiaqian" => "18775134221@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/JQHee/BFRefresh.git", :tag => "#{s.version}" }
  s.source_files  = "BFRefresh/**/*.swift"
  s.resource  = "BFRefresh/Resource/*"
  s.dependency "SnapKit"

end
