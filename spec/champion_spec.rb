require 'spec_helper'

describe LeagueApi::Champion do
	
	it 'should return correct champion list' do
		list = LeagueApi::Champion.get_list

		list.first["id"].should == 266
		list.size.should == 119 #As of Patch 4.7
	end

	it "should find champion by id" do
		LeagueApi::Champion.get_by_id(1).should == 
		{	"id"=>1,
			"active"=>true,
			"botEnabled"=>true,
			"freeToPlay"=>false,
			"botMmEnabled"=>true,
			"rankedPlayEnabled"=>true }
	end

	it "should only find free to play champions" do
		LeagueApi::Champion.get_free_champs.size.should == 10 #Better than having to update or pull a list
	end
end
