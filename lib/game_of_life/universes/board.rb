# frozen_string_literal: true

module GameOfLife
  module Universes
    class Board < Universe
      def initialize(cells:)
        super(cells: cells.flatten)
        @config = cells
        arrange_neighborhood
      end

      def to_a
        @config
      end

      private

      def arrange_neighborhood
        to_a.each_with_index do |line, y|
          line.each_with_index do |cell, x|
            neighbors = get_neighbors(x: x, y: y)
            neighbors.each do |neighbor|
              cell.be_neighbors_with(neighbor)
            end
          end
        end
      end

      def get_neighbors(x:, y:)
        [
          get_neighbor(x: x - 1, y: y - 1),
          get_neighbor(x: x + 0, y: y - 1),
          get_neighbor(x: x + 1, y: y - 1),

          get_neighbor(x: x - 1, y: y + 0),
          get_neighbor(x: x + 1, y: y + 0),

          get_neighbor(x: x - 1, y: y + 1),
          get_neighbor(x: x + 0, y: y + 1),
          get_neighbor(x: x + 1, y: y + 1),
        ].compact
      end

      def get_neighbor(x:, y:)
        if y.negative? || x.negative?
          return
        end

        line = to_a[y]

        unless line
          return
        end

        line[x]
      end
    end
  end
end
