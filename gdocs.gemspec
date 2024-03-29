# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "gdocs/version"

Gem::Specification.new do |s|
  s.name        = "gdocs"
  s.version     = Gdocs::VERSION
  s.authors     = ["Alvaro Insignares Noguera", "Miguel Perez Leal"]
  s.email       = ["alvaro@koombea.com", "miguel.perez@koombea.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "gdocs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency "rspec", "~> 2.6"
  s.add_runtime_dependency 'oauth2', '~> 0.5'

end
