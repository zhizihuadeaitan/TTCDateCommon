
Pod::Spec.new do |s|
  s.name         = 'TTCDateCommon'
  s.version      = '1.0.3'
  s.license          = 'MIT'
  s.homepage     = 'https://github.com/zhizihuadeaitan/TTCDateCommon'
  s.author             = { 'Cindy' => '493761458@qq.com' }
  s.summary      = '日期相关方法'
  s.source       = { :git => 'https://github.com/zhizihuadeaitan/TTCDateCommon.git', :tag => '1.0.3' }
  s.source_files  = 'TTCDateCommon', 'TTCDateCommon/**/*.{h,m}'
  s.requires_arc = true
  s.platform     = :ios, '9.0'

end

