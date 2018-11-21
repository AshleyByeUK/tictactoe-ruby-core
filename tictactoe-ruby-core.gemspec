
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tictactoe/version'

Gem::Specification.new do |spec|
  spec.name          = "tictactoe-ruby-core"
  spec.version       = TicTacToe::VERSION
  spec.authors       = ["Ashley Bye"]
  spec.summary       = %q{A game of TicTacToe.}
  spec.homepage      = ""
  spec.license       = "MIT"
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/|(.yml|.gitignore|.rspec)}) }
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rspec", "~> 3.8"
  spec.add_development_dependency "simplecov", "~> 0.16"
  spec.add_development_dependency "codecov", "~> 0.1"
end
