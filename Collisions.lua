require 'TriangleBlock'
require 'newLevel'
require 'GameOver'
require 'Victory'

function beginContact(a, b, coll)
  cx, cy,cxx,cyy = coll:getPositions()
  if(a:getUserData() == "Player" or b:getUserData() == "Player") then
    cx, cy,cxx,cyy = coll:getPositions()
    player.canJump = true
  end
  if(a:getUserData() == "Player") then
    if(b:getUserData() == "Win") then
      if currentLevel == maxLevel then
        startVictory()
      else
        startNewLevel()
      end
    elseif(b:getUserData() == 2 or string.sub(b:getUserData(),1,string.len("triangle")) == "triangle") then
      local loseSound = love.audio.newSource("Hurt.wav", "static")
      loseSound:play()
      startGameOver()
    end
  elseif b:getUserData() == "Player" then
    if(a:getUserData() == "Win") then
      startNewLevel()
    elseif(a:getUserData() == 2 or string.sub(a:getUserData(),1,string.len("triangle")) == "triangle") then
      local loseSound = love.audio.newSource("Hurt.wav", "static")
      loseSound:play()
      startGameOver()
    end
  end
  checkTriangles(a:getUserData())
  checkTriangles(b:getUserData())
end

function string.starts(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end


function endContact(a, b, coll)
  if(a:getUserData() == "Player" or b:getUserData() == "Player") then
    if cy > player.body:getY() then
      player.canJump = false
    end
  end
end
