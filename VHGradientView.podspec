Pod::Spec.new do |spec|

  spec.name         = "VHGradientView"
  spec.version      = "1.0.1"
  spec.summary      = "VHGradientView is an UIView which helps you to apply your gradient colors on it."

  spec.homepage     = "https://github.com/vidalhara/VHGradientView"

  spec.license      = "MIT"

  spec.author       = "Vidal HARA"

  spec.platform     = :ios, "9.0"
  spec.swift_versions = ['4.0', '5.1', '5.2', '5.3']

  spec.source       = { :git => "https://github.com/vidalhara/VHGradientView.git", :tag => spec.version }

  spec.source_files = "VHGradientView/**/*.swift"
  spec.frameworks = "UIKit"
end
