module GameOfLife
  module Actions
    class Kill
      def initialize(cell)
        @cell = cell
      end

      def perform
        @cell.kill
      end
    end
  end
end
