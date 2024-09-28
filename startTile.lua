Tile = require "tile"

StartTile = Tile:extend()

function StartTile:new(x, y)
    StartTile.super.new(self)
    self.canCollide = true
    self.image = love.graphics.newImage("assets/startTile.png")

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
function StartTile:CheckCollision(ball, world)
    local result = self.super.checkCollision(ball, world)
    return not result == "false"
end

