require 'pry'

class FizzBuzz
	def get_answer(num)
		if num % 15 == 0
			"fizzbuzz"
		elsif num % 3 == 0
			"fizz"
		elsif num % 5 == 0
			"buzz"
		else
			num
		end
	end
end

Movie.new()