# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hadouken_game/version'

Gem::Specification.new do |spec|
  spec.name          = "hadouken_game"
  spec.version       = HadoukenGame::VERSION
  spec.authors       = ["Mario Idival", "Savia Freitas"]
  spec.email         = ["marioidival@gmail.com", "kakausf_15@hotmail.com"]
  spec.summary       = %q{Projeto para materia: programacao de computadores - IFRN}
  spec.description   = %q{Jogo de hakoudken do IFRN}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
