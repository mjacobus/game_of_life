# frozen_string_literal: true

module GameOfLife
  class Runner
    def initialize(universe:, laws:)
      @universe = universe
      @laws = laws
    end

    def run_once
      actions = @universe.map do |cell|
        @laws.map do |law|
          law.apply(cell)
        end
      end

      actions.flatten.map(&:perform)
    end

    def run
      loop do
        yield(@universe)
        run_once
      end
    end
  end
end
