# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-api-wrapper}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jwagener"]
  s.date = %q{2009-05-14}
  s.email = %q{johannes@wagener.cc}
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "lib/soundcloud.rb",
    "lib/soundcloud/models/base.rb",
    "lib/soundcloud/models/comment.rb",
    "lib/soundcloud/models/event.rb",
    "lib/soundcloud/models/playlist.rb",
    "lib/soundcloud/models/track.rb",
    "lib/soundcloud/models/user.rb",
    "spec/ruby_api_wrapper_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/soundcloud/ruby-api-wrapper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/ruby_api_wrapper_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
