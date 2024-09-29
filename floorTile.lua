local Tile = require "tile"
require "world"

---@class FloorTile: Tile

local FloorTile = Tile:extend()

local wHeight = 600 
local windowMargin = 100
local wSize = 16

local tileSize = { 
    width = wHeight / wSize,
    height = wHeight/ wSize
}



function FloorTile:new(x, y)
    FloorTile.super.new(self)
    self.canCollide = false
    self.x = x
    self.y = y
    -- self.image = "assets/mog.jpeg"
    self.image = love.graphics.newImage("assets/floorTile.png")
    self.topLeft = {
        x = windowMargin + ((x - 1) * tileSize.width),
        y = (y - 1) * tileSize.height
    }

    self.center = {
        x = self.topLeft.x + tileSize.width / 2,
        y = self.topLeft.y + tileSize.height / 2
    }
end

local function inBtwn(low, mid, up)
    return low<mid and mid<up
end

local function isWithin(point1, point2, minDiff)
    return math.abs(point1 - point2) < minDiff
end

-- TODO 
---@param ball Ball
---@return 
function FloorTile:checkCollision(ball)
    -- print("Collision detected at " .. self.x .. " , " .. self.y .. " " .. ball.topLeft.x .. " " .. ball.topLeft.y)
    -- local result = FloorTile.super.checkCollision(ball)
    -- return not result == "false"

    return false
end

-- return FloorTile
return FloorTile
