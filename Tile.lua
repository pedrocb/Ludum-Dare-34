tile_size = 64
Tile = {
  size = tile_size;
  max_y = math.floor(love.window.getHeight()/tile_size) - 1;
  max_x = math.floor(love.window.getWidth()/tile_size) - 1;
  x_offside = (love.window.getWidth()/tile_size % 1)*tile_size/2;
  colors = {{r=0,g=0,b=0},{r=255,g=0,b=0},{r=0,g=0,b=255},{r=0,g=255,b=0}}
}

function Tile:new (x,y,w,color)
  local tile = {}
  tile.image = tilesImages[color]
  tile.width = w
  tile.body = love.physics.newBody(world,x*self.size + self.size*w/2 + self.x_offside,y*self.size + self.size/2, "static")
  tile.shape = love.physics.newRectangleShape(self.size*w, self.size)
  tile.fixture = love.physics.newFixture(tile.body, tile.shape)
  tile.fixture:setUserData(color)

  return tile
end

function Tile:drawTile (tile)
  b = tile
  for i=0,tile.width-1 do
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(b.image, b.body:getX() - (b.width-2)*tile_size/2 + tile_size*i, b.body:getY()+tile_size/2, b.body:getAngle(),  1, 1, Tile.size, Tile.size)
  end
end

function Tile:checkColor(levelimage,i,j)
  local r,g,b,a = levelimage:getPixel(i,j)
  for k=1,#Tile.colors do
    if r == Tile.colors[k].r and g == Tile.colors[k].g and b == Tile.colors[k].b then
      return Tile.colors[k],k
    end
  end
  return nil,nil
end
