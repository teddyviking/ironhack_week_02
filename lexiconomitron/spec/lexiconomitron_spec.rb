require_relative('../lexiconomitron')

RSpec.describe "Lexiconomitron" do
	let(:word){"tomato"}
	let(:word2){"Totoro"}
	let(:word3){"boring"}
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
	it "reverse two words and eats T letters when called shazam method" do
		expect(lexiconomitron.shazam(word,word2)).to eq(["oamo","oroo"])
	end
	it "reverse three words, returns only the first and the last word of the array 
	and eats T letters when called shazam method" do
		expect(lexiconomitron.shazam(word,word2,word3)).to eq(["oamo","gnirob"])
	end
end