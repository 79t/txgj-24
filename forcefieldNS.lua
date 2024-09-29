
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
    self.woosh = love.audio.newSource("assets/woosh_1.wav", "static")
    self.woosh2 = love.audio.newSource("assets/woosh_2.wav", "static")
    self.woosh:setVolume(.5)
    self.woosh2:setVolume(.5)
end

function ForceFieldNS:updateMovement()
    if (love.keyboard.isDown('w')) then 
        self.topLeft = {
            x = 100,
            y = 0
        }
        self.image = love.graphics.newImage("assets/ForceFieldNorth.png")
        love.audio.stop(self.woosh)
        love.audio.play(self.woosh)
    end
    if (love.keyboard.isDown('s')) then 
        self.topLeft = {
            x = 100,
            y = 560
        }
        self.image = love.graphics.newImage("assets/ForceFieldSouth.png")
        love.audio.stop(self.woosh)
        love.audio.play(self.woosh)
    end
    if (love.keyboard.isDown('a')) then 
        self.topLeft2 = {
            x = 100,
            y = 0
        }
        self.image2 = love.graphics.newImage("assets/ForceFieldWest.png")
        love.audio.stop(self.woosh2)
        love.audio.play(self.woosh2)
    end
    if (love.keyboard.isDown('d')) then 
        self.topLeft2 = {
            x = 660,
            y = 0
        }
        self.image2 = love.graphics.newImage("assets/ForceFieldEast.png")
        love.audio.stop(self.woosh2)
        love.audio.play(self.woosh2)
    end
end

return ForceFieldNS