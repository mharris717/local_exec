# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: local_exec 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "local_exec"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Harris"]
  s.date = "2014-06-19"
  s.description = "local_exec"
  s.email = "mharris717@gmail.com"
  s.executables = ["local_exec", "print_deps"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".overapp",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "bin/local_exec",
    "bin/print_deps",
    "config/mongoid.yml",
    "lib/local_exec.rb",
    "lib/local_exec/command.rb",
    "lib/local_exec/dsl.rb",
    "lib/local_exec/exec.rb",
    "lib/local_exec/gemfile.rb",
    "lib/local_exec/main.rb",
    "local_exec.gemspec",
    "spec/local_exec_spec.rb",
    "spec/spec_helper.rb",
    "spec/support/mongo_connect.rb",
    "vol/.gitkeep",
    "vol/instance_eval_test.rb"
  ]
  s.homepage = "http://github.com/mharris717/local_exec"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "local_exec"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mharris_ext>, [">= 0"])
      s.add_runtime_dependency(%q<andand>, [">= 0"])
      s.add_runtime_dependency(%q<mongoid_gem_config>, [">= 0"])
      s.add_runtime_dependency(%q<trollop>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_development_dependency(%q<guard>, [">= 0"])
      s.add_development_dependency(%q<guard-rspec>, [">= 0"])
      s.add_development_dependency(%q<guard-spork>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, ["~> 0.9"])
    else
      s.add_dependency(%q<mharris_ext>, [">= 0"])
      s.add_dependency(%q<andand>, [">= 0"])
      s.add_dependency(%q<mongoid_gem_config>, [">= 0"])
      s.add_dependency(%q<trollop>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.8.0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
      s.add_dependency(%q<guard>, [">= 0"])
      s.add_dependency(%q<guard-rspec>, [">= 0"])
      s.add_dependency(%q<guard-spork>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<mharris_ext>, [">= 0"])
    s.add_dependency(%q<andand>, [">= 0"])
    s.add_dependency(%q<mongoid_gem_config>, [">= 0"])
    s.add_dependency(%q<trollop>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.8.0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.8.7"])
    s.add_dependency(%q<guard>, [">= 0"])
    s.add_dependency(%q<guard-rspec>, [">= 0"])
    s.add_dependency(%q<guard-spork>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, ["~> 0.9"])
  end
end

