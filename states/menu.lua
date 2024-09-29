local MenuState = {}

local GameStateManager = require "GameStateManager"
local Tutorial = require "states.tutorial"
local LevelSelectState = require "states.levelSelect"

function MenuState:enter()
    print("Going into menu state") 
end

function MenuState:draw()
    love.graphics.print("Labyrinth game, press ENTER to start", 120, 150)
    love.graphics.rectangle("line", 100, 100, 300, 100)
    love.graphics.print("press b to go back to the main menu at any time", 120, 200)
end

function MenuState:keypressed(key, scancode, isrepeat)
    if key == "return" then
        GameStateManager:setState(LevelSelectState)
    end
end

function MenuState:mousepressed(x, y, button)
    if (x > 100 and x < 250 and y > 100 and y < 400) then
        GameStateManager:setState(LevelSelectState)
    end

end


return MenuState