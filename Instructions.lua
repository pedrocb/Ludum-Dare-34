function startInstructions()
  currentState = "instructionsState"
  title = "Two Finger Platform"
  text ={"Instructions:","This is a platform game that you can only use two buttons to reach the end.","Use left hand key to choose your action","User right hand key to execute your action","Use LCTRL to restart the level","Good luck and Have Fun", "Press return to play","Made by: Pedro Belém"}
  maxLevel = 10
end

function InstructionsKeypressed(key,isrepeat)
  if(key == "return") then
    startReadingKeys()
  end
end

function InstructionsUpdate(dt)
end

function InstructionsDraw()
  love.graphics.setColor(0, 0, 0, 255)
  love.graphics.rectangle("fill", 0, 0, love.window:getWidth(),love.window:getHeight())
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setFont(namefont)
  love.graphics.print(title,love.window:getWidth()/2 - 130,love.window:getHeight()/2 - 200)
  love.graphics.setFont(initialmenufont)
  love.graphics.print(text[1],love.window:getWidth()/2 - 300,love.window:getHeight()/2 -80)
  love.graphics.print(text[2],love.window:getWidth()/2- 300,love.window:getHeight()/2+20)
  love.graphics.print(text[3],love.window:getWidth()/2-300,love.window:getHeight()/2+40)
  love.graphics.print(text[4],love.window:getWidth()/2-300,love.window:getHeight()/2+60)
  love.graphics.print(text[5],love.window:getWidth()/2-300,love.window:getHeight()/2+80)
  love.graphics.print(text[6],love.window:getWidth()/2-300,love.window:getHeight()/2+100)
  love.graphics.print(text[7],love.window:getWidth()/2-300,love.window:getHeight()/2+120)
  love.graphics.print(text[8],love.window:getWidth()/2-300,love.window:getHeight()/2+200)


end
