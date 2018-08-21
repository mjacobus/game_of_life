# frozen_string_literal: true

module GameOfLife
  module Actions
    class Resurrect
      def initialize(cell)
        @cell = cell
      end

      def perform
        @cell.resurrect
      end
    end
  end
end
