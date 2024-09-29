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


function inBtwn(low, mid, up)
    return low<mid and mid<up
end

function isWithin(point1, point2, minDiff)
    return math.abs(point1 - point2) < minDiff
end

-- TODO 
---@param ball Ball
---@return boolean
function WallTile:checkCollision(ball)
    -- local collisionSide = self.super.checkCollision(ball)
    local collisionSide

    if (inBtwn(self.topLeft.x, ball.center.x, self.topLeft.x + world.tileSize.width)) then
        if (isWithin(ball.center.y, self.topLeft.y, ball.trueSize.height/2)) then
            collisionSide =  "top"
        elseif (isWithin(ball.center.y, self.topLeft.y + world.tileSize.height, ball.trueSize.height/2)) then
            collisionSide =  "bottom"
        end
    end

    if (inBtwn(self.topLeft.y, ball.center.y, self.topLeft.y + world.tileSize.width)) then
        if (isWithin(ball.center.x, self.topLeft.x, ball.trueSize.width/2)) then
            collisionSide = "left"
        elseif (isWithin(ball.center.x, self.topLeft.x + world.tileSize.width, ball.trueSize.width/2)) then
            collisionSide = "right"
        end
    end
 
    if (collisionSide == "false") then
        return false
    elseif (collisionSide == "top") then
        ball.velocity.y = -math.abs(ball.velocity.y)*.9
    elseif (collisionSide == "bottom") then
        ball.velocity.y = math.abs(ball.velocity.y)*.9
    elseif (collisionSide == "left") then
        ball.velocity.x = -math.abs(ball.velocity.x)*.9
    elseif (collisionSide == "right") then
        ball.velocity.x = math.abs(ball.velocity.x)*.9
    end
    return true
end


return WallTile
