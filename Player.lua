Player = {
  moves = {"up","right","down","left"};
}

function Player:new(x,y,w,h)
  local player = {}
  player.height = h
  player.canJump = false
  player.body = love.physics.newBody(world, x, y, "dynamic")
  player.body:setFixedRotation(true)
  player.shape = love.physics.newRectangleShape(w, h)
  player.fixture = love.physics.newFixture(player.body,player.shape)
  player.fixture:setUserData("Player")
  return player
end

function Player:drawPlayer(playerx)
  love.graphics.polygon("fill", playerx.body:getWorldPoints(playerx.shape:getPoints()))
end
