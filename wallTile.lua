local Tile = require "tile"

local WallTile = Tile:extend()

local wHeight = 600 
local windowMargin = 100
local wSize = 16

local tileSize = { 
    width = wHeight / wSize,
    height = wHeight/ wSize
}

function WallTile:new(x, y)
    WallTile.super.new(self)
    self.canCollide = true
    self.image = love.graphics.newImage("assets/wallTile.png")

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
function WallTile:CheckCollision(ball)
    local collisionSide = self.super.CheckCollision(ball)
    if (collisionSide == "false") then
        return false
    elseif (collisionSide == "top") then
        ball.velocity.y = math.abs(ball.velocity.y) * -.9
    elseif (collisionSide == "bottom") then
        ball.velocity.y = math.abs(ball.velocity.y) * .9
    elseif (collisionSide == "left") then
        ball.velocity.x = math.abs(ball.velocity.x) * -.9
    elseif (collisionSide == "right") then
        ball.velocity.x = math.abs(ball.velocity.x) * .9
    end
    return true
end


return WallTile
