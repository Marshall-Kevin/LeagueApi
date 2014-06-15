module LeagueApi

  class Champion
    @base_url = "https://prod.api.pvp.net/api/lol/"
    @post_url = "/v1.2/"

    def self.make_request(str, params=nil, region=nil)
      @region = LeagueApi.get_region region
      if @region=="euw"
        LeagueApi.make_request(@base_url.gsub("prod.api.pvp.net","euw.api.pvp.net")+@region+@post_url, str, params)
      else
        LeagueApi.make_request(@base_url+@region+@post_url, str, params)
      end       
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
