# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "comma"
  s.version = "3.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Marcus Crafter", "Tom Meier"]
  s.date = "2012-11-11"
  s.description = "Ruby Comma Seperated Values generation library"
  s.email = ["crafterm@redartisan.com", "tom@venombytes.com"]
  s.homepage = "http://github.com/crafterm/comma"
  s.require_paths = ["lib"]
  s.rubyforge_project = "comma"
  s.rubygems_version = "2.0.3"
  s.summary = "Ruby Comma Seperated Values generation library"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_development_dependency(%q<sqlite3>, ["~> 1.3.4"])
      s.add_development_dependency(%q<appraisal>, ["~> 0.4.1"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
    else
      s.add_dependency(%q<rake>, ["~> 0.9.2"])
      s.add_dependency(%q<sqlite3>, ["~> 1.3.4"])
      s.add_dependency(%q<appraisal>, ["~> 0.4.1"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, ["~> 0.9.2"])
    s.add_dependency(%q<sqlite3>, ["~> 1.3.4"])
    s.add_dependency(%q<appraisal>, ["~> 0.4.1"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
  end
end
