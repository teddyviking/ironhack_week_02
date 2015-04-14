class MyLogger
	def initialize
		@users = [["pepe","pepito"],["paco","paquito"]]
	end
	def check_log_in(log_in)
		@users.include?(log_in)
	end
end