require "bundler/setup"
require "game_of_life"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def create_cell(status)
  life_status = status == :alive ? GameOfLife::Alive.new : GameOfLife::Dead.new
  GameOfLife::Cell.new(status: life_status)
end

def hood(cell_status, other_cells)
  cell = create_cell(cell_status)

  neighbors = other_cells.map do |status|
    create_cell(status)
  end

  neighbors.each do |other_cell|
    cell.be_neighbors_with(other_cell)
  end

  cell
end
