local robot = require("robot")

-- TODO add safety for lava: go up +10 and back -10

-- number of strips
local strips = 2
-- length of a mining strip
local length = 10
-- gap between mining strips
local gap = 2
-- when to place torch
local torch = 7

-- do not touch!

local function turn()
  -- turn every 2nd into the other direction
  if (strips % 2 == 0) then
    robot.turnLeft()
  else
    robot.turnRight()
  end
end

local function mineHeight(height)
  for y = 0, (height - 1) do
    -- first swing your tool
    while(robot.detect()) do
      robot.swing()
    end
    -- then go up
    while(robot.detectUp()) do
      robot.swingUp()
    end
    robot.up()
  end
  -- down again
  for y = 0, (height - 1) do
    robot.down()
  end
end

-- start to stripmine
for z = 0, strips do
-- start a new strip
for x = 0, length do
  mineHeight(3)

  -- TODO select torch from inventor
  -- TODO place torch to the left

  -- forward
  robot.forward()
end
-- end this strip
turn()

for x = 0, gap do
  mineHeight(3)
  robot.forward()
end
turn()

end


