require 'Tile'

TriangleBlock = {
  size = tile_size - 8;
  minvel = 100;
  maxvel = 200
}

function TriangleBlock:new (x,y,xrange,img)
  local block = {}
  block.vely = love.math.random()*(MovingBlock.maxvel - MovingBlock.minvel) + MovingBlock.minvel
  block.image = img
  block.x = x
  block.y = y
  block.speed = love.math.random()*(TriangleBlock.maxvel-TriangleBlock.minvel) + TriangleBlock.minvel
  xx = x*Tile.size + 4
  yy = y*Tile.size
  block.body = love.physics.newBody(world,xx + Tile.x_offside,yy, "dynamic")
  block.body:setFixedRotation(true)
  vertices = {0,0,self.size,0,self.size/2,self.size}
  block.shape = love.physics.newPolygonShape(vertices)
  block.fixture = love.physics.newFixture(block.body, block.shape)
  block.fixture:setUserData("triangle"..x..y)
  block.body:setGravityScale(0)
  block.body:setLinearVelocity(0,200)
  block.down = false
  block.timer = love.timer.getTime()
  block.cooldown = love.math.random()*4 + 2
  return block
end

function TriangleBlock:drawBlock (movingBlock)
  love.graphics.setColor(255, 0, 0, 255)
  love.graphics.polygon("fill",movingBlock.body:getWorldPoints(movingBlock.shape:getPoints()))
end

function checkTriangles(str)
  for k,v in ipairs(fallingblocks) do
    if v.fixture:getUserData() == str then
      v.down = true
      v.timer = love.timer.getTime()
    end
  end
end

function TriangleBlock:update(movingBlock)
  if movingBlock.down then
    if(love.timer.getTime() - movingBlock.timer > movingBlock.cooldown) then
      xx = movingBlock.x*Tile.size + 4
      yy = movingBlock.y*Tile.size
      movingBlock.body:setPosition(xx + Tile.x_offside,yy)
      movingBlock.body:setLinearVelocity(0,200)
      movingBlock.down = false
    end
  end
end
