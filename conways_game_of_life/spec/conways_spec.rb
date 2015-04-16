require_relative('../conways')

RSpec.describe "Cell Evolver" do
	it "kills a cell that is alone" do
		alive_cell = Cell.new(:alive, 0, CellEvolver.new)
		cell.evolve
		expect(cell.state).to eq(:dead)
	end
end