require 'Player'
require 'Tile'
require 'Camera'
require 'Collisions'
require 'MovingBlock'
require 'TriangleBlock'
require 'GameState'
require 'ReadingKeys'
require 'Instructions'
require 'GameOver'
require 'Victory'


function love.load()
  levels = {}
  table.insert(levels,love.graphics.newImage("Level1.png"))
  table.insert(levels,love.graphics.newImage("Level2.png"))
  table.insert(levels,love.graphics.newImage("Level3.png"))
  table.insert(levels,love.graphics.newImage("Level4.png"))
  table.insert(levels,love.graphics.newImage("Level5.png"))
  table.insert(levels,love.graphics.newImage("Level6.png"))
  table.insert(levels,love.graphics.newImage("Level7.png"))
  table.insert(levels,love.graphics.newImage("Level8.png"))
  table.insert(levels,love.graphics.newImage("Level9.png"))
  table.insert(levels,love.graphics.newImage("Level10.png"))

  icons = {love.graphics.newImage("Jump.png"),love.graphics.newImage("Move.png"),love.graphics.newImage("Stop.png")}
  tilesImages = {love.graphics.newImage("Tile.png"),love.graphics.newImage("Tile2.png"),love.graphics.newImage("MovingBlock1.png")}
  playerImage = love.graphics.newImage("player.png")
  lightsaber = love.graphics.newImage("ARMA.png")
  initialmenufont = love.graphics.newFont("Ticketing.ttf", 20)
  initialmenuletter = love.graphics.newFont("Ticketing.ttf", 140)
  namefont= love.graphics.newFont("Ticketing.ttf", 40)
  gameSound = love.audio.newSource("Gigantic Dreams.mp3")
  startGame()
end


function startGame()
  startInstructions()
end

function love.keypressed(key, isrepeat)
  if currentState == "readingState" then
    ReadingKeysKeypressed(key,isrepeat)
  elseif currentState == "GameState" then
    GameStateKeyPressed(key,isrepeat)
  elseif currentState == "instructionsState" then
    InstructionsKeypressed(key,isrepeat)
  elseif currentState == "newLevelState" then
    NewLevelKeypressed(key,isrepeat)
  elseif currentState == "gameOverstate" then
    GameOverKeypressed(key,isrepeat)
  elseif currentState == "victorystate" then
    VictoryKeypressed(key,isrepeat)
  end
end

function love.update(dt)
  if currentState == "readingState" then
    ReadingKeysUpdate(dt)
  elseif currentState == "GameState" then
    GameStateUpdate(dt)
  elseif currentState == "instructionsState" then
    InstructionsUpdate(dt)
  elseif currentState == "newLevelState" then
    newLevelUpdate(dt)
  elseif currentState == "gameOverstate" then
    GameOverUpdate(dt)
  elseif currentState == "victorystate" then
    VictoryUpdate(dt)
  end
end

function love.draw()
  if currentState == "readingState" then
    ReadingKeysDraw()
  elseif currentState == "GameState" then
    GameStateDraw()
  elseif currentState == "instructionsState" then
    InstructionsDraw()
  elseif currentState == "newLevelState" then
    newLevelDraw()
  elseif currentState == "gameOverstate" then
    GameOverDraw()
  elseif currentState == "victorystate" then
    VictoryDraw()
  end
end
