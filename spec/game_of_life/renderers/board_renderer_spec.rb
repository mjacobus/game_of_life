# frozen_string_literal: true

require 'spec_helper'

RSpec.describe GameOfLife::Renderers::BoardRenderer do
  subject(:renderer) do
    described_class.new(
      canvas: canvas,
      alive_char: alive_char,
      dead_char: dead_char
    )
  end
  let(:canvas) { instance_double(Canvas::TerminalCanvas) }
  let(:board) { GameOfLife::Universes::Board.new(cells: cells) }
  let(:cells) do
    [
      [create_cell(:alive), create_cell(:dead)],
      [create_cell(:dead), create_cell(:alive)]
    ]
  end
  let(:alive_char) { '#' }
  let(:dead_char) { '.' }

  before do
    allow(canvas).to receive(:draw)
  end

  it 'renders board properly' do
    renderer.render(board)

    expect(canvas).to have_received(:draw).with(
      [
        [alive_char, dead_char],
        [dead_char, alive_char],
      ]
    )
  end
end
