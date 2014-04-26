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

end
