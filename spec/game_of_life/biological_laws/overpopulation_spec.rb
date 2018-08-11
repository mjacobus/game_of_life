require 'spec_helper'

RSpec.describe GameOfLife::BiologicalLaws::Overpopulation do
  let(:law) { subject }

  describe '#perform' do
    context 'when it has more than 3 live neighbors' do
      it 'returns a kill action' do
        cell = hood(:alive, [:alive, :alive, :alive, :alive, :dead])

        action = law.apply(cell)

        expect(action).to be_a(GameOfLife::Actions::Kill)
      end
    end

    context 'when it has 3 or less live neighbors' do
      it 'does nothing' do
        cell = hood(:alive, [:alive, :alive, :alive, :dead])

        action = law.apply(cell)

        expect(action).to be_a(GameOfLife::Actions::Nothing)
      end
    end
  end
end

