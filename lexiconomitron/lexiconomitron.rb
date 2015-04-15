require "pry"

class Lexiconomitron
	def eat_letters(word)
		word.downcase.gsub('t', "")
	end
	def shazam(*words)
		words.map{|word| eat_letters(word.reverse)}
	end
end