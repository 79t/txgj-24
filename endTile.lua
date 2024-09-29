local Tile = require "tile"
local GameStateManager = require "GameStateManager"
local WinState = require "states.win"

EndTile = Tile:extend()

local wHeight = 600 
local windowMargin = 100
local wSize = 16

local tileSize = { 
    width = worldCfg.tileSize.width,
    height = worldCfg.tileSize.height
}
function EndTile:new(x, y)
    EndTile.super.new(self)
    self.canCollide = true
    self.image = love.graphics.newImage("assets/endTile.png")

    self.topLeft = {
        x = windowMargin + ((x - 1) * tileSize.width),
        y = (y - 1) * tileSize.height
    }

    self.center = {
        x = self.topLeft.x + tileSize.width / 2,
        y = self.topLeft.y + tileSize.height / 2
    }
end

-- TODO: add punnishment for hitting HazardTile
---@param ball Ball
---@param world World
---@return boolean
function EndTile:checkCollision(ball)
    local collisionSide

    if (inBtwn(self.topLeft.x, ball.center.x, self.topLeft.x + worldCfg.tileSize.width)) then
        if (isWithin(ball.center.y, self.topLeft.y, ball.trueSize.height/2)) then
            collisionSide =  "top"
        elseif (isWithin(ball.center.y, self.topLeft.y + worldCfg.tileSize.height, ball.trueSize.height/2)) then
            collisionSide =  "bottom"
        end
    end

    if (inBtwn(self.topLeft.y, ball.center.y, self.topLeft.y + worldCfg.tileSize.width)) then
        if (isWithin(ball.center.x, self.topLeft.x, ball.trueSize.width/2)) then
            collisionSide = "left"
        elseif (isWithin(ball.center.x, self.topLeft.x + worldCfg.tileSize.width, ball.trueSize.width/2)) then
            collisionSide = "right"
        end
    end
 
    if (collisionSide == "false") then
        return false
    elseif (collisionSide == "top" or collisionSide == "bottom" or collisionSide == "left" or collisionSide == "right") then
        -- set success code here
        GameStateManager:setState(WinState)
    end
    return true
end