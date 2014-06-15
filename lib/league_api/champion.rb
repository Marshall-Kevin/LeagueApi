module LeagueApi

  class Champion
    @base_url = "https://prod.api.pvp.net/api/lol/"
    @post_url = "/v1.2/"

    def self.make_request(str, params=nil, region=nil)
      @region = LeagueApi.get_region region
      base = LeagueApi.change_base(@base_url, @region)

      LeagueApi.make_request(base+@region+@post_url, str,params)
    end

    def self.get_free_champs
      params = {"freeToPlay" => "true"}
      make_request('champion', params)["champions"]
    end

    def self.get_list
      make_request('champion')["champions"]
 	  end

    def self.get_by_id(id)
      make_request('champion/'+id.to_s)
    end

    def self.requests
      %w( get_list get_free_champs get_by_id(champion_id) )
    end

  end

end
