local LevelSelectState = {}

local GameStateManager = require "GameStateManager"
local LevelOne = require "states.level1"
local LevelTwo = require "states.level2"
local LevelThree = require "states.level3"
local Tutorial = require "states.tutorial"

local bg = love.graphics.newImage("assets/WallMenu.png")
local image = love.graphics.newImage("assets/MenuLevels.png")

function LevelSelectState:enter()
    print("going to levelselect")
end

function LevelSelectState:draw()
    love.graphics.draw(bg)
    love.graphics.draw(image)
end

function LevelSelectState:keypressed(key, scancode, isrepeat)
    if key == "0" then
        GameStateManager:setState(Tutorial)
    elseif key == "1" then
        GameStateManager:setState(LevelOne)
    elseif key == "2" then
        GameStateManager:setState(LevelTwo)
    elseif key == "3" then
        GameStateManager:setState(LevelThree)
    end
end

function LevelSelectState:mousepressed(x, y, button)
    if (y > 180 and y < 270) then
        if (x > 170 and x < 248) then
            GameStateManager:setState(Tutorial)
        elseif (x > 298 and x < 375) then
            GameStateManager:setState(LevelOne)
        elseif (x > 425 and x < 503) then
            GameStateManager:setState(LevelTwo)
        elseif (x > 554 and x < 630) then
            GameStateManager:setState(LevelThree)
        end
    end

end

return LevelSelectState