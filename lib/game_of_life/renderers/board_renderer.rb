# frozen_string_literal: true

module GameOfLife
  module Renderers
    class BoardRenderer
      def initialize(canvas:, alive_char:, dead_char:)
        @canvas = canvas
        @alive_char = alive_char
        @dead_char = dead_char
      end

      def render(board)
        messages = board.to_a.map do |line|
          line.map do |cell|
            cell.alive? ? @alive_char : @dead_char
          end
        end

        @canvas.draw(messages)
      end
    end
  end
end
