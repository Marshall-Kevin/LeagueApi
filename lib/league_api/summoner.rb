module LeagueApi

  class Summoner
  
    @base_url

    def self.build_base_url(modifier)
      options = LeagueApi.options
      @base_url = options[:base_url]+'/'+options[:region]+'/'+'v1.4/summoner/'+modifier+'?api_key='+options[:key]
      @base_url
    end

    def self.make_request(str)
      build_base_url(str)
      uri = URI.parse(@base_url)
      JSON.parse(uri.read)
    end

    def self.find_by_name(name)
      make_request('by-name/'+name)[name.downcase]
    end

    # Get Summoner Objects mapped by summoner ID for a given a comma seperated list of summoner IDs
    def self.find_summoners(str)
      make_request(str.gsub(" ", ""))
    end

    def self.get_masteries(summoners)
      make_request(summoners.gsub(" ", "")+'/masteries')
    end

    def self.get_names(summoners)
      make_request(summoners.gsub(" ", "")+'/name')
    end

    def self.get_runes(summoners)
      make_request(summoners.gsub(" ", "")+'/runes')
    end

  end

end