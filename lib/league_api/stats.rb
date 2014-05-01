module LeagueApi
  
  class Stats
    
    @base_url = 'https://prod.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/'

    def self.make_request(str)
      LeagueApi.make_request(@base_url, str)
    end

    def self.ranked(id)
      make_request(id.to_s+'/ranked')
    end

    def self.summary(id)
      make_request(id.to_s+'/summary')
    end

  end

end