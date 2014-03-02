$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spree/ember/frontend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spree_ember_frontend"
  s.version     = Spree::Ember::Frontend::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SpreeFrontend."
  s.description = "TODO: Description of SpreeFrontend."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'spree_core'
  s.add_dependency 'spree_api'
  s.add_dependency "rails", "~> 4.0.3"
  s.add_dependency 'bootstrap-sass', '~> 3.1.0'
  s.add_dependency "ember-source", "1.4.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "qunit-rails"
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'thin'
  s.add_development_dependency 'teaspoon'
end
