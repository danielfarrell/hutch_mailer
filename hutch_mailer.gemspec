# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hutch/mailer/version'

Gem::Specification.new do |gem|
  gem.name          = 'hutch_mailer'
  gem.version       = Hutch::Mailer::VERSION
  gem.authors       = ['Daniel Farrell']
  gem.email         = ['danielfarrell76@gmail.com']
  gem.description   = %q( ActionMailer support for Hutch )
  gem.summary       = %q( ActionMailer support for Hutch )
  gem.homepage      = 'https://github.com/danielfarrell/hutch_mailer'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/).reject { |f| f == 'Gemfile.lock' }
  gem.executables   = gem.files.grep(/^bin/).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(/^(test|spec|features)\//)
  gem.require_paths = ['lib']
  gem.add_dependency 'hutch', '>= 0.10'

end