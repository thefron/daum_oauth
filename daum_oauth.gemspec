# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{daum_oauth}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Hoseong Hwang"]
  s.date = %q{2010-11-02}
  s.description = %q{Daum OAuth API client library for ruby}
  s.email = %q{thefron@wafflestudio.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/daum_oauth.rb", "lib/daum_oauth/blog.rb", "lib/daum_oauth/cafe.rb", "lib/daum_oauth/client.rb", "lib/daum_oauth/yozm.rb"]
  s.files = ["README.rdoc", "Rakefile", "daum_oauth.gemspec", "lib/daum_oauth.rb", "lib/daum_oauth/blog.rb", "lib/daum_oauth/cafe.rb", "lib/daum_oauth/client.rb", "lib/daum_oauth/yozm.rb", "Manifest"]
  s.homepage = %q{http://github.com/thefron/daum_oauth}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Daum_oauth", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{daum_oauth}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Daum OAuth API client library for ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
