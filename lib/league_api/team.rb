module LeagueApi

  class Team

    @base_url = 'https://prod.api.pvp.net/api/lol/na/v2.2/team/'

    def self.make_request(str, region=nil)
      LeagueApi.make_request(@base_url, str, nil, region)
    end

    def self.by_summoner(id, region=nil)
      make_request('by-summoner/'+id.to_s, region)
    end

    def self.find_teams(str, region=nil)
      make_request(str.gsub(" ",""), region)
    end

    def self.requests
      %w( by_summoner(summoner_id) find_teams(team_ids) )
    end

  end

end