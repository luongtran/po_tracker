# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "to-csv"
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["\u{c3}\u{8d}caro Leopoldino da Motta"]
  s.date = "2010-08-09"
  s.description = "Convert arrays to CSV (array of hashes, matrixes, ActiveRecord objects etc)."
  s.email = "icaro.ldm@gmail.com"
  s.extra_rdoc_files = ["README.rdoc", "CHANGELOG.rdoc"]
  s.files = ["README.rdoc", "CHANGELOG.rdoc"]
  s.homepage = "http://github.com/ilmotta/to-csv"
  s.post_install_message = "\n========================================================================\n\n  Thanks for installing ToCSV.\n\n  If your Ruby version is lower than 1.9 you need to install fastercsv.\n\n    $ sudo gem install fastercsv\n\n========================================================================\n\n"
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.8.7")
  s.rubygems_version = "1.8.23"
  s.summary = "Convert arrays to CSV (array of hashes, matrixes, ActiveRecord objects etc)."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.5"])
      s.add_development_dependency(%q<activerecord>, [">= 2.3.5"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.5"])
      s.add_dependency(%q<activerecord>, [">= 2.3.5"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.5"])
    s.add_dependency(%q<activerecord>, [">= 2.3.5"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
  end
end
