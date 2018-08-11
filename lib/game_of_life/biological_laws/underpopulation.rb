module GameOfLife
  module BiologicalLaws
    class Underpopulation
      def apply(cell)
        alive = cell.neighbors.select(&:alive?)

        if alive.length < 2
          return Actions::Kill.new(cell)
        end

        Actions::Nothing.new(cell)
      end
    end
  end
end
