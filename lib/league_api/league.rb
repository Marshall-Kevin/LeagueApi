module LeagueApi

  class League

    @base_url = 'https://prod.api.pvp.net/api/lol/'
    @post_url = '/v2.3/league/'

    def self.make_request(str, params=nil, region=nil)
      @region = LeagueApi.get_region region
      if @region=="euw"
        LeagueApi.make_request(@base_url.gsub("prod.api.pvp.net","euw.api.pvp.net")+@region+@post_url, str, params)
      else
        LeagueApi.make_request(@base_url+@region+@post_url, str, params)
      end       
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
      params = {"type" => queue}
      make_request('challenger', params)
    end

    def self.requests
      %w( by_summoner(id) entry_by_summoner(id) by_team(team_id) entry_by_team(team_id) get_challenger(queue="RANKED_SOLO_5x5") )
    end

  end

end