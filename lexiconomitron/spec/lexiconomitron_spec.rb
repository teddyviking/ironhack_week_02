require_relative('../lexiconomitron')

RSpec.describe "Lexiconomitron" do
	it "eats downcase T letters of a word" do
		word = "tomato"
		expect(Lexiconomitron.new.eat_letters(word)).to eq("omao")
	end
	it "eats upcase and downcase T letters of a word" do
		word = "Tomato"
		expect(Lexiconomitron.new.eat_letters(word)).to eq("omao")
	end

end