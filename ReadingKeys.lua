function startReadingKeys()
  currentState = "readingState"
  readingState = 1
  letter = ""
  text ={"Please choose one key for the left hand","Please choose one key for the right hand"}
end

function ReadingKeysKeypressed(key,isrepeat)
  letter = key
end
function ReadingKeysUpdate(dt)
end

function ReadingKeysDraw()
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, love.window:getWidth(),love.window:getHeight())
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.rectangle("fill", love.window:getWidth()/2, 0, 1, love.window:getHeight())
  font = love.graphics.newFont("AwesomeFont.ttf", 15)
  love.graphics.print(text[readingState],30,50)
  love.graphics.print(letter,love.window:getWidth()/6,love.window:getHeight()/2)
end
