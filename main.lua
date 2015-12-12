a = {x=10,y=10}

function love.draw()
    love.graphics.print("Hello World", a.x, a.y)
    love.graphics.print("logging")
    print("Ola")
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    a.x=a.x+1
  end
end
