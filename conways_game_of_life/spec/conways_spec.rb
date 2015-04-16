require_relative('../conways')

# RSpec.describe "Cell Evolver" do
# 	let (:cell_evolver) {CellEvolver.new}
# 	it "kills a cell that is alone" do
# 		alive_cell = Cell.new(:alive, 0, cell_evolver)
# 		alive_cell.evolve
# 		expect(alive_cell.state).to eq(:dead)
# 	end
# 	it "keeps a cell alive that has two neighbours" do
# 		alive_cell = Cell.new(:alive, 2, cell_evolver)
# 		alive_cell.evolve
# 		expect(alive_cell.state).to eq(:alive)
# 	end
# 	it "kills a cell that has four neighbours" do
# 		alive_cell = Cell.new(:alive, 4, cell_evolver)
# 		alive_cell.evolve
# 		expect(alive_cell.state).to eq(:dead)
# 	end
# 	it "resurrects a dead cell that has 3 neighbours" do
# 		dead_cell = Cell.new(:dead, 3, cell_evolver)
# 		dead_cell.evolve
# 		expect(dead_cell.state).to eq(:alive)
# 	end
# 	it "does not resurrect a cell with 2 neighbours" do
# 		dead_cell = Cell.new(:dead, 2, cell_evolver)
# 		dead_cell.evolve
# 		expect(dead_cell.state).to eq(:dead)
# 	end
# end

RSpec.describe "Game of life" do
	let (:cell_evolver) {CellEvolver.new}
	let (:alive_cell){Cell.new(:alive, cell_evolver)}
	let (:dead_cell){Cell.new(:dead, cell_evolver)}
	let (:grid_1) do 
		instance_double("Grid",
			:cells => {a1: alive_cell})
	end
	let (:grid_2) do 
		instance_double("Grid",
			:cells => {a1: alive_cell, a2: alive_cell})
	end	
	let (:grid_2_2) do
		instance_double("Grid",
			:cells =>  {a1: alive_cell, a2: alive_cell, b1: alive_cell, b2: dead_cell})		
	end
	let (:grid_3_3) do
		instance_double("Grid",
			:cells =>  {a1: Cell.new(:dead, cell_evolver), a2: Cell.new(:alive, cell_evolver), a3: Cell.new(:alive, cell_evolver), 
						b1: Cell.new(:alive, cell_evolver), b2: Cell.new(:alive, cell_evolver), b3: Cell.new(:dead, cell_evolver),
						c1: Cell.new(:dead, cell_evolver), c2: Cell.new(:dead, cell_evolver), c3: Cell.new(:alive, cell_evolver)})		
	end
	it "uptades a grid with one cell" do
		game = GameOfLife.new(grid_1)
		game.evolve_grid
		expect(game.deads_and_alives).to eq({a1: :dead})
	end
	it "updates a grid with two cells" do
		game = GameOfLife.new(grid_2)
		game.evolve_grid
		expect(game.deads_and_alives).to eq({a1: :dead, a2: :dead})
	end

	it "updates a 2x2 grid with three alive cells" do
		game = GameOfLife.new(grid_2_2)
		game.evolve_grid
		expect(game.deads_and_alives).to eq({a1: :alive, a2: :alive, b1: :alive, b2: :alive})
	end
	it "updates a 3x3 grid with three alive cells" do
		game = GameOfLife.new(grid_3_3)
		game.evolve_grid
		expect(game.deads_and_alives).to eq({a1: :alive, a2: :alive, a3: :alive,
											b1: :alive, b2: :dead, b3: :dead,
											c1: :dead, c2: :alive, c3: :dead})
	end
end








