module Canvas
  class TerminalCanvas
    def initialize(width:, height:)
      @width = Integer(width)
      @height = Integer(height)
      height = @height
      xPosition = 0
      yPosition = 0
      @window = Curses::Window.new(@height, @width, xPosition, yPosition)
      trap_signal
    end

    def draw(messages)
      window.box('|', '-')
      set_position(Position.new(1, 1))
      messages.each do |message|
        writeln(message)
      end
      window.refresh
    end

    def set_position(position)
      @position = position
      window.setpos(position.x, position.y)
    end

    def next_line
      set_position(Position.new(position.x + 1, 1))
    end

    def write(message)
      message = Array(message).join("")
      window.addstr(message)
    end

    def writeln(message)
      write(message)
      next_line
    end


    private

    attr_reader :position

    def trap_signal
      %w[HUP INT QUIT TERM].each do |i|
        if Curses.trap(i, "SIG_IGN") != 0 then  # 0 for SIG_IGN
          Curses.trap(i) {|sig| on_signal(sig) }
        end
      end
    end

    def on_signal(signal)
      stop
      exit signal
    end

    def window
      @window
    end

    def stop
      Curses.close_screen
    end

    class Position
      attr_reader :x, :y

      def initialize(x, y)
        @x = x
        @y = y
        freeze
      end
    end
  end
end
