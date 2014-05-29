module LeagueApi
	
	class Util

    # Takes fellow_player hash from game info and splits into team 1 and team 2 (prepend lookup team1)
    def self.organize_players(players)
      players.sort! { |x,y| x["teamId"] <=> y["teamId"]}
    end

    # Pass in stats from game info and get an readable stat hash to iterate on
    def self.get_game_stats(game)
      s = {}
      #manually add every stat we want
      s["Gold Earned"] = game["goldEarned"]
      s["Minions Killed"] = game["minionsKilled"]

      s["Total Damage"] = game["totalDamageDealt"]
      s["Total Damage Taken"] = game["totalDamageTaken"]

      s["Killing Sprees"] = game["killingSprees"]
      s["Largest Killing Sprees"] = game["largestKillingSpree"]
      s["Neutral Minions Killed"] = game["neutralMinionsKilled"]
      s["Largest Multikill"] = game["largestMultiKill"]
      
      s["Physical Damage Dealt"] = game["physicalDamageDealtPlayer"]
      s["Magic Damage Dealt"] = game["magicDamageDealtPlayer"]
      s["Physical Damage To Champions"] = game["physicalDamageDealtToChampions"]
      s["Magic Damage To Champions"] = game["magicDamageDealtToChampions"]
      s["Total Damage To Champions"] = game["totalDamageDealtToChampions"]
      s["True Damage Dealt"] = game["trueDamageDealtPlayer"]
      s["True Damage To Champions"] = game["trueDamageDealtToChampions"]
      s["True Damage Taken"] = game["trueDamageTaken"]
      s["Physical Damage Taken"] = game["physicalDamageTaken"]
      s["Magic Damage Taken"] = game["magicDamageTaken"]
      s["Total Healing"] = game["totalHeal"]

      s["Turrets Killed"] = game["turretsKilled"]
      s["Minions Killed in Enemy Jungle"] = game["neutralMinionsKilledEnemyJungle"]
      s["Minions Killed in Your Jungle"] = game["neutralMinionsKilledYourJungle"]
      s["Gold Spent"] = game["goldSpent"]

      s["Vision Wards Purchased"] = game["visionWardsBought"]
      s["Wards Placed"] = game["wardPlaced"]
      #TODO: Needs a more accurate descriptions (milli seconds)
      s["Crowd Control Dealt"] = game["totalTimeCrowdControlDealt"]

      s
    end

    def self.requests
      %w( organize_players(player_list) get_game_stats(game_stats_hash) )
    end

  end
end