spec = Gem::Specification.new do |s|
  s.name         = "annyong"
  s.version      = "0.4"
  s.platform     = Gem::Platform::RUBY
  s.authors      = "Rémi Prévost"
  s.email        = "remi@exomel.com"
  s.homepage     = "http://github.com/remiprev/annyong"
  s.summary      = "Start a public static Web server in the current directory."
  s.description  = "Annyong starts a public static Web server in the current directory, allowing people in your local network to browse your files."
  s.files        = Dir["lib/**/*.rb", "README.mkd", "LICENSE", "bin/*", "assets/**/*"]
  s.require_path = "lib"

  s.executables << "annyong"
  s.add_runtime_dependency "rack", [">= 1.1.0"]
end
