# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "traffic_control/version"

Gem::Specification.new do |s|
  s.name        = "traffic_control"
  s.version     = TrafficControl::VERSION
  s.authors     = ["Nathan S"]
  s.email       = ["nathan@inspire9.com"]
  s.homepage    = "http://github.com/nathanscott/traffic_control"
  s.summary     = "Helps you monitor your Airport Extreme traffic."
  s.description = "It really helps you monitor your Airport Extreme traffic."

  s.rubyforge_project = "traffic_control"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
