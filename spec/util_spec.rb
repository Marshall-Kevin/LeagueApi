require 'spec_helper'

describe LeagueApi::Util do
  before(:each) do
    @util = LeagueApi::Util
  end


  it "should sort players onto teams" do
    sorted_list = @util.organize_players(LeagueApi.get_last_game_played("25087996")["fellowPlayers"])
    sorted_list.is_a?(Array).should == true
    sorted_list.first["teamId"].should == 100
    sorted_list.last["teamId"].should == 200
  end

  it "should get important game stats from the game stats" do
    sorted_stats = @util.get_game_stats(LeagueApi.get_last_game_played("25087996")["stats"])
    sorted_stats.keys.include?("Gold Earned").should == true
  end

end
