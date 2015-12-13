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
  xx = x*Tile.size + 4
  yy = y*Tile.size
  block.body = love.physics.newBody(world,xx + Tile.x_offside,yy, "dynamic")
  block.body:setFixedRotation(true)
  vertices = {0,0,self.size,0,self.size/2,self.size}
  block.shape = love.physics.newPolygonShape(vertices)
  block.fixture = love.physics.newFixture(block.body, block.shape)
  block.fixture:setUserData("triangle")
  return block
end

function TriangleBlock:drawBlock (movingBlock)
  love.graphics.setColor(0, 255, 255, alpha)
  love.graphics.polygon("fill",movingBlock.body:getWorldPoints(movingBlock.shape:getPoints()))
  --b = movingBlock
  --love.graphics.draw(b.image, b.body:getX(), b.body:getY(), b.body:getAngle(),  1, 1, b.image:getWidth()/2, b.image:getHeight()/2)
end

function MovingBlock:update(movingBlock)
  if(movingBlock.body:getX()-self.size/2>movingBlock.finalx) or movingBlock.body:getX() - (self.size/2)<movingBlock.initialx then
    movingBlock.velx=movingBlock.velx*-1
    movingBlock.body:setLinearVelocity(movingBlock.velx,0)
  end
end
