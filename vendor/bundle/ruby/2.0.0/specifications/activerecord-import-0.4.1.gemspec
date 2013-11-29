# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "activerecord-import"
  s.version = "0.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Zach Dennis"]
  s.date = "2013-07-22"
  s.description = "Extraction of the ActiveRecord::Base#import functionality from ar-extensions for Rails 3 and beyond"
  s.email = ["zach.dennis@gmail.com"]
  s.homepage = "http://github.com/zdennis/activerecord-import"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.0.3"
  s.summary = "Bulk-loading extension for ActiveRecord"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
