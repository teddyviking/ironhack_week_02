require_relative('../lexiconomitron')

RSpec.describe "Lexiconomitron" do
	let(:word){"tomato"}
	let(:lexiconomitron){Lexiconomitron.new}
	it "eats downcase T letters of a word" do
		expect(lexiconomitron.eat_letters(word)).to eq("omao")
	end
	it "eats upcase and downcase T letters of a word" do
		expect(lexiconomitron.eat_letters(word)).to eq("omao")
	end
	it "reverse a word and eats T letters when called shazam method" do
		expect(lexiconomitron.shazam(word)).to eq(["oamo"])
	end

end