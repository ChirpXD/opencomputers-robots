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
local currentStrip = 0

local function turn()
  -- turn every 2nd into the other direction
  if (currentStrip % 2 == 0) then
    robot.turnRight()
  else
    robot.turnLeft()
  end
end

local function turnAround()
  for i = 0, 1 do
    robot.turnLeft()
  end
end

local function mineHeight(height)
  for y = 0, (height - 1) do
    -- first swing your tool
    if(robot.detect()) then
      robot.swing()
    end
    -- then go up
    if(robot.detectUp()) then
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

  -- connect previous strip
  turnAround()
  mineHeight(3)
  turnAround()

  for x = 0, gap do
    mineHeight(3)
    robot.forward()
  end
  turn()

  -- start next strip
  currentStrip = currentStrip + 1
end

