require 'json'
require 'open-uri'
require 'league_api/champion'
require 'league_api/static'
require 'league_api/game'
require 'league_api/summoner'
require 'league_api/league'
require 'league_api/team'
require 'league_api/stats'

module LeagueApi
  extend self

  @api_key = ENV["LOL_KEY"]
  @region = "na"

  def make_request(base, modifier=nil, params=nil)
    url = base + modifier + '?api_key=' + @api_key

    if params != nil
      url << '&type='+params
    end

    uri = URI.parse(url)
    JSON.parse(uri.read)
  end

  # Returns an array of champion names
  def get_champion_names
    Static.get_champion_list.keys
  end

  # Returns an array of item names
  def get_item_names
    items = []
    Static.get_item_list.values.each do |f|
      items << f["name"]
    end
    items
  end

  # Return player id given the summoner name
  def get_summoner_id(str)
    Summoner.find_by_name(str)["id"]
  end

  def get_last_game_played(id)
    Game.recent_games(id).first
  end

end
