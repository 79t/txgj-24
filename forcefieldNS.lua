
local Object = require "classic"
require "util"

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
    self.woosh = love.audio.newSource("assets/woosh_1_shorter.wav", "static")
    self.woosh2 = love.audio.newSource("assets/woosh_2_shorter.wav", "static")
    self.woosh:setVolume(.5)
    self.woosh2:setVolume(.5)
end

function ForceFieldNS:updateMovement()
    if (love.keyboard.isDown(worldCfg.keyBind.up)) then 
        self.topLeft = {
            x = 100,
            y = 0
        }
        self.image = love.graphics.newImage("assets/ForceFieldNorth.png")
        love.audio.stop(self.woosh)
        love.audio.play(self.woosh)
    end
    if (love.keyboard.isDown(worldCfg.keyBind.down)) then 
        self.topLeft = {
            x = 100,
            y = 560
        }
        self.image = love.graphics.newImage("assets/ForceFieldSouth.png")
        love.audio.stop(self.woosh)
        love.audio.play(self.woosh)
    end
    if (love.keyboard.isDown(worldCfg.keyBind.left)) then 
        self.topLeft2 = {
            x = 100,
            y = 0
        }
        self.image2 = love.graphics.newImage("assets/ForceFieldWest.png")
        love.audio.stop(self.woosh2)
        love.audio.play(self.woosh2)
    end
    if (love.keyboard.isDown(worldCfg.keyBind.right)) then 
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