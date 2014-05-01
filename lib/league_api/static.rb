module LeagueApi

  class Static
    @base_url = 'https://prod.api.pvp.net/api/lol/static-data/na/v1.2/'

    def self.make_request(str)
      LeagueApi.make_request(@base_url, str)
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

  end
end
