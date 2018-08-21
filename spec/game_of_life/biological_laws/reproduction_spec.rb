# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::BiologicalLaws::Reproduction do
  let(:law) { subject }

  describe '#perform' do
    context 'when it is dead and it has 3 live neighbours' do
      it 'resurrects the cel' do
        cell = hood(:dead, %i[alive alive alive dead])

        action = law.apply(cell)

        expect(action).to be_a(GameOfLife::Actions::Resurrect)
      end
    end

    context 'when it is dead and it has more than 3 live neighbours' do
      it 'does nothing' do
        cell = hood(:dead, %i[alive alive alive dead alive])

        action = law.apply(cell)

        expect(action).to be_a(GameOfLife::Actions::Nothing)
      end
    end
  end
end
