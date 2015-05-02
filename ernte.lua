local robot = require("robot")

-- define field size
local length = 8
local width = 8

-- DO NOT TOUCH BELOW THIS POINT

local currentStrip = 0

function turn()
  -- turn every 2nd into the other direction
  if (currentStrip % 2 == 0) then
    robot.turnRight()
  else
    robot.turnLeft()
  end
end

function harvest()
    -- harvest
    robot.swingDown()
    -- suck up remains
    robot.suckDown()
    -- plant seeds
    robot.placeDown()
end

-- MAIN LOOP
-- go up above the crop
robot.up()
-- step forward onto the field
robot.forward()

-- for each row
for x = 0, length do
  -- for each column
  for y = 0, width do
    harvest()
    robot.forward()
    -- next column
  end
  turn()
  harvest()
  robot.forward()
  turn()
  -- next row
  currentStrip = currentStrip + 1
end

-- TODO navigate back to starting point


