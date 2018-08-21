# frozen_string_literal: true

module Canvas
  module DrawingStrategies
    class KeyStroke
      def wait
        Curses.getch
      end
    end
  end
end
