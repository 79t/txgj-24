local Tile = require "tile"
require "util"

---@class FloorTile: Tile

local FloorTile = Tile:extend()

local windowMargin = 100

local tileSize = { 
    width = worldCfg.tileSize.width,
    height = worldCfg.tileSize.height
}


function FloorTile:new(x, y)
    FloorTile.super.new(self)
    self.canCollide = false
    self.x = x
    self.y = y
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

---@param ball Ball
function FloorTile:checkCollision(ball)
    return false
end

return FloorTile
