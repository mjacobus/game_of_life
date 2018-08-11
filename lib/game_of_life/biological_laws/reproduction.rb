module GameOfLife
  module BiologicalLaws
    class Reproduction
      def apply(cell)
        alive = cell.neighbors.select(&:alive?)

        if alive.length == 3
          return Actions::Resurrect.new(cell)
        end

        Actions::Nothing.new(cell)
      end
    end
  end
end
