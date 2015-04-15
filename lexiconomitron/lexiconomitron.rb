require "pry"

class Lexiconomitron
	def eat_letters(word)
		word.downcase.gsub('t', "")
	end
	def shazam(*words)
		reversed_word = words[0].reverse
		# binding.pry
		[eat_letters(reversed_word)]
	end
end