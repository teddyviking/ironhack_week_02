require_relative('../cast_list.rb')

RSpec.describe "Cast List Creator" do
	before :each do
		@my_movie = Movie.new("Interstellar")
	end

	it "Return the title of the movie" do
		expect(ListCreator.new.get_movie_title(@my_movie)).to eq("Interstellar")
	end

	it "Return the cast list with one member" do
		@my_movie.cast[:director] = "Christopher Nolan"
		expect(ListCreator.new.get_movie_cast(@my_movie)).to include "Director: Christopher Nolan"
	end

	it "Return the cast list with multiple members" do
		@my_movie.cast[:director] = "Christopher Nolan"
		@my_movie.cast[:writer] = "Jonathan Nolan"
		expect(ListCreator.new.get_movie_cast(@my_movie)).to include "Director: Christopher Nolan\nWriter: Jonathan Nolan\n"
	end
end