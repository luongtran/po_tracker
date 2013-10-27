# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "gruff"
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoffrey Grosenbach", "Uwe Kubosch"]
  s.date = "2012-10-16"
  s.description = "Beautiful graphs for one or multiple datasets. Can be used on websites or in documents."
  s.email = "boss@topfunky.com"
  s.homepage = "http://nubyonrails.com/pages/gruff"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "Beautiful graphs for one or multiple datasets."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
