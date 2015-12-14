Player = {
  moves = {"up","right","left"};
  jump = 10000;
  --jump = 3500;
  --vel = 5000
  vel = 5000
}

function Player:new(x,y,w,h)
  local player = {}
  player.attacking = false
  player.height = h
  player.canJump = false
  player.body = love.physics.newBody(world, x, y, "dynamic")
  player.body:setFixedRotation(true)
  player.shape = love.physics.newRectangleShape(w, h)
  player.fixture = love.physics.newFixture(player.body,player.shape)
  player.fixture:setUserData("Player")
  player.weaponImage = lightsaber
  return player
end

function Player:drawPlayer(playerx)
  b = playerx
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.draw(playerImage, b.body:getX(), b.body:getY(), b.body:getAngle(),  1, 1, playerImage:getWidth()/2, playerImage:getHeight()/2)
end
