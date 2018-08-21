require "game_of_life/version"
require 'game_of_life/cell'
require 'game_of_life/actions/kill'
require 'game_of_life/actions/nothing'
require 'game_of_life/actions/resurrect'
require 'game_of_life/biological_laws/underpopulation'
require 'game_of_life/biological_laws/stay_alive'
require 'game_of_life/biological_laws/overpopulation'
require 'game_of_life/biological_laws/reproduction'
require 'game_of_life/universe'
require 'game_of_life/renderers/board_renderer'
require 'game_of_life/universes/board'
require 'game_of_life/alive'
require 'game_of_life/dead'
require 'game_of_life/runner'
require 'canvas'

module GameOfLife
end
