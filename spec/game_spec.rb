require 'spec_helper'

describe LeagueApi::Game do
	
	it "should find recent games given a valid id" do
		LeagueApi::Game.recent_games(40314769)
	end
end