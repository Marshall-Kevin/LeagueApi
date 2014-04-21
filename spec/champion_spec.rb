require 'spec_helper'

describe LeagueApi::Champion do
	
	it 'Should return correct champion list' do
		list = LeagueApi::Champion.get_list

		list.first["id"].should == 266
		list.size.should == 118 #As of Patch 4.5
	end

	it "should find champion by id" do
		LeagueApi::Champion.get_by_id(1).should == {"id"=>1,
													 "active"=>true,
													 "botEnabled"=>true,
													 "freeToPlay"=>false,
													 "botMmEnabled"=>true,
													 "rankedPlayEnabled"=>true}
	end
end