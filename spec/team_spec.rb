require 'spec_helper'

describe LeagueApi::Team do

	it "should retrieve a list of teams given a valid summmoner id" do
		LeagueApi::Team.by_summoner(25087996).should_not == nil
	end

	#Needs to be adjusted for real values
	it "should retrieve a list of teams given valid team ids" do
		LeagueApi::Team.find_teams("TEAM-7842f450-173b-11e3-a552-782bcb4d1861, TEAM-23993380-2dff-11e3-a678-782bcb4d1861")
	end

	it "should return an error if a valid list is not provided" do
		expect {LeagueApi::Team.find_teams("TEAM-23993380-2dff-11e3-a678-782bcb4d1861:TEAM-23993380-2dff-11e3-a678-782bcb4d1861")}.to raise_error(OpenURI::HTTPError)
	end
end