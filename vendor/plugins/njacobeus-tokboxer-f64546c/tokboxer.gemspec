# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tokboxer}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nicolas Jacobeus"]
  s.date = %q{2008-12-29}
  s.description = %q{This is a ruby implementation of the TokBox API. Tokbox is a free video calling / video mailing platform (see http://www.tokbox.com).  All API methods specified in the Tokbox Developer API wiki (http://developers.tokbox.com/index.php/API) are implemented but not all objects yet. So you may have to dig into the hash returned by the call (XML converted to a Ruby hash).  For the moment, this gem currently specifically serves our needs for the implementation of video conversations and video mails on iStockCV (www.istockcv.com), an online recruitment network which we are developing. Your needs may vary so feel free to contact me (nj@belighted.com).}
  s.email = ["nj@belighted.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "lib/TokBoxer/Api.rb", "lib/TokBoxer/Call.rb", "lib/TokBoxer/Exceptions.rb", "lib/TokBoxer/User.rb", "lib/TokBoxer/VMail.rb", "lib/tokboxer.rb", "tokboxer.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/njacobeus/tokboxer/}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tokboxer}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{This is a ruby implementation of the TokBox API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<xml-simple>, [">= 1.0.11"])
      s.add_development_dependency(%q<newgem>, [">= 1.0.5"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<xml-simple>, [">= 1.0.11"])
      s.add_dependency(%q<newgem>, [">= 1.0.5"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<xml-simple>, [">= 1.0.11"])
    s.add_dependency(%q<newgem>, [">= 1.0.5"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
