module LeagueApi

	class Game
		@base_url = "https://prod.api.pvp.net/api/lol/na/v1.3/game/by-summoner/"

		def self.make_request(str, region=nil)
      LeagueApi.make_request(@base_url, str, nil, region)
		end

		def self.recent_games(id, region=nil)
			make_request(id.to_s+'/recent', region)["games"]
		end

		def self.requests
			%w( recent_games(summoner_id) )
		end

	end

end