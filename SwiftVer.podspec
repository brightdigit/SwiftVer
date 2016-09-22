Pod::Spec.new do |s|
  s.name = 'SwiftVer'
  s.version = '1.0.1'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'Parses bundle and autorevision version information for use in applications and about pages.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Parses bundle and autorevision version information for use in 
  applications and about pages.
                       DESC

  s.homepage         = 'https://github.com/brightdigit/SwiftVer'
  s.authors = { 'PROJECT_OWNER' => 'USER_EMAIL' }
  s.source = { :git => 'https://github.com/brightdigit/SwiftVer.git', :tag => s.version }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.watchos.deployment_target = '2.0'
  s.source_files = 'Source/*.swift'
end