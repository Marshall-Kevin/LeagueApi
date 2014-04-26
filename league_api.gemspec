# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "league_api"
  spec.version       = "0.1.0"
  spec.authors       = ["DanBradbury"]
  spec.email         = ["dan.luckydaisy@gmail.com"]
  spec.summary       = %q{Requests to Riot Developer API}
  spec.description   = %q{Mapping of Riot Developer APIs to a simple/convenient abstraction. Always updating to add more helpful abstractions and uses that utilize the API to the fullest}
  spec.homepage      = "https://github.com/DanBradbury/LeagueApi"
  spec.license       = "MIT"

  spec.files         = ["lib/league_api.rb", "lib/league_api/champion.rb", "lib/league_api/static.rb", "lib/league_api/game.rb", "lib/league_api/summoner.rb", "lib/league_api/league.rb", "lib/league_api/team.rb", "lib/league_api/stats.rb"]
  spec.executables   = []
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
