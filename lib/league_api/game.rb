module LeagueApi

	class Game
		@base_url = "https://prod.api.pvp.net/api/lol/"
		@post_url = "/v1.3/game/by-summoner/"

		def self.make_request(str, region=nil)
      @region = LeagueApi.get_region region
      base = LeagueApi.change_base(@base_url, @region)

      LeagueApi.make_request(base+@region+@post_url, str)
		end

		def self.recent_games(id)
			make_request(id.to_s+'/recent')["games"]
		end

		def self.requests
			%w( recent_games(summoner_id) )
		end

	end

end