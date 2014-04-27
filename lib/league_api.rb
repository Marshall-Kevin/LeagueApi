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
  @api_key = ENV["LOL_KEY"]
  @region = "na"

  def self.authenticate(key)
    @api_key = key
  end

  def self.options
    {
      key: @api_key,
      base_url: 'https://prod.api.pvp.net/api/lol',
      region: @region
    }
  end

  # Returns an array of champion names
  def self.get_champion_names
    Static.get_champion_list.keys
  end

  #Retyurns an array of item names
  def self.get_item_names
    items = []
    Static.get_item_list.values.each do |f|
      items << f["name"]
    end
    items
  end

end
