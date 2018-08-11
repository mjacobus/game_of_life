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

    def neighbors
      @neighbors
    end
  end
end
