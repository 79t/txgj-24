local GameStateManager = require "GameStateManager"
local LevelSelectState = require "states.levelSelect"
local WinState = {}

local bg, image
function WinState:enter()
    print("Going into win state") 
    bg = love.graphics.newImage("assets/WallMenu.png")
    image = love.graphics.newImage("assets/ScreenWin.png")
end

function WinState:draw()
    love.graphics.print("You win!!!! Press M to go to the main menu", 100, 150)
    love.graphics.draw(bg)
    love.graphics.draw(image)
end

function WinState:keypressed(key, scancode, isrepeat)
    if key == "b" then
        GameStateManager:setState(LevelSelectState)
    end
end

function WinState:mousepressed(x, y, button)
    if (y > 320 and y < 480 and x > 215 and x < 360) then
        GameStateManager:setState(LevelSelectState)
    end
end

return WinState