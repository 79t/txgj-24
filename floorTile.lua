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

-- TODO 
---@param ball Ball
---@return boolean
function FloorTile:checkCollision(ball)
    local result = self.super.checkCollision(ball)
    return not result == "false"
end

-- return FloorTile
return FloorTile
