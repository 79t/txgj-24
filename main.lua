local levelSelect = require "states.levelSelect"

-- this gets vscode debugger working
if arg[2] == "debug" then
    require("lldebugger").start()
end

local GameStateManager = require "GameStateManager"

local MainMenu = require "states.menu"

function love.load()
    GameStateManager:setState(MainMenu)
end

function love.update(dt)   
    GameStateManager:update(dt)
end

function love.draw()
    GameStateManager:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "b" then
        GameStateManager:setState(MainMenu)
    end
    GameStateManager:keypressed(key, scancode, isrepeat)
end

function love.mousepressed(x, y, button)
    GameStateManager:mousepressed(x, y, button)
end

-- this gets vscode debugger working

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end