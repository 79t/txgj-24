require "util"

---@class Tile
---@field image string
---@field canCollide boolean
---@field center {x: number, y: number}
---@field topLeft {x: number, y: number}
---@field gameCoord {x: number, y: number}
---@field checkCollision fun(ball: Ball, world: World): boolean

Tile = Object:extend()

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

-- TODO 
---@param ball Ball
---@param world World
---@return string
function Tile:checkCollision(ball, world)
    if (self.canColide == false) then
        return "false"
    end

    if (self.inBetween(self.topLeft.x, ball.center.x, self.topLeft.x + world.tileSize.width)) then
        if (self.isWithin(ball.center.y, self.topLeft.y, ball.trueSize.height)) then
            return "top"
        elseif (self.isWithin(ball.center.y, self.topLeft.y + world.tileSize.height, ball.trueSize.height)) then
            return "bottom"
        end
    end

    if (self.inBetween(self.topLeft.y, ball.center.y, self.topLeft.y + world.tileSize.width)) then
        if (self.isWithin(ball.center.x, self.topLeft.x, ball.trueSize.width)) then
            return "left"
        elseif (self.isWithin(ball.center.x, self.topLeft.x + world.tileSize.width, ball.trueSize.width)) then
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