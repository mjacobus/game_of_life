require 'spec_helper'

RSpec.describe GameOfLife::Actions::Kill do
  describe '#perform' do
    it 'changes the cell status from alive to dead' do
      cell = create_cell(:alive)

      action = described_class.new(cell)
      action.perform

      expect(cell).not_to be_alive
    end
  end
end
