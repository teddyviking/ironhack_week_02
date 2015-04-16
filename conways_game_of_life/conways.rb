require "pry"

class Cell
	attr_reader :state, :neighbours, :cell_evolver
	def initialize(state, neighbours, cell_evolver)
		@state= state
		@neighbours= neighbours
		@cell_evolver= cell_evolver
	end

	def evolve
		change_state if cell_evolver.evolve?(@state, @neighbours)
		return self	
	end

	def change_state
		@state == :alive ? @state = :dead : @state = :alive
	end
end


class CellEvolver
	def evolve?(state, neighbours)
		if state == :alive
			neighbours < 2 || neighbours > 3
		elsif state == :dead
			neighbours == 3
		else
			raise "Have you created a real cell?"
		end	
	end
end

class GameOfLife
	attr_reader :grid
	def initialize(grid)
		@grid = grid
	end
	def evolve_grid
		grid.cells[0].evolve
	end

	def deads_and_alives
		[grid.cells[0].state, grid.cells[1].state]
	end
end