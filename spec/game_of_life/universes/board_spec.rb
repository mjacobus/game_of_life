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

    assert_neighbors(c11, [c12, c21, c22])
    assert_neighbors(c12, [c11, c13, c21, c22, c23])
    assert_neighbors(c13, [c12, c22, c23])

    assert_neighbors(c21, [c11, c12, c22, c31, c32])
    assert_neighbors(c22, [c11, c12, c13, c21, c23, c31, c32, c33])
    assert_neighbors(c23, [c12, c13, c22, c32, c33])

    assert_neighbors(c31, [c21, c22, c32])
    assert_neighbors(c32, [c21, c22, c23, c31, c33])
    assert_neighbors(c33, [c22, c23, c32])
  end

  def assert_neighbors(cell, expected_neighbors)
    neighbors = cell.neighbors
    expect(neighbors.length).to eq(expected_neighbors.length)

    expected_neighbors.each do |expected|
      expect(neighbors).to include(expected)
    end
  end
end
