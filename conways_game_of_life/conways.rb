require "pry"
# require_relative('./grid.rb')

class Cell
	attr_reader :state, :neighbours, :cell_evolver
	def initialize(state, cell_evolver)
		@state = state
		@cell_evolver = cell_evolver
	end

	def evolve(neighbours)
		
		change_state if cell_evolver.evolve?(@state, neighbours)
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
		new_grid = {}
		@grid.cells.each do |key, cell| 
			new_grid[key] = Cell.new(cell.state, CellEvolver.new).evolve(count_living_neighbours(cell))
		end
		@grid.cells.merge!(new_grid){|key, oldval, newval| newval}
	end

	def count_living_neighbours(cell)
		reference_key = @grid.cells.key(cell).to_s
		
		values = []
		[reference_key[0], reference_key[1]].each do |key|
			values << [key, (key.ord + 1).chr, (key.ord - 1).chr]
		end

		possible_neighbours = []
		values.each do |array_of_values|
			array_of_values.each do |value|
				values[1].each do |second_value|
					possible_neighbours << value + second_value
				end
			end
		end

		possible_neighbours -= [@grid.cells.key(cell).to_s]


		living_neighbours = possible_neighbours.map do |neighbour|
			keys = @grid.cells.select{|key, value| value.state == :alive}
			keys.has_key?(neighbour.to_sym)
		end
		# binding.pry
		living_neighbours.keep_if{|neighbour| neighbour == true}.size
	end

	def deads_and_alives
		result = {}
		@grid.cells.each do |key, cell|
			result[key] = cell.state
		end
		result
	end
end



