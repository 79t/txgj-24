
local Object = require "classic"
require "util"
---@class Ball
---@field center {x: number, y: number}
---@field trueSize {height: number, width: number}
---@field velocity {x: number, y: number}
---@field imageSize {width: number, height: number}
---@field image string
---@field startPos {x: number, y:number}

local ForceFieldNS = Object:extend()
ForceFieldNS.scaleFactor = 1

function ForceFieldNS:new()
    self.imageSize = {width = 800, height = 40}
    self.image = love.graphics.newImage("assets/ForceFieldInactive.png")
    self.image2 = love.graphics.newImage("assets/ForceFieldInactive.png")
    self.topLeft = {
        x = 100,
        y = 0,
    }
    self.topLeft2 = {
        x = 100,
        y = 0,
    }
end

function ForceFieldNS:updateMovement()
    if (love.keyboard.isDown('w')) then 
        self.topLeft = {
            x = 100,
            y = 0
        }
        self.image = love.graphics.newImage("assets/ForceFieldNorth.png")
    end
    if (love.keyboard.isDown('s')) then 
        self.topLeft = {
            x = 100,
            y = 560
        }
        self.image = love.graphics.newImage("assets/ForceFieldSouth.png")
    end
    if (love.keyboard.isDown('a')) then 
        self.topLeft2 = {
            x = 100,
            y = 0
        }
        self.image2 = love.graphics.newImage("assets/ForceFieldWest.png")
    end
    if (love.keyboard.isDown('d')) then 
        self.topLeft2 = {
            x = 660,
            y = 0
        }
        self.image2 = love.graphics.newImage("assets/ForceFieldEast.png")
    end
end

return ForceFieldNS