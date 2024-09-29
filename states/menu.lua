local MenuState = {}

local GameStateManager = require "GameStateManager"
local GameState = require "states.game"

function MenuState:enter()
    print("Going into menu state") 
end

function MenuState:draw()
    love.graphics.print("Labyrinth game, press ENTER to start", 100, 100)
end

function MenuState:keypressed(key, scancode, isrepeat)
    if key == "return" then
        GameStateManager:setState(GameState)
    end
end


return MenuState