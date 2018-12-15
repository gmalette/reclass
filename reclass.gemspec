
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "reclass/version"

Gem::Specification.new do |spec|
  spec.name          = "reclass"
  spec.version       = Reclass::VERSION
  spec.authors       = ["Guillaume Malette"]
  spec.email         = ["gmalette@gmail.com"]

  spec.summary       = %q{Allows changing the class of an object at runtime}
  spec.description   = %q{Have you ever needed to change the class of an object at runtime, like ActiveRecord::Base#becomes, but for all references to that object. Were you jealous of IO#reopen, which does exactly that? Now you can too!"}
  spec.homepage      = "https://github.com/gmalette/reclass"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/gmalette/reclass"
    # spec.metadata["changelog_uri"] = nil
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/reclass/extconf.rb"]

  spec.add_development_dependency("bundler", "~> 1.17")
  spec.add_development_dependency("rake", "~> 10.0")
  spec.add_development_dependency("rspec", "~> 3.0")
  spec.add_development_dependency("rake-compiler")
end
