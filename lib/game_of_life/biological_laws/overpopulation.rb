# frozen_string_literal: true

module GameOfLife
  module BiologicalLaws
    class Overpopulation
      def apply(cell)
        alive = cell.neighbors.select(&:alive?)

        if alive.length > 3
          return Actions::Kill.new(cell)
        end

        Actions::Nothing.new(cell)
      end
    end
  end
end
