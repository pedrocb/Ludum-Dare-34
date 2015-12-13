require 'Tile'

MovingBlock = {
  size = tile_size;
  minvel = 100;
  maxvel = 200
}

function MovingBlock:new (x,y,xrange,img)
  local block = {}
  block.velx = love.math.random()*(MovingBlock.maxvel - MovingBlock.minvel) + MovingBlock.minvel
  block.initialx = x*self.size + Tile.x_offside
  block.finalx = (x+xrange-1)*self.size + Tile.x_offside
  block.image = img
  block.body = love.physics.newBody(world,x*self.size + self.size/2 + Tile.x_offside,y*self.size + self.size/2, "kinematic")
  block.body:setLinearVelocity(block.velx,0)
  block.body:setGravityScale(0)
  block.body:setFixedRotation(true)
  block.shape = love.physics.newRectangleShape(self.size, self.size)
  block.fixture = love.physics.newFixture(block.body, block.shape)
  block.fixture:setUserData("movingblock")
  return block
end

function MovingBlock:drawBlock (movingBlock)
  b = movingBlock
  love.graphics.draw(b.image, b.body:getX(), b.body:getY(), b.body:getAngle(),  1, 1, b.image:getWidth()/2, b.image:getHeight()/2)
end

function MovingBlock:update(movingBlock)
  if(movingBlock.body:getX()-self.size/2>movingBlock.finalx) or movingBlock.body:getX() - (self.size/2)<movingBlock.initialx then
    movingBlock.velx=movingBlock.velx*-1
    movingBlock.body:setLinearVelocity(movingBlock.velx,0)
  end
end
