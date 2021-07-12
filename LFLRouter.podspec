Pod::Spec.new do |s|
  s.name             = 'LFLRouter'
  s.version          = '1.0.0'
  s.summary          = 'LFLRouter：不需要Load注册的URL路由方案'
  s.description      = "
  LFLRouter：不需要Load注册的URL路由方案
  不再需要维护Block对象，不用关注是否注册。
  "
  s.homepage         = 'https://github.com/DevDragonli/LFLRouter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'DevDragonli' => 'DragonLi_52171@163.com' }
  s.source           = { :git => 'https://github.com/DevDragonli/LFLRouter.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  
  s.public_header_files = 'LFLRouter/LFLRouter.h'
  
  s.source_files = 'LFLRouter/**/*.{h,m}'
    
end
