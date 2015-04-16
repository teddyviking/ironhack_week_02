require "pry"

class Cell
	attr_reader :state, :neighbours, :cell_evolver
	def initialize(state, neighbours, cell_evolver)
		@state= state
		@neighbours= neighbours
		@cell_evolver= cell_evolver
	end

	def evolve
		@state = :dead if @neighbours < 2
	end
end


class CellEvolver

end