module LeagueApi

  class League

    @base_url = 'https://prod.api.pvp.net/api/lol/na/v2.3/league/'

    def self.make_request(str, params=nil, region=nil)
      LeagueApi.make_request(@base_url, str, params, region)
    end

    def self.by_summoner(id, region=nil)
      make_request('by-summoner/'+id.to_s, region)
    end

    def self.entry_by_summoner(id, region=nil)
      make_request('by-summoner/'+id.to_s+'/entry', region)
    end

    def self.by_team(id, region=nil)
      make_request('by-team/'+id.to_s, region)
    end

    def self.entry_by_team(id, region=nil)
      make_request('by-team/'+id.to_s+'/entry', region)
    end

    def self.get_challenger(queue="RANKED_SOLO_5x5", region=nil)
      params = {"type" => queue}
      make_request('challenger', params, region)
    end

    def self.requests
      %w( by_summoner(id) entry_by_summoner(id) by_team(team_id) entry_by_team(team_id) get_challenger(queue="RANKED_SOLO_5x5") )
    end

  end

end