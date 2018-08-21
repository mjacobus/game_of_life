# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::Cell do
  describe '#alive?' do
    it 'defaults to true' do
      expect(GameOfLife::Cell.new.alive?).to be true
    end

    it 'can be set to false' do
      cell = create_cell(:dead)

      expect(cell).not_to be_alive
    end
  end

  describe '#kill' do
    it 'changes the status to not alive' do
      cell = create_cell(:alive)

      cell.kill

      expect(cell).not_to be_alive
    end
  end

  describe '#resurrect' do
    it 'changes the status from dead to alive' do
      cell = create_cell(:dead)

      cell.resurrect

      expect(cell).to be_alive
    end
  end

  describe '#neighbors' do
    it 'is initialy empty' do
      cell = create_cell(:alive)

      expect(cell.neighbors).to eq([])
    end
  end

  describe '#be_neighbors_with' do
    it 'creates a neibourhood relatinship with another cell' do
      cell = create_cell(:dead)
      other_cell = create_cell(:alive)

      cell.be_neighbors_with(other_cell)

      expect(cell.neighbors).to eq([other_cell])
    end
  end
end
