require "pry"

class Lexiconomitron
	def eat_letters(word)
		word.downcase.gsub('t', "")
	end
	def shazam(*words)
		reversed_words = words.map{|word| eat_letters(word.reverse)}
		reversed_words.select{|word| word == reversed_words.first || word == reversed_words.last}
	end
end