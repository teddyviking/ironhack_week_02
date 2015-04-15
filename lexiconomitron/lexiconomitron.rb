require "pry"

class Lexiconomitron
	def eat_letters(word)
		word.downcase.gsub('t', "")
	end
end