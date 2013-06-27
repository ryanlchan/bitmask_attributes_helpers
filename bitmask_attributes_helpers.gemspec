# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bitmask_attributes_helpers/version"

Gem::Specification.new do |gem|
  gem.name          = "bitmask_attributes_helpers"
  gem.summary       = %Q{Getters, setters, and scopes for Joel Moss's bitmask_attributes gem}
  gem.email         = "ryan@ryanlchan"
  gem.homepage      = "http://github.com/ryanlchan/bitmask_attributes_helpers"
  gem.authors       = ['Ryan Chan']

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']
  gem.version       = BitmaskAttributesHelpers::VERSION.dup

  gem.add_dependency 'bitmask_attributes'
end
