class MemoryAdministrator
	attr_accessor :tasks
	def initialize
		@tasks ={
			1 => Task.new("ju","no",1),
			2 => Task.new("ja","no",2),
			3 => Task.new("ji","no",3)
		}	
	end

	def store_task
		@tasks
	end
end