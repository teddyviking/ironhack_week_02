class Calculator
	attr_accessor :num1
	def initialize
		@operations ={
			"addition" => lambda{|num1, num2| num1 + num2},
			"sustraction" => lambda{|num1, num2| num1 - num2},
			"multiplication" => lambda{|num1, num2| num1 * num2},
			"division" => lambda{|num1, num2| num1 / num2}
		}
	end

	def get_params(params)
		@num1 = params["num1"].to_i
		@num2 = params["num2"].to_i
		@operation = params["operation"]
	end

	def make_operation(params, *memory)
		get_params(params)
		@num1 = memory[0] unless memory.empty?
		@operations[@operation].call(@num1, @num2)
	end



end