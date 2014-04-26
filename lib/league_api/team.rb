module LeagueApi
	
	class Team
		
		@base_url

	    def self.build_base_url(modifier)
      		options = LeagueApi.options
      		@base_url = options[:base_url]+'/'+options[:region]+'/'+'v2.2/team/'+modifier+'?api_key='+options[:key]
      		@base_url
      	end
      	
      	def self.make_request(str)
      		build_base_url(str)
      		uri = URI.parse(@base_url)
			JSON.parse(uri.read)
      	end

      	def self.by_summoner(id)
      		make_request('by-summoner/'+id.to_s)
      	end

      	def self.find_teams(str)
      		make_request(str.gsub(" ",""))
      	end

	end

end