require_relative('../conways')

RSpec.describe "Cell Evolver" do
	it "kills a cell that is alone" do
		alive_cell = Cell.new(:alive, 0, CellEvolver.new)
		alive_cell.evolve
		expect(alive_cell.state).to eq(:dead)
	end
	it "keeps a cell alive that has two neighbours" do
		alive_cell = Cell.new(:alive, 2, CellEvolver.new)
		alive_cell.evolve
		expect(alive_cell.state).to eq(:alive)
	end
end