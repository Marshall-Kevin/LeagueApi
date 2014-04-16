require "league_api/version"
require "league_api/champion"
require "net/http"
require 'json'

module LeagueApi
  class << self
    #TODO: move to all config to yml
    @config = {
        :api => '?api_key=12c41a10-86fc-4d16-934c-277e891e1519'
    }

    def request(type)
      case type
      when :champ_list then get_champion_list
      end
    end

    private
    def get_champion_list
      query = 'v1.2/champion'
      uri = URI('https://prod.api.pvp.net/api/lol/na/'+query+@config[:api])
      JSON.parse(HTTP.get(uri))
    end
  end

=begin
  def self.request(query)
    uri = URI('https://prod.api.pvp.net/api/lol/na/'+query+@config[:api])
    JSON.parse(Net::HTTP.get(uri))
  end

  def self.get_champion_list
    request('v1.2/champion')
  end
=end
end
