require 'spec_helper'

describe LeagueApi::Summoner do

	before(:each) do 
		@summoner = LeagueApi::Summoner
	end

	it "should find summoner by name" do
		@summoner.find_by_name('iSixPool')["id"].should == 25087996
		@summoner.find_by_name('hellaninja')["name"].should == "Hellaninja"
	end

	it "should find summoners given a comma seperated list of ids" do
		@summoner.find_summoners("25087996, 28374180").size.should == 2
	end

	it "should find masteries given a summoner list" do
		@summoner.get_masteries("25087996, 28374180").fetch("25087996")["pages"].first["name"].should == "RANGED ADC"
	end

	it "should find the summoner names given list of ids" do
		@summoner.get_names("25087996, 28374180").fetch("25087996").should == "I Six Pool"
	end

	it "should find runes given list of ids" do
		@summoner.get_runes("25087996, 28374180").fetch("25087996")["pages"].first["name"].should == "3s JUNGLE"
	end
end