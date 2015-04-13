class Calculator
	def initialize
		@operations ={
			"addition" => lambda{|num1, num2| num1 + num2},
			"sustraction" => lambda{|num1, num2| num1 - num2},
			"multiplication" => lambda{|num1, num2| num1 * num2},
			"division" => lambda{|num1, num2| num1 / num2}
		}
	end

	def select_operation(num1, num2, operation)
		@operations[operation].call(num1, num2)
	end
end