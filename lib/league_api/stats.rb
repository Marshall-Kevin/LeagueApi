module LeagueApi

  class Stats

    @base_url = 'https://prod.api.pvp.net/api/lol/na/v1.3/stats/by-summoner/'

    def self.make_request(str, params=nil)
      LeagueApi.make_request(@base_url, str, params)
    end

    def self.ranked(id, season="SEASON4")
      params = {"season" => season}
      make_request(id.to_s+'/ranked', params)
    end

    def self.summary(id, season="SEASON4")
      params = {"season" => season}
      make_request(id.to_s+'/summary', params)
    end

    def self.requests
      %w( ranked(summoner_id) summary(summoner_id) )
    end

  end

end
