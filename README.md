# LeagueApi

[![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Code Climate](https://codeclimate.com/github/DanBradbury/LeagueApi.png)](https://codeclimate.com/github/DanBradbury/LeagueApi)

A 1-1 mapping of the Riot Developer APIs to a convenient and light weight ruby gem. 

Tested on Ruby 2.1, using json + open-uri for bare minimum requests. (could always use improvement)

## Installation

    gem install league_api

## Usage

    LeagueApi::Champion [ get_list, get_by_id(id) ]
    LeagueApi::Game [ recent_games(id ]
    LeagueApi::Static [ get_champion_list, get_champion_by_name/id, get_item_list/by_id, 
                    get_mastery_list/by_id, get_realm, get_rune_list/by_id, get_summoner_spells/by_id, get_versions ] 
    LeagueApi::Summoner [ find_by_name, find_summoners(list="id1, id2, .."), get_masteries(list), get_names(list),
                    get_runes(list) ]
## Contributing

1. Fork it ( https://github.com/[my-github-username]/league_api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
