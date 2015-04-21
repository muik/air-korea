$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "air_korea/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "air_korea"
  s.version     = AirKorea::VERSION
  s.authors     = ["Mu-ik Jeon"]
  s.email       = ["muikor@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of AirKorea."
  s.description = "TODO: Description of AirKorea."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
end
