# LeagueApi

[![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Code Climate](https://codeclimate.com/github/DanBradbury/LeagueApi.png)](https://codeclimate.com/github/DanBradbury/LeagueApi)

A 1-1 mapping of the Riot Developer APIs to a Ruby Gem with a convenient abstraction to get the most from the API (always growing).

## Installation

    gem install league_api
    export LOL_KEY="your-key"

## Usage
Every section of the API can be accessed individually by the following grammar:
	
	LeagueApi::RESOURCE Champion | Game | League | Static | Stats | Summoner | Team

    LeagueApi::Champion [ get_list, get_by_id(id) ]
    LeagueApi::Game [ recent_games(id ]
    LeagueApi::Static [ get_champion_list, get_champion_by_name/id, get_item_list/by_id, 
                    get_mastery_list/by_id, get_realm, get_rune_list/by_id, get_summoner_spells/by_id, get_versions ] 
    LeagueApi::Summoner [ find_by_name, find_summoners(list="id1, id2, .."), get_masteries(list), get_names(list),
                    get_runes(list) ]
    LeagueApi::League [ entry_/by_summoner(id), entry_/by_team(realId), get_challenger(league="SOLO_5x5") ]
    LeagueApi::Stats [ ranked(id), summary(id) ]
    LeagueApi::Team [ by_summoner(id), find_teams(ids) ]

## Contributing

1. Fork it ( https://github.com/[my-github-username]/league_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
