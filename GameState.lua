function startLevel(_level)
  setupWorld()
  camera = {x=0,y=0,scaleX=1,scaleY=1,rotation=0}
  currentMove = 1;
  player = Player:new(50,50,40,40)
  currentLevel =_level
  movingblocks = {}
  fallingblocks = {}
  tiles = getLevelTiles(currentLevel)
  wall = {}
  wall.body = love.physics.newBody(world,levels[currentLevel]:getWidth()*Tile.size,love.window:getHeight()/2, "static")
  wall.shape = love.physics.newRectangleShape(1, love.window:getHeight())
  wall.fixture = love.physics.newFixture(wall.body, wall.shape)
  wall2 = {}
  wall2.body = love.physics.newBody(world,0,0, "static")
  wall2.shape = love.physics.newRectangleShape(levels[currentLevel]:getWidth()*Tile.size, 1)
  wall2.fixture = love.physics.newFixture(wall2.body, wall2.shape)
  currentState = "GameState"
end

function getLevelTiles(level)
  local levelimage = levels[level]:getData()
  local tiles = {}
  j=0
  while(j<levelimage:getHeight()) do
    i=0
    while(i<levelimage:getWidth()) do
      local currentColor,colorindex = Tile:checkColor(levelimage,i,j)
      if currentColor ~= nil then
        width=1
        initiali=i
        while(i+1<levelimage:getWidth() and Tile:checkColor(levelimage,i+1,j) == currentColor) do
          i=i+1
          width=width+1
        end
        if(colorindex == 3) then
          table.insert(movingblocks,MovingBlock:new(initiali,j,width,tilesImages[colorindex]))
        elseif(colorindex == 4) then
          print(initiali.." "..j)
          table.insert(fallingblocks,TriangleBlock:new(initiali,j,width,tilesImages[colorindex-1]))
        else
          table.insert(tiles,Tile:new(initiali,j,width,tilesImages[colorindex]))
        end
      end
      i=i+1
    end
    j=j+1
  end
  return tiles
end

function setupWorld()
  love.physics.setMeter(64)
  world = love.physics.newWorld(0, 9.81*64, true)
  world:setCallbacks(beginContact, endContact, preSolve, postSolve)
end

function GameStateDraw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", 0, 0, love.window:getWidth(), love.window:getHeight())
  Camera:set()
  for i,v in ipairs(tiles) do
    Tile:drawTile(v)
  end
  for i,v in ipairs(fallingblocks) do
    TriangleBlock:drawBlock(v)
  end

  for i,v in ipairs(movingblocks) do
    MovingBlock:drawBlock(v)
  end
  Player:drawPlayer(player)
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.print(Player.moves[currentMove],100,100)
  love.graphics.rectangle("fill", 0, love.window.getHeight() - 24, love.window.getWidth(), 24)
  love.graphics.setColor(255, 0, 0, 255)
  Camera:unset()
  drawGUI()
end

function GameStateUpdate(dt)
  local initialx = player.body:getX()
  for i,v in ipairs(movingblocks) do
    MovingBlock:update(v)
  end
  world:update(dt)
  local diff = player.body:getX() - initialx
  Camera:move(diff,0)
  if(camera.x>levels[currentLevel]:getWidth()*Tile.size - love.window:getWidth()) then
    camera.x = levels[currentLevel]:getWidth()*Tile.size - love.window:getWidth()
  end
  if love.keyboard.isDown("right") then
    player.body:applyForce(200,0)
  end
  if love.keyboard.isDown("left") then
    player.body:applyForce(-200,0)
  end
  if love.keyboard.isDown("up") and player.canJump then
    player.body:applyForce(0,-Player.jump)
    player.canJump = false
  end
end

function GameStateKeyPressed(key,isrepeat)
  if(key == keys[1]) then
    currentMove= currentMove+1;
    if currentMove == #Player.moves + 1 then
      currentMove = 1
    end
  end
  if(key == keys[2]) then
    if love.keyboard.isDown(keys[2]) then
      if Player.moves[currentMove]=="left" and player.canJump then
        player.body:setLinearVelocity(0,0)
      elseif Player.moves[currentMove]=="right" then
        local vx,vy = player.body:getLinearVelocity()
        if vx< 250 then
          player.body:applyForce(Player.vel,0)
        end
      elseif Player.moves[currentMove]=="up" and player.canJump then
        player.body:applyForce(0,-Player.jump)
        player.canJump = false
      elseif Player.moves[currentMove]=="fight" and player.canJump then
        player.attacking = not player.attacking;
        print(player.attacking)
      end
    end
  end
end

function love.load()
  levels = {}
  table.insert(levels,love.graphics.newImage("Level1.png"))
  table.insert(levels,love.graphics.newImage("Level2.png"))
  icons = {love.graphics.newImage("Jump.png"),love.graphics.newImage("Move.png"),love.graphics.newImage("Stop.png")}
  tilesImages = {love.graphics.newImage("Tile.png"),love.graphics.newImage("Tile2.png"),love.graphics.newImage("MovingBlock1.png")}
  playerImage = love.graphics.newImage("player.png")
  lightsaber = love.graphics.newImage("ARMA.png")
  startGame()
end

function love.draw()
  if currentState == "readingState" then
    ReadingKeysDraw()
  elseif currentState == "GameState" then
    GameStateDraw()
  end
end

function drawGUI()
  local y =50
  local firstX = love.window.getWidth()/2 - #Player.moves*64
  for i,v in ipairs(Player.moves) do
    love.graphics.reset()
    love.graphics.draw(icons[i],firstX + i*64,y)
    if i ~= currentMove then
      love.graphics.setColor(255, 255, 255, 100)
      love.graphics.rectangle("fill", firstX + i*64,y,64,64)
    else
      love.graphics.setColor(255, 0, 0, 255)
      love.graphics.rectangle("line", firstX + i*64,y,64,64)
    end
  end
end
