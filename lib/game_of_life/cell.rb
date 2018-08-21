# frozen_string_literal: true

module GameOfLife
  class Cell
    def initialize(status: Alive.new)
      @status = status
      @neighbors = []
    end

    def alive?
      @status.alive?
    end

    def kill
      @status = Dead.new
    end

    def resurrect
      @status = Alive.new
    end

    def be_neighbors_with(cell)
      @neighbors << cell
    end

    attr_reader :neighbors
  end
end
