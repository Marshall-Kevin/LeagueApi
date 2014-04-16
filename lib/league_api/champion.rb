module LeagueApi
  module Champion
    extend self

    def get_list
      request('v1.2/champion')
    end

  end
end
