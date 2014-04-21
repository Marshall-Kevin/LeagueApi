require 'json'
require 'open-uri'
require 'league_api/champion'
require 'league_api/static'
require 'league_api/game'
require 'league_api/summoner'

module LeagueApi
    #@api_key = "nil"
#for now default to development key
    @api_key = "12c41a10-86fc-4d16-934c-277e891e1519"
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
