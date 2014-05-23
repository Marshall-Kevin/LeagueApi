module LeagueApi
	
	class Util

    # Takes fellow_player hash from game info and splits into team 1 and team 2 (prepend lookup team1)
    def self.sort_fellow_players(hash)
      hash.sort! { |x,y| x["teamId"] <=> y["teamId"]}
    end

    # Pass in stats from game info and get an readable stat hash to iterate on
    def get_important_stats(hash)
      s = {}
      #manually add every stat we want
      s["Gold Earned"] = hash["goldEarned"]
      s["Minions Killed"] = hash["minionsKilled"]

      s["Total Damage"] = hash["totalDamageDealt"]
      s["Total Damage Taken"] = hash["totalDamageTaken"]

      s["Killing Sprees"] = hash["killingSprees"]
      s["Largest Killing Sprees"] = hash["largestKillingSpree"]
      s["Neutral Minions Killed"] = hash["neutralMinionsKilled"]
      s["Largest Multikill"] = hash["largestMultiKill"]
      
      s["Physical Damage Dealt"] = hash["physicalDamageDealtPlayer"]
      s["Magic Damage Dealt"] = hash["magicDamageDealtPlayer"]
      s["Physical Damage To Champions"] = hash["physicalDamageDealtToChampions"]
      s["Magic Damage To Champions"] = hash["magicDamageDealtToChampions"]
      s["Total Damage To Champions"] = hash["totalDamageDealtToChampions"]
      s["True Damage Dealt"] = hash["trueDamageDealtPlayer"]
      s["True Damage To Champions"] = hash["trueDamageDealtToChampions"]
      s["True Damage Taken"] = hash["trueDamageTaken"]
      s["Physical Damage Taken"] = hash["physicalDamageTaken"]
      s["Magic Damage Taken"] = hash["magicDamageTaken"]
      s["Total Healing"] = hash["totalHeal"]

      s["Turrets Killed"] = hash["turretsKilled"]
      s["Minions Killed in Enemy Jungle"] = hash["neutralMinionsKilledEnemyJungle"]
      s["Minions Killed in Your Jungle"] = hash["neutralMinionsKilledYourJungle"]
      s["Gold Spent"] = hash["goldSpent"]

      s["Vision Wards Purchased"] = hash["visionWardsBought"]
      s["Wards Placed"] = hash["wardPlaced"]
      #TODO: Needs a more accurate descriptions (milli seconds)
      s["Crowd Control Dealt"] = hash["totalTimeCrowdControlDealt"]

      s
    end


  end
end