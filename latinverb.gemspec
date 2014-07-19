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
  s.description = %q{This gem takes the four principal parts of a standard Latin verb and then fully conjugates that verb based on the heuristics of the Latin language.}
  s.licenses = ["MIT"]


  s.rubyforge_project = "latinverb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # Latinverb requirements
  s.add_runtime_dependency("macronconversions", "~> 1.0")
  s.add_runtime_dependency("latinverb_querent_for_classification_builder", "~> 1.0")
  s.add_runtime_dependency("linguistics_latin", "~> 1.0.1")
  s.add_runtime_dependency("linguistics_latin_tense_block", "~> 1.0")
  s.add_runtime_dependency("latinverb_imperative_block", "~> 1.0")
  s.add_runtime_dependency("latinverb_classifier", "~> 1.0")
  s.add_runtime_dependency("latinverb_principal_parts_extractor", "~> 1.0")
  s.add_runtime_dependency("latinverb_deponent_string_deriver", "~> 1.0")
  s.add_runtime_dependency("latinverb_stem_deriver", "~> 1.0")
  s.add_runtime_dependency("latinverb_type_evaluator", "~> 1.0")
  s.add_runtime_dependency("latinverb_irregular_verb_definition_consumer", "~> 1.0")
  s.add_runtime_dependency("latinverb_irregular_imperatives_retriever", "~> 1.0")
  s.add_runtime_dependency("latinverb_irregular_infinitives_retriever", "~> 1.0")
  s.add_runtime_dependency("latinverb_irregular_participles_retriever", "~> 1.0")
  s.add_runtime_dependency("latinverb_imperatives", "~> 1.0")
  s.add_runtime_dependency("latinverb_infinitives", "~> 1.0")
  s.add_runtime_dependency("latinverb_participles", "~> 1.0")
  s.add_runtime_dependency("latinverb_serialization", "~> 1.0")

  # Environmental requirements
  s.add_runtime_dependency("rake")
  s.add_runtime_dependency("multi_json", "~>1.8")
end
