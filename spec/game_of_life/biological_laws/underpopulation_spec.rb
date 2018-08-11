require 'spec_helper'

RSpec.describe GameOfLife::BiologicalLaws::Underpopulation do
  let(:law) { subject }

  describe '#perform' do
    context 'when the cell is alive and has less then 2 live neigbours' do
      it 'returns a kill action' do
        cell = hood(:alive, [:dead, :alive])

        action = law.apply(cell)

        expect(action).to be_a(GameOfLife::Actions::Kill)
      end
    end

    describe 'when cell has 2 live neibors' do
      it 'returns nothing action' do
        cell = hood(:alive, [:dead, :alive, :alive])

        action = law.apply(cell)

        expect(action).to be_a(GameOfLife::Actions::Nothing)
      end
    end
  end
end
