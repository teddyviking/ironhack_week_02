require "pry"

class Cell
	attr_reader :state, :neighbours, :cell_evolver
	def initialize(state, neighbours, cell_evolver)
		@state= state
		@neighbours= neighbours
		@cell_evolver= cell_evolver
	end

	def evolve
		if @state == :alive
			@state = :dead if @neighbours < 2 || @neighbours > 3
		else
			@state = :alive
		end		
	end
end


class CellEvolver

end