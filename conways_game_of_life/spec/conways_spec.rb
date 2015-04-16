require_relative('../conways')

RSpec.describe "Cell Evolver" do
	let (:cell_evolver) {CellEvolver.new}
	it "kills a cell that is alone" do
		alive_cell = Cell.new(:alive, 0, cell_evolver)
		alive_cell.evolve
		expect(alive_cell.state).to eq(:dead)
	end
	it "keeps a cell alive that has two neighbours" do
		alive_cell = Cell.new(:alive, 2, cell_evolver)
		alive_cell.evolve
		expect(alive_cell.state).to eq(:alive)
	end
	it "kills a cell that has four neighbours" do
		alive_cell = Cell.new(:alive, 4, cell_evolver)
		alive_cell.evolve
		expect(alive_cell.state).to eq(:dead)
	end
	it "resurrects a dead cell that has 3 neighbours" do
		dead_cell = Cell.new(:dead, 3, cell_evolver)
		dead_cell.evolve
		expect(dead_cell.state).to eq(:alive)
	end
	it "does not resurrect a cell with 2 neighbours" do
		dead_cell = Cell.new(:dead, 2, cell_evolver)
		dead_cell.evolve
		expect(dead_cell.state).to eq(:dead)
	end
end

RSpec.describe "Game of life" do
	let (:cell_evolver) {CellEvolver.new}
	let (:cell){Cell.new(:alive, 0, cell_evolver)}
	let (:grid_1) do 
		instance_double("Grid",
			:cells => [cell])
	end
	let (:grid_2) do 
		instance_double("Grid",
			:cells => [cell, cell])
	end
	let (:game_of_life) {GameOfLife.new}
	it "uptades a grid with one cell" do
		game_of_life.evolve_grid(grid_1)
		expect(grid_1.cells[0].state).to eq(:dead)
	end
	it "updates a grid with two cells" do
		game_of_life.evolve_grid(grid_2)
		expect(grid_2.cells.deads_and_alives).to eq([:dead, :dead])
	end
end