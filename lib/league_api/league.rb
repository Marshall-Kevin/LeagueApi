module LeagueApi

	class League

		@base_url
	    
	    def self.build_base_url(modifier, params=nil)
                  options = LeagueApi.options
                  extra = options[:key].dup
                  if params != nil
                        extra << '&type='+params
      	      end
            	@base_url = options[:base_url]+'/'+options[:region]+'/'+'v2.3/league/'+modifier+'?api_key='+extra
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

            def self.entry_by_summoner(id)
                  make_request('by-summoner/'+id.to_s+'/entry')
            end

            def self.by_team(id)
                  make_request('by-team/'+id.to_s)
            end

            def self.entry_by_team(id)
                  make_request('by-team/'+id.to_s+'/entry')
            end

            def self.get_challenger(queue="RANKED_SOLO_5x5")
                  build_base_url('challenger', queue)
                  uri = URI.parse(@base_url)
                  JSON.parse(uri.read)
            end
	end

end