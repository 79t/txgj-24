require "util"
require "world"

---@class Tile
---@field image string
---@field canCollide boolean
---@field center {x: number, y: number}
---@field topLeft {x: number, y: number}
---@field gameCoord {x: number, y: number}
---@field checkCollision fun(ball: Ball, world: World): boolean

local Tile = Object:extend()

Tile.scaleFactor = .5859

---@return Tile
function Tile:new()
    self.image = "assets/floorTile.png"
    self.canCollide = false
    self.center = {
        x = 0,
        y = 0
    }
    self.topLeft = {
        x = 0,
        y = 0
    }
    self.gameCoord = {
        x = 0,
        y = 0
    }
---@diagnostic disable-next-line: missing-return
end

local function inBtwn(low, mid, up)
    return low<mid and mid<up
end

local function isWithin(point1, point2, minDiff)
    return math.abs(point1 - point2) < minDiff
end

-- TODO 
---@param ball Ball
function Tile:checkCollision(ball)
    if (self.canCollide == false) then
        return "false"
    end

    if (inBtwn(self.topLeft.x, ball.center.x, self.topLeft.x + world.tileSize.width)) then
        if (isWithin(ball.center.y, self.topLeft.y, ball.trueSize.height)) then
            return "top"
        elseif (isWithin(ball.center.y, self.topLeft.y + world.tileSize.height, ball.trueSize.height)) then
            return "bottom"
        end
    end

    if (inBtwn(self.topLeft.y, ball.center.y, self.topLeft.y + world.tileSize.width)) then
        if (isWithin(ball.center.x, self.topLeft.x, ball.trueSize.width)) then
            return "left"
        elseif (inBtwn(ball.center.x, self.topLeft.x + world.tileSize.width, ball.trueSize.width)) then
            return "right"
        end
    end
    return "false"
end


function Tile:inBetween(lower, middle, upper)
    return lower < middle and middle < upper
end

function Tile:isWithin(point1, point2, minDiff)
    return math.abs(point1 - point2) < minDiff
end

return Tile