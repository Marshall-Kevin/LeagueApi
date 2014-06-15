module LeagueApi

  class Team

    @base_url = 'https://prod.api.pvp.net/api/lol/'
    @post_url = '/v2.2/team/'

    def self.make_request(str, region=nil)
      @region = LeagueApi.get_region region
      base = LeagueApi.change_base(@base_url, @region)

      LeagueApi.make_request(base+@region+@post_url, str)
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