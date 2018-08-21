# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::Universes::Board do
  subject(:board) do
    described_class.new(cells: cells)
  end

  let(:c11) { create_cell(:alive) }
  let(:c12) { create_cell(:alive) }
  let(:c13) { create_cell(:alive) }
  let(:c21) { create_cell(:alive) }
  let(:c22) { create_cell(:alive) }
  let(:c23) { create_cell(:alive) }
  let(:c31) { create_cell(:alive) }
  let(:c32) { create_cell(:alive) }
  let(:c33) { create_cell(:alive) }

  let(:cells) do
    [
      [c11, c12, c13],
      [c21, c22, c23],
      [c31, c32, c33],
    ]
  end

  it 'is an Universe' do
    expect(board).to be_a(GameOfLife::Universe)
  end

  it 'arranges neighboardhood correctly' do
    board

    assert_neighbours(c11, [c12, c21, c22])
    assert_neighbours(c12, [c11, c13, c21, c22, c23])
    assert_neighbours(c13, [c12, c22, c23])

    assert_neighbours(c21, [c11, c12, c22, c31, c32])
    assert_neighbours(c22, [c11, c12, c13, c21, c23, c31, c32, c33])
    assert_neighbours(c23, [c12, c13, c22, c32, c33])

    assert_neighbours(c31, [c21, c22, c32])
    assert_neighbours(c32, [c21, c22, c23, c31, c33])
    assert_neighbours(c33, [c22, c23, c32])
  end

  def assert_neighbours(cell, expected_neighbours)
    neighbours = cell.neighbors
    expect(neighbours.length).to eq(expected_neighbours.length)

    expected_neighbours.each do |expected|
      expect(neighbours).to include(expected)
    end
  end
end
