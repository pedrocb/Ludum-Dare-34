require 'Player'
require 'Tile'
require 'Camera'
require 'Collisions'

function startGame()
  setupWorld()
  camera = {x=0,y=0,scaleX=1,scaleY=1,rotation=0}
  currentMove = 1;
  player = Player:new(50,50,50,50)
  tiles = getLevelTiles(2)
  keys = {"k","l"}
end

function getLevelTiles(level)
  local levelimage = levels[level]
  local tiles = {}
  for j=1,levelimage:getHeight() do
    for i=1,levelimage:getWidth() do
      local r,g,b,a = levelimage:getPixel(i-1,j-1)
      if r == 0 and g == 0 and b == 0 then
        table.insert(tiles,Tile:new(i-1,j-1))
      end
    end
  end
  return tiles
end

function setupWorld()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end


function love.load()
  levels = {}
  table.insert(levels,love.graphics.newImage("Level1.png"):getData())
  table.insert(levels,love.graphics.newImage("Level2.png"):getData())
  tileImage = love.graphics.newImage("Tile.png")
  startGame()
end

function love.draw()
  Camera:set()
  love.graphics.setColor(255, 255, 255, 100)
  Player:drawPlayer(player)
  for i,v in ipairs(tiles) do
    Tile:drawTile(v)
  end
  love.graphics.setColor(255, 0, 0, 100)
  love.graphics.print(Player.moves[currentMove],100,100)
  love.graphics.rectangle("fill", 0, love.window.getHeight() - 24, love.window.getWidth(), 24)
  love.graphics.setColor(255, 0, 0, 100)
  love.graphics.rectangle("fill", player.body:getX(),player.body:getY(), 1, 1)
  Camera:unset()
end

function love.keypressed(key, isrepeat)
  if(key == keys[1]) then
    currentMove= currentMove+1;
    if currentMove == 5 then
      currentMove = 1
    end
  end
end

function love.update(dt)
  local initialx = player.body:getX()
  world:update(dt)
  local diff = player.body:getX() - initialx
  Camera:move(diff,0)
  if love.keyboard.isDown("right") then
    player.body:applyForce(200,0)
  end
  if love.keyboard.isDown("left") then
    player.body:applyForce(-200,0)
  end
  if love.keyboard.isDown("up") and player.canJump then
    player.body:applyForce(0,-4500)
  end

  if love.keyboard.isDown(keys[2]) then
    if Player.moves[currentMove]=="down" then
      player.body:applyForce(0,200)
    elseif Player.moves[currentMove]=="left" then
      player.body:applyForce(-200,0)
    elseif Player.moves[currentMove]=="right" then
      player.body:applyForce(200,0)
    elseif Player.moves[currentMove]=="up" and player.canJump then
      player.body:applyForce(0,-4500)
    end
  end
end
