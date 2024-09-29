local LevelSelectState = {}

local GameStateManager = require "GameStateManager"
local LevelOne = require "states.level1"
local LevelTwo = require "states.level2"
local LevelThree = require "states.level3"
local Tutorial = require "states.tutorial"

function LevelSelectState:enter()
    print("going to levelselect")
end

function LevelSelectState:draw()
    love.graphics.setBackgroundColor(0,0,0)
    love.graphics.print("Press 0 for tutorial", 120, 150)
    love.graphics.print("Press 1 for level 1", 120, 170)
    love.graphics.print("Press 2 for level 2", 120, 190)
    love.graphics.print("Press 3 for level 3", 120, 210)
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

return LevelSelectState