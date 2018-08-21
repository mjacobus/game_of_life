# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::Universe do
  let(:klass) { described_class }
  let(:cells) { [dead, alive] }
  let(:dead) { create_cell(:dead) }
  let(:alive) { create_cell(:alive) }
  let(:universe) { klass.new(cells: cells) }

  it 'is an ennumerable of cells' do
    result = universe.map do |item|
      item
    end

    expect(result).to eq(cells)
  end
end
