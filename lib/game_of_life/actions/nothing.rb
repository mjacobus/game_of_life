# frozen_string_literal: true

module GameOfLife
  module Actions
    class Nothing
      def initialize(cell); end

      def perform
        # NOOP
      end
    end
  end
end
