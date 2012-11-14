$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "geous/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "geous"
  s.version     = Geous::VERSION
  s.authors     = ["RJ Zaworski"]
  s.email       = ["rj@rjzaworski.com"]
  s.homepage    = "http://github.com/rjz/geous.js"
  s.summary     = "Javascript geolocation and geocoding tasks"

  s.files = Dir["{lib,vendor}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.1.3"
end
