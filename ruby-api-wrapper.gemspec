# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{ruby-api-wrapper}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Johannes Wagener"]
  s.date = %q{2009-07-01}
  s.email = %q{johannes@wagener.cc}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.html",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.html",
     "README.rdoc",
     "Rakefile",
     "VERSION.yml",
     "doc/classes/Soundcloud.html",
     "doc/classes/Soundcloud.src/M000001.html",
     "doc/classes/Soundcloud.src/M000002.html",
     "doc/classes/Soundcloud/Models.html",
     "doc/classes/Soundcloud/Models/Comment.html",
     "doc/classes/Soundcloud/Models/Comment.src/M000007.html",
     "doc/classes/Soundcloud/Models/Event.html",
     "doc/classes/Soundcloud/Models/Event.src/M000009.html",
     "doc/classes/Soundcloud/Models/Playlist.html",
     "doc/classes/Soundcloud/Models/Playlist.src/M000009.html",
     "doc/classes/Soundcloud/Models/Playlist.src/M000010.html",
     "doc/classes/Soundcloud/Models/Track.html",
     "doc/classes/Soundcloud/Models/Track.src/M000003.html",
     "doc/classes/Soundcloud/Models/Track.src/M000004.html",
     "doc/classes/Soundcloud/Models/Track.src/M000005.html",
     "doc/classes/Soundcloud/Models/Track.src/M000006.html",
     "doc/classes/Soundcloud/Models/User.html",
     "doc/classes/Soundcloud/Models/User.src/M000008.html",
     "doc/created.rid",
     "doc/files/lib/soundcloud/models/base_rb.html",
     "doc/files/lib/soundcloud/models/comment_rb.html",
     "doc/files/lib/soundcloud/models/event_rb.html",
     "doc/files/lib/soundcloud/models/playlist_rb.html",
     "doc/files/lib/soundcloud/models/track_rb.html",
     "doc/files/lib/soundcloud/models/user_rb.html",
     "doc/files/lib/soundcloud_rb.html",
     "doc/fr_class_index.html",
     "doc/fr_file_index.html",
     "doc/fr_method_index.html",
     "doc/index.html",
     "doc/rdoc-style.css",
     "lib/soundcloud.rb",
     "lib/soundcloud/models/base.rb",
     "lib/soundcloud/models/comment.rb",
     "lib/soundcloud/models/event.rb",
     "lib/soundcloud/models/playlist.rb",
     "lib/soundcloud/models/track.rb",
     "lib/soundcloud/models/user.rb",
     "ruby-api-wrapper.gemspec",
     "spec/fixtures/test_track.mp3",
     "spec/soundcloud_comment_spec.rb",
     "spec/soundcloud_event_spec.rb",
     "spec/soundcloud_playlist_spec.rb",
     "spec/soundcloud_spec.rb",
     "spec/soundcloud_track_spec.rb",
     "spec/soundcloud_user_spec.rb",
     "spec/spec_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/soundcloud/ruby-api-wrapper}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/soundcloud_spec.rb",
     "spec/soundcloud_user_spec.rb",
     "spec/soundcloud_comment_spec.rb",
     "spec/soundcloud_playlist_spec.rb",
     "spec/spec_helper.rb",
     "spec/soundcloud_event_spec.rb",
     "spec/soundcloud_track_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jwagener-oauth-active-resource>, [">= 0"])
      s.add_runtime_dependency(%q<oauth>, [">= 0"])
    else
      s.add_dependency(%q<jwagener-oauth-active-resource>, [">= 0"])
      s.add_dependency(%q<oauth>, [">= 0"])
    end
  else
    s.add_dependency(%q<jwagener-oauth-active-resource>, [">= 0"])
    s.add_dependency(%q<oauth>, [">= 0"])
  end
end
