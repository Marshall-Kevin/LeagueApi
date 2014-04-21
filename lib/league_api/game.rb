module LeagueApi
	
	class Game
		@base_url

	    def self.build_base_url(modifier)
      		options = LeagueApi.options
      		@base_url = options[:base_url]+'/'+options[:region]+'/'+'v1.3/game/by-summoner/'+modifier+'/recent?api_key='+options[:key]
      		@base_url
      	end
      	
      	def self.make_request(str)
      		build_base_url(str)
      		uri = URI.parse(@base_url)
			JSON.parse(uri.read)
      	end

      	def self.recent_games(id)
      		make_request(id.to_s)
      	end

	end

end