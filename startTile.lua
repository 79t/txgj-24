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
---@return boolean
function StartTile:checkCollision(ball)
    local result = self.super.checkCollision(ball)
    return not result == "false"
end

