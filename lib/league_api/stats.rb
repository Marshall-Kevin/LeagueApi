module LeagueApi

  class Stats

    @base_url = "https://prod.api.pvp.net/api/lol/"
    @post_url = "/v1.3/stats/by-summoner/"

    def self.make_request(str, params=nil, region=nil)
      @region = LeagueApi.get_region region
      if @region=="euw"
        LeagueApi.make_request(@base_url.gsub("prod.api.pvp.net","euw.api.pvp.net")+@region+@post_url, str)
      else
        LeagueApi.make_request(@base_url+@region+@post_url, str)
      end       
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
