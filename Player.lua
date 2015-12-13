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
  love.graphics.draw(playerImage, b.body:getX(), b.body:getY(), b.body:getAngle(),  1, 1, playerImage:getWidth()/2, playerImage:getHeight()/2)
  if playerx.attacking then
    love.graphics.draw(player.weaponImage, b.body:getX() + playerImage:getWidth() - 10, b.body:getY() - playerImage:getHeight()/2 + 10, b.body:getAngle(),  1, 1, playerx.weaponImage:getWidth()/2, playerx.weaponImage:getHeight()/2)
  end
end
