module LeagueApi

	class Static
		@base_url

	     def self.build_base_url(modifier)
      		options = LeagueApi.options
      		@base_url = options[:base_url]+'/static-data/'+options[:region]+'/'+'v1.2/'+modifier+'?api_key='+options[:key]
      		@base_url
      	end
      	
      	def self.make_request(str)
      		build_base_url(str)
      		uri = URI.parse(@base_url)
			JSON.parse(uri.read)
      	end

            # Return a hash of all champions. [name, {data, ..}]
      	def self.get_champion_list
      		make_request('champion')["data"]
      	end

            def self.get_champion_by_name(name)
                  make_request('champion')["data"].fetch(name)
            end

      	def self.get_champion_by_id(id)
      		make_request('champion/'+id.to_s)
      	end

      	def self.get_item_list
      		make_request('item')["data"]
      	end

      	def self.get_item_by_id(id)
      		make_request('item/'+id.to_s)
      	end

      	def self.get_mastery_list
      		make_request('mastery')["data"]
      	end

      	def self.get_mastery_by_id(id)
      		make_request('mastery/'+id.to_s)
      	end

      	def self.get_realm
      		make_request('realm')
      	end

      	def self.get_rune_list
      		make_request('rune')["data"]
      	end

      	def self.get_rune_by_id(id)
      		make_request('rune/'+id.to_s)
      	end

      	def self.get_summoner_spells
      		make_request('summoner-spell')["data"]
      	end

      	def self.get_summoner_by_id(id)
      		make_request('summoner-spell/'+id.to_s)
      	end

      	def self.get_versions
      		make_request('versions')
      	end

    end


end