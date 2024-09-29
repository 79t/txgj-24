
local Object = require "classic"
require "util"
---@class Ball
---@field center {x: number, y: number}
---@field trueSize {height: number, width: number}
---@field velocity {x: number, y: number}
---@field imageSize {width: number, height: number}
---@field image string
---@field startPos {x: number, y:number}

local Ball = Object:extend()
Ball.scaleFactor = 0.125

local maxSpeed = 3
local accelForce = 0.1

function Ball:new()
    self.center = {x = window.height/2, y=window.height/2}
    self.velocity = {x = -.1, y = -.1}
    self.acceleration = {x = 0, y = 0}
    self.imageSize = {width = 128, height = 128}
    self.image = love.graphics.newImage("assets/egg.png")
    self.trueSize = {
        width = 16,
        height = 16
    }
    self.topLeft = {
        x = 300 - 16,
        y = 300 - 16,
    }
    self.startPos = {x = 0, y = 0}
end

function Ball:updatePos()
    self.topLeft = {
        x = self.center.x - self.trueSize.width/2,
        y = self.center.y - self.trueSize.height/2
    }
end

function Ball:updateMovement()
    if (love.keyboard.isDown(world.keyBind.up)) then self.acceleration.y = -accelForce end
    if (love.keyboard.isDown(world.keyBind.left)) then self.acceleration.x = -accelForce end
    if (love.keyboard.isDown(world.keyBind.down)) then self.acceleration.y = accelForce end
    if (love.keyboard.isDown(world.keyBind.right)) then self.acceleration.x = accelForce end

    self.velocity.x = self.velocity.x + self.acceleration.x
    self.velocity.y = self.velocity.y + self.acceleration.y

    if (self.velocity.x > maxSpeed) then self.velocity.x = maxSpeed end
    if (self.velocity.x < -maxSpeed) then self.velocity.x = -maxSpeed end
    if (self.velocity.y > maxSpeed) then self.velocity.y = maxSpeed end
    if (self.velocity.y < -maxSpeed) then self.velocity.y = -maxSpeed end


    self.center.x = self.center.x + self.velocity.x
    self.center.y = self.center.y + self.velocity.y
end

function Ball:__tostring()
    return "ball: " .. self.topLeft.x .. ", " .. self.topLeft.y
  end

return Ball