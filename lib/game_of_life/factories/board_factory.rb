# frozen_string_literal: true

module GameOfLife
  module Factories
    class BoardFactory
      def create(width:, height:)
        board = create_board(width, height)

        Runner.new(
          universe: board,
          laws: [
            BiologicalLaws::Overpopulation.new,
            BiologicalLaws::Reproduction.new,
            BiologicalLaws::StayAlive.new,
            BiologicalLaws::Underpopulation.new,
          ]
        )
      end

      def create_renderer(width:, height:)
        canvas = Canvas::TerminalCanvas.new(
          width: width + 2,
          height: height + 2
        )

        Renderers::BoardRenderer.new(
          canvas: canvas,
          alive_char: '#',
          dead_char: '.'
        )
      end

      private

      def create_board(width, height)
        cells = 1.upto(height).to_a.map do
          1.upto(width).to_a.map do
            create_cell
          end
        end

        Universes::Board.new(cells: cells)
      end

      def create_cell
        status = GameOfLife::Dead.new
        if rand(10) == 1
          status = GameOfLife::Alive.new
        end

        Cell.new(status: status)
      end
    end
  end
end
