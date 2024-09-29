Tile = require "tile"

HazardTile = Tile:extend()

function HazardTile:new(x, y)
    HazardTile.super.new(self)
    self.canCollide = true
    self.image = love.graphics.newImage("assets/hazardTile.png")

    self.topLeft = {
        x = windowMargin + ((x - 1) * tileSize.width),
        y = (y - 1) * tileSize.height
    }

    self.center = {
        x = self.topLeft.x + tileSize.width / 2,
        y = self.topLeft.y + tileSize.height / 2
    }
end

-- TODO: add punnishment for hitting HazardTile
---@param ball Ball
---@return boolean
function HazardTile:checkCollision(ball)
    local result = self.super.checkCollision(ball)
    if (result == "false") then return false end
    -- implement punishment code
    return true
end