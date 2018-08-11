require 'spec_helper'

RSpec.describe GameOfLife::Cell do
  describe '#alive?' do
    it 'defaults to true' do
      expect(GameOfLife::Cell.new.alive?).to be true
    end

    it 'can be set to false' do
      cell = described_class.new(status: :dead)

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
end
