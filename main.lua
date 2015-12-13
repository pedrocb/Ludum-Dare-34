require 'Player'
require 'Tile'
require 'Camera'
require 'Collisions'
require 'MovingBlock'
require 'TriangleBlock'
require 'GameState'
require 'ReadingKeys'


function startGame()
  startReadingKeys()
end

function love.keypressed(key, isrepeat)
  if currentState == "readingState" then
    ReadingKeysKeypressed(key,isrepeat)
  elseif currentState == "GameState" then
    GameStateKeyPressed(key,isrepeat)
  end
end

function love.update(dt)
  if currentState == "readingState" then
    ReadingKeysUpdate(dt)
  elseif currentState == "GameState" then
    GameStateUpdate(dt)
  end
end
