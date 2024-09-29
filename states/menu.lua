local MenuState = {}

local GameStateManager = require "GameStateManager"
local Tutorial = require "states.tutorial"

function MenuState:enter()
    print("Going into menu state") 
end

function MenuState:draw()
    love.graphics.print("Labyrinth game, press ENTER to start", 120, 150)
    love.graphics.rectangle("line", 100, 100, 300, 100)
end

function MenuState:keypressed(key, scancode, isrepeat)
    if key == "return" then
        GameStateManager:setState(Tutorial)
    end
end

function MenuState:mousepressed(x, y, button)
    if (x > 100 and x < 250 and y > 100 and y < 400) then
        GameStateManager:setState(Tutorial)
    end

end


return MenuState