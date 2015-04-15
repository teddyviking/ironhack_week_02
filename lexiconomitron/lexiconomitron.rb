require "pry"

class Lexiconomitron
	def eat_letters(word)
		word.gsub(/[tT]/, "")
	end
	def shazam(*words)
		reversed_words = words.map{|word| eat_letters(word.reverse)}
		reversed_words.select{|word| word == reversed_words.first || word == reversed_words.last}
	end
	def oompa_loompa(*words)
		selected_words = words.select{|word| word.size <= 3}
		selected_words.map{|word| eat_letters(word)}
	end
end