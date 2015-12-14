function startGameOver()
  currentState = "gameOverstate"
  text ={"OOPS!","Press return to play this level again","Good luck and Have Fun!"}
end

function GameOverKeypressed(key,isrepeat)
  if(key == "return") then
    startLevel(currentLevel)
  end
end

function GameOverUpdate(dt)
end

function GameOverDraw()
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, love.window:getWidth(),love.window:getHeight())
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setFont(initialmenufont)
  love.graphics.print(text[1],love.window:getWidth()/2 - 300,love.window:getHeight()/2 -100)
  love.graphics.print(text[2],love.window:getWidth()/2- 300,love.window:getHeight()/2+20)
  love.graphics.print(text[3],love.window:getWidth()/2-300,love.window:getHeight()/2+40)
end
