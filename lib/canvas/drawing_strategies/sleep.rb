module Canvas
  module DrawingStrategies
    class Sleep
      def initialize(seconds: 1)
        @seconds = seconds
      end

      def wait
        sleep(@seconds)
      end
    end
  end
end
