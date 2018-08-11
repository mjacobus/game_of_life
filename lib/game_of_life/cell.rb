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

    def neighbors
      @neighbors
    end
  end
end
