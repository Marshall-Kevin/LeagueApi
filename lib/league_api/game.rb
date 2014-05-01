module LeagueApi

	class Game
		@base_url = 'https://prod.api.pvp.net/api/lol/na/v1.3/game/by-summoner/'

		def self.make_request(str)
			LeagueApi.make_request(@base_url, str)
		end

		def self.recent_games(id)
			make_request(id.to_s+'/recent')["games"]
		end

	end

end