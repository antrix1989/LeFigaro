Pod::Spec.new do |s|
	s.name     = 'ANActivityIndicatorView'
	s.version  = '1.1.0'
	s.license  = 'MIT'
	s.summary  = 'Full screen activity view.'
	s.homepage = 'https://github.com/antrix1989/ANActivityIndicatorView'
	s.authors  = { 'Sergey Demchenko' => 'antrix1989@gmail.com' }
	s.source   = { :git => 'https://github.com/antrix1989/ANActivityIndicatorView.git', :tag => '1.1.0' }
	s.requires_arc = true
	s.ios.deployment_target = '6.0'
	s.source_files = '*.{h,m}'
end

