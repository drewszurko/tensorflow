# Run `pod lib lint TensorFlowLiteSwift.podspec` to ensure this is a valid spec.

Pod::Spec.new do |s|
  s.name             = 'TensorFlowLiteSwift'
  s.version          = '0.1.0'
  s.authors          = 'Google Inc.'
  s.license          = { :type => 'Apache' }
  s.homepage         = 'https://github.com/tensorflow/tensorflow'
  s.source           = { :git => 'https://github.com/tensorflow/tensorflow.git', :commit => '2b96dde' }
  s.summary          = 'TensorFlow Lite for Swift'
  s.description      = <<-DESC

  TensorFlow Lite is TensorFlow's lightweight solution for Swift developers. It
  enables low-latency inference of on-device machine learning models with a
  small binary size and fast performance supporting hardware acceleration.
                       DESC

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'

  s.module_name = 'TensorFlowLite'
  s.static_framework = true

  tfl_dir = 'tensorflow/lite/'
  swift_dir = tfl_dir + 'experimental/swift/'
  s.source_files = swift_dir + 'Sources/*.swift'
  s.dependency 'TensorFlowLiteC', "#{s.version}"

  s.test_spec 'Tests' do |ts|
    ts.source_files = swift_dir + 'Tests/*.swift'
    ts.resources = [
      tfl_dir + 'testdata/add.bin',
      tfl_dir + 'testdata/add_quantized.bin',
    ]
  end
end
