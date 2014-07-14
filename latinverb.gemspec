# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "latinverb/version"

Gem::Specification.new do |s|
  s.name        = "latinverb"
  s.version     = Linguistics::Latin::Verb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Steven G. Harms"]
  s.email       = ["steven.harms@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/latinverb"
  s.summary     = %q{Gem designed to fully conjugate Latin verbs}
  s.description = %q{This gem takes the four principal parts of a standard Latin verb and then fully conjugates that verb based on the heristics of the Latin language.}


  s.rubyforge_project = "latinverb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Latinverb requirements
  s.add_runtime_dependency("macronconversions")
  s.add_runtime_dependency("linguistics_latin", "~>0.0.2")
  s.add_runtime_dependency("latinverb_classifier", "1.0.0.pre.1")
  s.add_runtime_dependency("latinverb_principal_parts_extractor")
  s.add_runtime_dependency("latinverb_stem_deriver")

  # Environmental requirements
  s.add_runtime_dependency("rake")
  s.add_runtime_dependency("multi_json", "~>1.8")
end
