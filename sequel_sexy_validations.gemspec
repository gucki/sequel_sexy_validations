# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{sequel_sexy_validations}
  s.version = "0.2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Corin Langosch"]
  s.date = %q{2010-11-14}
  s.description = %q{Sequel plugin which provides sexy validations for model.}
  s.email = %q{info@netskin.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/sequel_sexy_validations.rb",
     "lib/sequel_sexy_validations/validators/presence.rb",
     "lib/sequel_sexy_validations/validators/uniqueness.rb",
     "sequel_sexy_validations.gemspec",
     "spec/sequel_sexy_validations_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/gucki/sequel_sexy_validations}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Sexy validations for Sequel}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/sequel_sexy_validations_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sexy_validations>, [">= 0.0.1"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<sexy_validations>, [">= 0.0.1"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<sexy_validations>, [">= 0.0.1"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

