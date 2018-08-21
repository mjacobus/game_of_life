# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::BiologicalLaws::StayAlive do
  let(:law) { subject }

  describe '#perform' do
    it 'does nothing actually' do
      cell = create_cell(:alive)
      expect(law.apply(cell)).to be_a(GameOfLife::Actions::Nothing)
    end
  end
end
