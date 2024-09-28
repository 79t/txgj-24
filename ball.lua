
local Object = require "classic"
require "util"
---@class Ball
---@field center {x: number, y: number}
---@field trueSize {height: number, width: number}
---@field velocity {x: number, y: number}
---@field imageSize {width: number, height: number}
---@field image string

local Ball = Object:extend()
Ball.scaleFactor = 0.25

local maxSpeed = 10
local accelForce = 0.1

function Ball:new()
    self.center = {x = window.height/2, y=window.height/2}
    self.velocity = {x = -.1, y = -.1}
    self.acceleration = {x = 0, y = 0}
    self.imageSize = {width = 128, height = 128}
    self.image = love.graphics.newImage("assets/Chaser_Red_Circle.png")
    self.trueSize = {
        width = 32,
        height = 32
    }
    self.topLeft = {
        x = 300 - 16,
        y = 300 - 16,
    }
end

function Ball:updatePos()
    self.topLeft = {
        x = self.center.x - self.trueSize.width/2,
        y = self.center.y - self.trueSize.height/2
    }
end

function Ball:updateMovement()
    if (love.keyboard.isDown('w')) then self.acceleration.y = -accelForce end
    if (love.keyboard.isDown('a')) then self.acceleration.x = -accelForce end
    if (love.keyboard.isDown('s')) then self.acceleration.y = accelForce end
    if (love.keyboard.isDown('d')) then self.acceleration.x = accelForce end

    self.velocity.x = self.velocity.x + self.acceleration.x
    self.velocity.y = self.velocity.y + self.acceleration.y

    if (self.velocity.x > maxSpeed) then self.velocity.x = maxSpeed end
    if (self.velocity.x < -maxSpeed) then self.velocity.x = -maxSpeed end
    if (self.velocity.y > maxSpeed) then self.velocity.y = maxSpeed end
    if (self.velocity.y < -maxSpeed) then self.velocity.y = -maxSpeed end


    self.center.x = self.center.x + self.velocity.x
    self.center.y = self.center.y + self.velocity.y
end

return Ball