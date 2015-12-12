Camera = {

}

function Camera:set()
  love.graphics.push()
  love.graphics.rotate(-camera.rotation)
  love.graphics.scale(1/camera.scaleX,1/camera.scaleY)
  love.graphics.translate(-camera.x,-camera.y)
end

function Camera:unset()
  love.graphics.pop()
end

function Camera:move(dx, dy)
  camera.x = camera.x + (dx or 0)
  camera.y = camera.y + (dy or 0)
end

function Camera:rotate(dr)
  camera.rotation = camera.rotation + dr
end

function Camera:scale(sx, sy)
  sx = sx or 1
  camera.scaleX = camera.scaleX * sx
  camera.scaleY = camera.scaleY * (sy or sx)
end

function Camera:setPosition(x, y)
  camera.x = x or camera.x
  camera.y = y or camera.y
end

function Camera:setScale(sx, sy)
  camera.scaleX = sx or camera.scaleX
  camera.scaleY = sy or camera.scaleY
end
