function startReadingKeys()
  currentState = "readingState"
  readingState = 1
  keylistening = 1
  ready = false
  keys = {"",""}
  text ={"Please choose one letter for the left hand","Please choose one letter for the right hand","Press enter to start"}
end

function ReadingKeysKeypressed(key,isrepeat)
  if(key ~= "return") then
    if(#key == 1) then
      if(keylistening == 1) then
        keylistening = 2
        keys[1] = key
        if keys[1] == keys[2] then
          ready = false
        end
      elseif(keylistening == 2) then
        keylistening = 1
        keys[2] = key
        if keys[1] ~= keys[2] then
          ready = true
        else
          ready = false
        end
      end
    end
  else
    if(ready) then
      startLevel(1)
    end
  end
end
function ReadingKeysUpdate(dt)
end

function ReadingKeysDraw()
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, love.window:getWidth(),love.window:getHeight())
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", love.window:getWidth()/2, 0, 1, love.window:getHeight())
  love.graphics.setFont(initialmenufont)
  love.graphics.print(text[1],10,50)
  love.graphics.print(text[2],love.window:getWidth()/2 + 10,50)
  if ready then
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.rectangle("fill", love.window:getWidth()/2 - 100, 3*love.window:getHeight()/4 - 40, 500 , 100)
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.print(text[3],love.window:getWidth()/2 - 100 ,3*love.window:getHeight()/4)
  end
  love.graphics.setFont(initialmenuletter)
  love.graphics.print(keys[1],love.window:getWidth()/4,90)
  love.graphics.print(keys[2],3*love.window:getWidth()/4 + 30,90)
end
