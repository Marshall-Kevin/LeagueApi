module LeagueApi

  class Champion
    @base_url = "https://prod.api.pvp.net/api/lol/na/v1.2/"

    def self.make_request(modifier)
      LeagueApi.make_request(@base_url, modifier)
    end

    def self.get_list
      make_request('champion')["champions"]
 	  end

    def self.get_by_id(id)
      make_request('champion/'+id.to_s)
    end
  
  end

end
