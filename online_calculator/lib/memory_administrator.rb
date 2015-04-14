class MemoryAdministrator
	def initialize
		@file = './lib/memory.txt'

	end

	def retrieve_number
		file = File.read(@file)
		file.to_i
	end

	def store_number(result)
		File.write(@file, result)
	end
end
