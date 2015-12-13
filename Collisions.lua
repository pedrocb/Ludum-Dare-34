function beginContact(a, b, coll)
  cx, cy,cxx,cyy = coll:getPositions()
  if(a:getUserData() == "Player" or b:getUserData() == "Player") then
    cx, cy,cxx,cyy = coll:getPositions()
    --if cy >= player.body:getY()+player.height/2 or cyy > player.body:getY() + player.height/2 then
      player.canJump = true
    --end
  end
end

function endContact(a, b, coll)
  if(a:getUserData() == "Player" or b:getUserData() == "Player") then
    if cy > player.body:getY() then
      player.canJump = false
    end
  end
end
