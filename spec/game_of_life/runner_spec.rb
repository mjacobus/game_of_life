# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::Runner do
  subject(:game) do
    described_class.new(
      universe: universe,
      laws: laws
    )
  end
  let(:cell) { create_cell(:alive) }
  let(:law) { instance_double(GameOfLife::BiologicalLaws::Underpopulation) }
  let(:laws) { [law] }
  let(:universe) { GameOfLife::Universe.new(cells: [cell]) }

  before do
    allow(law).to receive(:apply)
      .with(cell)
      .and_return(GameOfLife::Actions::Kill.new(cell))
  end

  describe '#run_once' do
    it 'applies all the rules to the universe' do
      game.run_once

      expect(cell).not_to be_alive
    end
  end

  describe '#run' do
    it 'applies all the rules to the universe' do
      count = 0
      game.run do |universe|
        count += 1
        expect(universe.cells).to eq([cell])

        if count == 2
          break
        end
      end

      expect(cell).not_to be_alive
    end
  end
end
