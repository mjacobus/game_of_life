# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::Actions::Resurrect do
  describe '#process' do
    it 'changes the status from dead to alive' do
      cell = create_cell(:dead)

      action = described_class.new(cell)
      action.perform

      expect(cell).to be_alive
    end
  end
end
