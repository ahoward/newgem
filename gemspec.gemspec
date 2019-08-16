## newgem.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "newgem"
  spec.version = "0.4.2"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "newgem"
  spec.description = "a svelt cli time-tracker for ruby"
  spec.license = "Ruby"

  spec.files =
["LICENSE",
 "README.md",
 "Rakefile",
 "bin",
 "gemspec.gemspec",
 "lib",
 "lib/_newgem.rb",
 "lib/newgem.rb",
 "samples"]

  spec.executables = []
  
  spec.require_path = "lib"

  spec.test_files = nil

  
    spec.add_dependency(*["main", " ~> 4.8.1"])
  
    spec.add_dependency(*["map", " ~> 5.1.0"])
  
    spec.add_dependency(*["chronic", " ~> 0.6.6"])
  

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/newgem"
end
