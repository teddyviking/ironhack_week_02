require_relative('../fizzbuzz')

RSpec.describe "Fizz Buzz" do
	before :each do
		@fizzbuzz = FizzBuzz.new
	end
	it "Returns 1 when 1 called" do
		expect(@fizzbuzz.get_answer(1)).to eq(1)
	end
	it "Returns 2 when 2 called" do
		expect(@fizzbuzz.get_answer(2)).to eq(2)
	end
	it "Returns fizz when 3 is called" do
		expect(@fizzbuzz.get_answer(3)).to eq("fizz")
	end
	it "Returns buzz when 5 is called" do
		expect(@fizzbuzz.get_answer(5)).to eq("buzz")
	end
	it "Returns fizz when 6 is called" do
		expect(@fizzbuzz.get_answer(6)).to eq("fizz")
	end
	it "Returns fizz when 10 is called" do
		expect(@fizzbuzz.get_answer(10)).to eq("buzz")
	end
	it "Returns fizzbuzz when 15 is called" do
		expect(@fizzbuzz.get_answer(15)).to eq("fizzbuzz")
	end
	it "Returns fizzbuzz when 30 is called" do
		expect(@fizzbuzz.get_answer(30)).to eq("fizzbuzz")
	end
end