Tile = require "tile"

StartTile = Tile:extend()

local wHeight = 600 
local windowMargin = 100
local wSize = 16

local tileSize = { 
    width = wHeight / wSize,
    height = wHeight/ wSize
}

function StartTile:new(x, y)
    StartTile.super.new(self)
    self.canCollide = true
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
---@param world World
---@return boolean
function StartTile:CheckCollision(ball)
    return false
end

