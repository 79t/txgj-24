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
---@return boolean
function Tile:checkCollision(ball, world)
    if not self.canCollide then
        return false
    end

    left = self.topLeft.x
    top = self.topLeft.y 
    right = self.topLeft.x + world.tileSize.width 
    bottom = self.topLeft.y + world.tileSize.height


    if (IsBetween(ball.center.x, left, right)) then
        if (IsWithin(ball.center.y, top, ball.trueSize.height/2)) then
            ball.velocity.y = -math.abs(ball.velocity.y)*.9
            return true
        elseif (IsWithin(ball.center.y, bottom, ball.trueSize.height/2)) then
            ball.velocity.y = math.abs(ball.velocity.y)*.9
            return true
        end
    elseif (IsBetween(ball.center.y, top, bottom)) then
        if (IsWithin(ball.center.x, left, ball.trueSize.width/2)) then
            ball.velocity.x = -math.abs(ball.velocity.x)*.9
            return true
        elseif (IsWithin(ball.center.x, right, ball.trueSize.width/2)) then
            ball.velocity.x = math.abs(ball.velocity.x)*.9
            return true
        end
    end
    return false
end

return Tile