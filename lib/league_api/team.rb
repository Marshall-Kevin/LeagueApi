module LeagueApi

  class Team

    @base_url = 'https://prod.api.pvp.net/api/lol/na/v2.2/team/'

    def self.make_request(str)
      LeagueApi.make_request(@base_url, str)
    end

    def self.by_summoner(id)
      make_request('by-summoner/'+id.to_s)
    end

    def self.find_teams(str)
      make_request(str.gsub(" ",""))
    end

  end

end