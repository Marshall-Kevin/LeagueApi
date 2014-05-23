module LeagueApi
	
	class Util

    # Takes fellow_player hash from game info and splits into team 1 and team 2 (prepend lookup team1)
    def self.sort_fellow_players(hash)
      hash.sort! { |x,y| x["teamId"] <=> y["teamId"]}
    end

  end
end