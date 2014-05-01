module LeagueApi

  class League

    @base_url = 'https://prod.api.pvp.net/api/lol/na/v2.3/league/'

    def self.make_request(str, params=nil)
      LeagueApi.make_request(@base_url, str, params)
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
      make_request('challenger', queue)
    end
  
  end

end