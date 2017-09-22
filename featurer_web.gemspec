$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'featurer_web/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'featurer_web'
  s.version     = FeaturerWeb::VERSION
  s.authors     = ['Juan González']
  s.email       = ['juan.gonzalez@xing.com']
  s.homepage    = 'https://github.com/opsidao/featurer_web'
  s.summary     = 'Summary of FeaturerWeb.'
  s.description = 'Description of FeaturerWeb.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']

  s.add_dependency 'rails', '>= 4.2.7'
  s.add_dependency 'featurer', '~> 0.1.1'
end
