require 'spec_helper'

describe LeagueApi::Static do
	
	before(:each) do 
		@static = LeagueApi::Static
	end

	it "should get a recent champion list" do
		@static.get_champion_list.first.should == ["Aatrox", {"id"=>266, "key"=>"Aatrox", "name"=>"Aatrox", "title"=>"the Darkin Blade"}]
	end

	it "should get champion data from name only" do
		@static.get_champion_by_name("Aatrox").should == {"id"=>266, "key"=>"Aatrox", "name"=>"Aatrox", "title"=>"the Darkin Blade"}
	end

	it "should return an error on bad champion name" do
		expect {@static.get_champion_by_name("Aatox")}.to raise_error 
	end

	it "should return data given a proper champion id" do
		@static.get_champion_by_id(266).should == {"id"=>266, "key"=>"Aatrox", "name"=>"Aatrox", "title"=>"the Darkin Blade"}
	end

	it "should get a recent item list" do
		@static.get_item_list.first.should == ["2009", {"id"=>2009, "name"=>"Total Biscuit of Rejuvenation", "description"=>"<consumable>Click to Consume:</consumable> Restores 80 Health and 50 Mana over 10 seconds."}]
	end

	it "should get an item by id" do
		@static.get_item_by_id(2009).should == {"id"=>2009, "name"=>"Total Biscuit of Rejuvenation", "description"=>"<consumable>Click to Consume:</consumable> Restores 80 Health and 50 Mana over 10 seconds."}
	end

	it "should get a list of updated masteries" do
		@static.get_mastery_list.first.should == ["4353", {"id"=>4353, "name"=>"Intelligence", "description"=> ["+2% Cooldown Reduction and reduces the cooldown of Activated Items by 4%",
	"+3.5% Cooldown Reduction and reduces the cooldown of Activated Items by 7%",
	"+5% Cooldown Reduction and reduces the cooldown of Activated Items by 10%"]}]
	end

	it "should get a specific mastery by id" do
		@static.get_mastery_by_id(4353).should == {"id"=>4353, "name"=>"Intelligence", "description"=> ["+2% Cooldown Reduction and reduces the cooldown of Activated Items by 4%",
	"+3.5% Cooldown Reduction and reduces the cooldown of Activated Items by 7%",
	"+5% Cooldown Reduction and reduces the cooldown of Activated Items by 10%"]}
	end

	it "should get current realm information" do
		@static.get_realm["v"].should == "4.6.3"
		@static.get_realm["l"].should == "en_US"
		@static.get_realm["cdn"].should == "http://ddragon.leagueoflegends.com/cdn"
	end

	it "should get current rune list" do
		@static.get_rune_list.first.should == ["5235", {"id"=>5235, "name"=>"Quintessence of Ability Power", "description"=>"+3.85 ability power", "rune"=>{"isRune"=>true, "tier"=>"2", "type"=>"black"}}]
	end

	it "should get runes by id" do
		@static.get_rune_by_id(5235).should == {"id"=>5235, "name"=>"Quintessence of Ability Power", "description"=>"+3.85 ability power", "rune"=>{"isRune"=>true, "tier"=>"2", "type"=>"black"}}
	end

	it "should get current summoner spells" do
		@static.get_summoner_spells.first.should == ["SummonerBoost", {"name"=>"Cleanse", "description"=> "Removes all disables and summoner spell debuffs affecting your champion and lowers the duration of incoming disables by 65% for 3 seconds.", "summonerLevel"=>2, "id"=>1, "key"=>"SummonerBoost"}]
	end

	it "should get summoner spell by id" do
		@static.get_summoner_by_id(1)["name"].should == "Cleanse"
	end

	it "should get the current versions of the game" do
		@static.get_versions.should == ["4.6.3", "4.5.4", "4.4.3", "4.4.2", "4.3.18", "4.3.12", "4.3.10", "4.3.4", "4.3.2", "4.2.6", "4.2.5", "4.2.1", "4.1.43", "4.1.41", "4.1.13", "4.1.9", "4.1.2", "3.15.5", "3.15.4", "3.15.2", "3.14.41", "3.14.23", "3.14.22", "3.14.20", "3.14.19", "3.14.16", "3.14.13", "3.14.12", "3.13.24", "3.13.8", "3.13.6", "3.13.1", "3.12.37", "3.12.36", "3.12.34", "3.12.33", "3.12.26", "3.12.24", "3.12.2", "3.11.4", "3.11.2", "3.10.6", "3.10.3", "3.10.2", "3.9.7", "3.9.5", "3.9.4", "3.8.5", "3.8.3", "3.8.1", "3.7.9", "3.7.2", "3.7.1", "3.6.15", "3.6.14", "0.154.3", "0.154.2", "0.153.2", "0.152.115", "0.152.108", "0.152.107", "0.152.55", "0.151.101", "0.151.2"]
	end
end