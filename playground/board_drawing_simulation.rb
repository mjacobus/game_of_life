require 'bundler/setup'
require_relative '../lib/game_of_life'


height = 50
width = 150
canvas = Canvas::TerminalCanvas.new(
  height: height,
  width: width
)

def cells(x, y)
  1.upto(x).to_a.map do |_x|
    1.upto(y).map do |_y|
      rand(3) == 1 ? '*' : ' '
    end
  end
end

strategy = Canvas::DrawingStrategies::KeyStroke.new
strategy = Canvas::DrawingStrategies::Sleep.new(seconds: 0.5)

1.upto(3) do
  lines = cells(height - 2, width - 2)
  canvas.draw(lines)
  strategy.wait
end
