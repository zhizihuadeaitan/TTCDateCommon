
Pod::Spec.new do |s|
  s.name         = 'TTCDateCommon'
  s.version      = '1.0.0'
  s.license          = 'MIT'
  s.homepage     = 'https://github.com/zhizihuadeaitan/TTCDateCommon'
  s.author             = { 'Cindy' => '493761458@qq.com' }
  s.summary      = '可拖动按钮'
  s.source       = { :git => 'https://github.com/zhizihuadeaitan/TTCDateCommon.git', :tag => '1.0.0' }
  s.source_files  = 'TTCDateCommon', 'TTCDateCommon/**/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '8.0'

end

