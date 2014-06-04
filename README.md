# LeagueApi

[![Build Status](https://travis-ci.org/DanBradbury/LeagueApi.svg?branch=master)](https://travis-ci.org/DanBradbury/LeagueApi)  [![Code Climate](https://codeclimate.com/github/DanBradbury/LeagueApi.png)](https://codeclimate.com/github/DanBradbury/LeagueApi) [![Gem Version](https://badge.fury.io/rb/league_api.svg)](http://badge.fury.io/rb/league_api)

A 1-1 mapping of the Riot Developer APIs to a Ruby Gem with a convenient abstraction to get the most from the API (always growing).

## Installation

    gem install league_api

## Usage
In order to use the API you must have a developer key which can be obtained at (https://developer.riotgames.com/):

    export LOL_KEY="your-key"

Once you set the LOL_KEY (will be changing to API_KEY in the near future) you can start to play with the API methods that Riot provides (https://developer.riotgames.com/api/methods).

####Available Methods

    LeagueApi::Champion [ get_list, get_free_champs, get_by_id(id) ]
    LeagueApi::Game [ recent_games(id) ]
    LeagueApi::Static [ get_champion_list, get_inverted_champion_list, get_champion_by_name/id, get_item_list/by_id, get_mastery_list/by_id, get_realm, get_rune_list/by_id, get_summoner_spells/by_id, get_versions, get_champion_image, get_summoner_image ]
    LeagueApi::Summoner [ find_by_name, find_summoners(list="id1, id2, .."), get_masteries(list), get_names(list),
                    get_runes(list) ]
    LeagueApi::League [ entry_/by_summoner(id), entry_/by_team(realId), get_challenger(league="SOLO_5x5") ]
    LeagueApi::Stats [ ranked(id), summary(id) ]
    LeagueApi::Team [ by_summoner(id), find_teams(ids) ]
    LeagueApi::Util [ organize_players(player_list), get_game_stats(game_stats_hash) ]


Since the API returns JSON there is typically more information than we typically want. Because of this there are / will be more, *convenience methods* available.

    LeagueApi.get_champion_list #Fetch array of champions names
    LeagueApi [ get_item_names, get_summoner_id(name), last_game_played(summoner_id) ]

Right now there are not many methods available
## Contributing

Is very much appreciated so feel free to submit a PR and we can see if we can get it merged in.

