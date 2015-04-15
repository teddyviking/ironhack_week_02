require_relative ('../popularity_rank.rb')

RSpec.describe "Popularity ranking" do
	before :each do
		@sol = PointOfInterest.new("sol",34,45)
		@prado = PointOfInterest.new("prado",23,54)
		@madrid = City.new(@prado,@sol)
	end

	it "Show a list of a city´s point of interest" do
		expect(@madrid.show_points_of_interest).to eq(["prado", "sol"])
	end

	it "show the number of comments for a specific point of interest, e.g. sol" do
		expect(@madrid.points_of_interest[:sol].number_of_comments).to eq(45)
	end

	it "Rank the points of interest of a city by the number of visits, beginning with the highest first" do
		expect(@madrid.rank_by_visits).to eq(["sol", "prado"])
	end

end