# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_tts/version'

Gem::Specification.new do |gem|
  gem.name          = "google_tts"
  gem.version       = GoogleTts::VERSION
  gem.authors       = ["Povilas Jurcys"]
  gem.email         = ["povilas@d9.lt", "bloomrain@gmail.com"]
  gem.description   = %q{Text to speech converter (using google TTS service)}
  gem.summary       = %q{Text to speech converter (using google TTS service)}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
