#
# Be sure to run 'pod lib lint Rickenbacker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Rickenbacker'
  s.version          = '1.1.6'
  s.summary          = 'MVVM + RxSwift Project Architecture.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.homepage         = 'https://github.com/yangKJ/Rickenbacker'
  s.description      = 'https://github.com/yangKJ/Rickenbacker/blob/master/README.md'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yangkejun' => 'ykj310@126.com' }
  s.source           = { :git => 'https://github.com/yangKJ/Rickenbacker.git', :tag => "#{s.version}" }
  s.social_media_url = 'https://juejin.cn/user/1987535102554472/posts'
  
  s.ios.deployment_target = '10.0'
  s.swift_version    = '5.0'
  s.requires_arc     = true
  s.static_framework = false
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  
  s.module_name      = 'Rickenbacker'
  s.ios.source_files = 'Sources/Rickenbacker.h'
  
  s.subspec 'Boxs' do |xx|
    xx.source_files = 'Sources/Boxs/*.swift'
    #xx.resource = ['Sources/Boxs/*.bundle']
    xx.resource = 'Sources/Boxs/Rickenbacker.bundle'
  end
  
  s.subspec 'Rx' do |xx|
    xx.source_files = 'Sources/Rx/*.swift'
    xx.dependency 'RxSwift'
    xx.dependency 'RxCocoa'
    xx.dependency 'Rickenbacker/Boxs'
  end
  
  s.subspec 'Adapter' do |xx|
    xx.source_files = 'Sources/Adapter/*.swift'
    xx.dependency 'Rickenbacker/Rx'
  end
  
  s.subspec 'Mediator' do |xx|
    xx.source_files = 'Sources/Mediator/*.{h,mm,swift}'
    xx.libraries = 'c++' # Fixed `Undefined symbol: ___gxx_personality_v0`
  end
  
  s.subspec 'MJRefresh' do |xx|
    xx.source_files = 'Sources/MJRefresh/*.swift'
    xx.dependency 'Rickenbacker/Adapter'
    xx.dependency 'MJRefresh'
    xx.pod_target_xcconfig = {
      'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'RICKENBACKER_MJREFRESH',
      'GCC_PREPROCESSOR_DEFINITIONS' => 'RICKENBACKER_MJREFRESH=1'
    }
  end
  
  s.subspec 'DZNEmptyDataSet' do |xx|
    xx.source_files = 'Sources/DZNEmptyDataSet/*.swift'
    xx.dependency 'Rickenbacker/Adapter'
    xx.dependency 'DZNEmptyDataSet'
    xx.pod_target_xcconfig = {
      'SWIFT_ACTIVE_COMPILATION_CONDITIONS' => 'RICKENBACKER_DZNEMPTYDATASET',
      'GCC_PREPROCESSOR_DEFINITIONS' => 'RICKENBACKER_DZNEMPTYDATASET=1'
    }
  end
  
end
