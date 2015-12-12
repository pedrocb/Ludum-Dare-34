tile_size = 64
Tile = {
  size = tile_size;
  max_y = math.floor(love.window.getHeight()/tile_size) - 1;
  max_x = math.floor(love.window.getWidth()/tile_size) - 1;
  x_offside = (love.window.getWidth()/tile_size % 1)*tile_size/2
}

function Tile:new (x,y)
  local tile = {}
  tile.body = love.physics.newBody(world,x*self.size + self.size/2 + self.x_offside,y*self.size + self.size/2, "static")
  tile.shape = love.physics.newRectangleShape(self.size, self.size)
  tile.fixture = love.physics.newFixture(tile.body, tile.shape)
  tile.fixture:setUserData("Tile"..x..","..y)
  return tile
end

function Tile:drawTile (tile)
  b = tile
  love.graphics.draw(tileImage, b.body:getX(), b.body:getY(), b.body:getAngle(),  1, 1, tileImage:getWidth()/2, tileImage:getHeight()/2)
  love.graphics.polygon("fill", tile.body:getWorldPoints(tile.shape:getPoints()))
end
