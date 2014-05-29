require 'json'
require 'open-uri'
require 'league_api/champion'
require 'league_api/static'
require 'league_api/game'
require 'league_api/summoner'
require 'league_api/league'
require 'league_api/team'
require 'league_api/stats'
require 'league_api/util'

module LeagueApi
  extend self

  @api_key = ENV["LOL_KEY"]
  @region = "na"

  def make_request(base, modifier=nil, params=nil)
    url = base + modifier

    if params
    
      params.each do |p|
        url << '?'+p[0]+'='+p[1]
      end
      url += '&api_key=' + @api_key
    
    else

      url += '?api_key=' + @api_key
    
    end

    uri = URI.parse(url)
    JSON.parse(uri.read)
  end

  #Display all available Requests for all API classes
  def available_requests
    c = self.constants
    requests = {}
    
    c.each do |i|
      requests[eval(i.to_s)] = eval(i.to_s).requests
    end
    
    requests
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

  # Return unformatted JSON of the last game played
  def get_last_game_played(id)
    Game.recent_games(id).first
  end

  # Return a String for the last champion played
  def get_last_champion_played(id)
    champ_id = Game.recent_games(id).first["championId"]
    Static.get_inverted_champion_list[champ_id]
  end

  # Return the Time for the last played game
  def get_time_of_last_game(id)
    Time.at( Game.recent_games(id).first["createDate"] / 1000 )
  end

end
