# frozen_string_literal: true

module GameOfLife
  class Universe
    include Enumerable

    attr_reader :cells

    def initialize(cells:)
      @cells = cells
    end

    def each(&block)
      cells.each(&block)
    end
  end
end
