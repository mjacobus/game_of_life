module GameOfLife
  module Universes
    class Board < Universe
      def initialize(cells:)
        super(cells: cells.flatten)
        arrange_neighborhood(cells)
      end

      private

      def arrange_neighborhood(matrix)
        matrix.each_with_index do |line, y|
          line.each_with_index do |cell, x|
            neighbors = get_neighbors(x: x, y: y, matrix: matrix)
            neighbors.each do |neighbor|
              cell.be_neighbors_with(neighbor)
            end
          end
        end
      end

      def get_neighbors(x:, y:, matrix:)
        [
          get_neighbor(x: x - 1, y: y - 1, matrix: matrix),
          get_neighbor(x: x + 0, y: y - 1, matrix: matrix),
          get_neighbor(x: x + 1, y: y - 1, matrix: matrix),

          get_neighbor(x: x - 1, y: y + 0, matrix: matrix),
          get_neighbor(x: x + 1, y: y + 0, matrix: matrix),

          get_neighbor(x: x - 1, y: y + 1, matrix: matrix),
          get_neighbor(x: x + 0, y: y + 1, matrix: matrix),
          get_neighbor(x: x + 1, y: y + 1, matrix: matrix),
        ].compact
      end

      def get_neighbor(x:, y:, matrix:)
        if y < 0
          return
        end

        if x < 0
          return
        end

        line = matrix[y]

        unless line
          return
        end

        line[x]
      end
    end
  end
end
