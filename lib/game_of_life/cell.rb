module GameOfLife
  class Cell
    def initialize(status:)
      @alive = status == :alive
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
  end
end
