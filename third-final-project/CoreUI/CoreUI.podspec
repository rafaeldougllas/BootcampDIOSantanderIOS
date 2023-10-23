Pod::Spec.new do |s|
  s.name             = 'CoreUI'
  s.version          = '0.1.0'
  s.summary          = 'A short description of CoreUI.'

  s.description      = 'The core of the UI guidelines'

  s.homepage         = 'https://github.com/rafael douglas/CoreUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rafael douglas' => 'rafael.dougllas@gmail.com' }
  s.source           = { :git => 'https://github.com/rafael douglas/CoreUI.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'

  s.source_files = 'CoreUI/Classes/**/*'
  
  s.subspec 'Debug' do |debug|
        debug.source_files = 'CoreUI/Classes/**/*.{swift, h, m}'
        debug.resources = 'CoreUI/Assets/**/*.{json, xml, storyboard, xib}'
        debug.test_spec 'Tests' do |test_spec|
              test_spec.source_files = 'CoreUI/Tests/**/*.{swift, h, m}'
        end
  end
  
  s.default_subspecs = 'Release'
    s.subspec 'Release' do |release|
       release.vendored_frameworks = 'Framework/CoreUI.framework'
    end
  
  # s.resource_bundles = {
  #   'CoreUI' => ['CoreUI/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
