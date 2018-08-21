# frozen_string_literal: true

module GameOfLife
  module BiologicalLaws
    class StayAlive
      def apply(cell)
        Actions::Nothing.new(cell)
      end
    end
  end
end
