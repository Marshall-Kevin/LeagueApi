module LeagueApi

  class Static
    @base_url = "https://prod.api.pvp.net/api/lol/static-data/"
    @post_url = "/v1.2/"

    def self.make_request(str, region=nil)
      @region = LeagueApi.get_region region
      base = LeagueApi.change_base(@base_url, @region)

      LeagueApi.make_request(base+@region+@post_url, str)
    end

    # Return a hash of all champions. [name, {data, ..}]
    def self.get_champion_list
      make_request('champion')["data"]
    end

    def self.get_champion_by_name(name)
      make_request('champion')["data"].fetch(name)
    end

    def self.get_champion_by_id(id)
      make_request('champion/'+id.to_s)
    end

    def self.get_item_list
      make_request('item')["data"]
    end

    def self.get_item_by_id(id)
      make_request('item/'+id.to_s)
    end

    def self.get_mastery_list
      make_request('mastery')["data"]
    end

    def self.get_mastery_by_id(id)
      make_request('mastery/'+id.to_s)
    end

    def self.get_realm
      make_request('realm')
    end

    def self.get_rune_list
      make_request('rune')["data"]
    end

    def self.get_rune_by_id(id)
      make_request('rune/'+id.to_s)
    end

    def self.get_summoner_spells
      make_request('summoner-spell')["data"]
    end

    def self.get_summoner_by_id(id)
      make_request('summoner-spell/'+id.to_s)
    end

    def self.get_versions
      make_request('versions')
    end

    def self.get_inverted_champion_list
      hash = get_champion_list
      r = {}

      hash.each do |e|
        r[ e[1]["id"] ] = e[0]
      end

      r
    end

    #Image CDN supported by ddragon (Runes + Masteries are done on single sprite sheet)
    #TODO: Implement http://ddragon.leagueoflegends.com/cdn/4.7.8/img/sprite/rune0.png

    def self.get_item_image(id)
      "http://ddragon.leagueoflegends.com/cdn/"+$version+"/img/item/"+id.to_s+".png"
    end

    def self.get_champion_image(str)
      "http://ddragon.leagueoflegends.com/cdn/"+$version+"/img/champion/"+str+".png"
    end

    def self.get_summoner_image(id)
      "http://ddragon.leagueoflegends.com/cdn/"+$version+"/img/sprite/spell"+id.to_s+".png"
    end

    def self.requests
      %w( get_champion_list get_inverted_champion_list get_champion_by_name(champ_id) get_item_list get_item_by_id get_mastery_list get_mastery_by_id get_realm get_rune_list rune_by_id(id) get_summoner_spells get_summoner_by_id(id) get_versions get_item_image get_champion_image get_summoner_image)
    end


  end
end
