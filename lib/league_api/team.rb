module LeagueApi

  class Team

    @base_url = 'https://prod.api.pvp.net/api/lol/'
    @post_url = '/v2.2/team/'

    def self.make_request(str, region=nil)
      @region = LeagueApi.get_region region
      if @region=="euw"
        LeagueApi.make_request(@base_url.gsub("prod.api.pvp.net","euw.api.pvp.net")+@region+@post_url, str)
      else
        LeagueApi.make_request(@base_url+@region+@post_url, str)
      end       
    end

    def self.by_summoner(id)
      make_request('by-summoner/'+id.to_s)
    end

    def self.find_teams(str)
      make_request(str.gsub(" ",""))
    end

    def self.requests
      %w( by_summoner(summoner_id) find_teams(team_ids) )
    end

  end

end