# frozen_string_literal: true

module GameOfLife
  class Cell
    def initialize(status: :alive)
      @alive = status == :alive
      @neighbors = []
    end

    def alive?
      @alive
    end

    def kill
      @alive = false
    end

    def resurrect
      @alive = true
    end

    def be_neighbors_with(cell)
      @neighbors << cell
    end

    attr_reader :neighbors
  end
end
