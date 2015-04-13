class MemoryAdministrator
	def retrieve_number(file)
		File.read(file)
	end

	def store_number(file, result)
		File.write(file, result)
	end
end
