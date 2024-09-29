local GameStateManager = require "GameStateManager"
local WinState = {}

function WinState:draw()
    love.graphics.print("You win!!!! Press M to go to the main menu", 100, 150)
end

function WinState:keypressed(key, scancode, isrepeat)
    if key == "m" then
        GameStateManager:setState(mainMenu)
    end
end

return WinState