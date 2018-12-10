# -*- encoding: utf-8 -*-
# stub: psych 2.2.4 ruby lib
# stub: ext/psych/extconf.rb

Gem::Specification.new do |s|
  s.name = "psych"
  s.version = "2.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Aaron Patterson", "SHIBATA Hiroshi", "Charles Oliver Nutter"]
  s.date = "2016-11-14"
  s.description = "Psych is a YAML parser and emitter. Psych leverages libyaml[http://pyyaml.org/wiki/LibYAML]\nfor its YAML parsing and emitting capabilities. In addition to wrapping libyaml,\nPsych also knows how to serialize and de-serialize most Ruby objects to and from the YAML format.\n"
  s.email = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org", "headius@headius.com"]
  s.extensions = ["ext/psych/extconf.rb"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "README.md"]
  s.files = ["CHANGELOG.rdoc", "README.md", "ext/psych/extconf.rb"]
  s.homepage = "https://github.com/ruby/psych"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.2")
  s.rubygems_version = "2.6.11"
  s.summary = "Psych is a YAML parser and emitter"

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake-compiler>, [">= 0.4.1"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
    else
      s.add_dependency(%q<rake-compiler>, [">= 0.4.1"])
      s.add_dependency(%q<minitest>, ["~> 5.0"])
    end
  else
    s.add_dependency(%q<rake-compiler>, [">= 0.4.1"])
    s.add_dependency(%q<minitest>, ["~> 5.0"])
  end
end
