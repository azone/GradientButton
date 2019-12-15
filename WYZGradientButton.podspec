Pod::Spec.new do |spec|

  spec.name         = "WYZGradientButton"
  spec.version      = "0.2.0"
  spec.summary      = "Gradient button for iOS written in Swift"

  spec.description  = <<-DESC
  GradientButton 是一个用 Swift 写的 iOS 渐变按钮。
                   DESC

  spec.homepage     = "https://github.com/azone/GradientButton"
  spec.screenshots  = "https://github.com/azone/GradientButton/raw/master/demo.gif"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Yozone Wang" => "wangyaozh@gmail.com" }
  
  spec.swift_version = "5.1"
  spec.ios.deployment_target = "8.0"
  spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/azone/GradientButton.git", :tag => spec.version }

  spec.source_files  = "Sources/**/*.swift"
end
