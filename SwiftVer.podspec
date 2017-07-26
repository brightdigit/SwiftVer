Pod::Spec.new do |s|
  s.name = 'SwiftVer'
  s.version = '2.0.1'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'Parses bundle and autorevision version information for use in applications and about pages.'
  s.description      = <<-DESC
  Parses bundle and autorevision version information for use in
  applications and about pages.
                       DESC

  s.homepage         = 'https://github.com/brightdigit/SwiftVer'
  s.authors = { 'Leo G Dion' => 'leogdion@brightdigit.com' }
  s.source = { :git => 'https://github.com/brightdigit/SwiftVer.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.source_files = 'Source/*.swift'
  s.documentation_url = 'https://github.com/brightdigit/swiftver'
end
