Tile = require "tile"

EndTile = Tile:extend()

function EndTile:new(x, y)
    EndTile.super.new(self)
    self.canCollide = true
    self.image = love.graphics.newImage("assets/endTile.png")

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
function EndTile:checkCollision(ball)
    local result = self.super.checkCollision(ball)
    if (result == "false") then return false end
    -- implement success code
    return true
end