Tile = require "tile"

---@class FloorTile: Tile
---@

FloorTile = Tile:extend()

wHeight = 600 
windowMargin = 100
wSize = 16

tileSize = { 
    width = wHeight / wSize,
    height = wHeight/ wSize
}



function FloorTile:new(x, y)
    FloorTile.super.new(self)
    self.canCollide = false
    -- self.image = "assets/mog.jpeg"
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

-- return FloorTile
