Tile = require "tile"

WallTile = Tile:extend()

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