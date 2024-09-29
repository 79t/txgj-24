local MenuState = {}

local GameStateManager = require "GameStateManager"
local Tutorial = require "states.tutorial"
local LevelSelectState = require "states.levelSelect"

local image
function MenuState:enter()
    print("Going into menu state") 
    image = love.graphics.newImage("assets/MenuAssets.png")
end

function MenuState:draw()
    love.graphics.setBackgroundColor(1,1,1)
    love.graphics.draw(image, 0, 0)
end

function MenuState:keypressed(key, scancode, isrepeat)
    if key == "return" then
        GameStateManager:setState(LevelSelectState)
    end
end

function MenuState:mousepressed(x, y, button)
    if (y > 400 and y < 500 and x > 315 and x < 500) then
        GameStateManager:setState(LevelSelectState)
    end

end


return MenuState