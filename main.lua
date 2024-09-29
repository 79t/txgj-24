if arg[2] == "debug" then
    require("lldebugger").start()
end

-- Object = require "classic"
-- require "tile"
-- require "floorTile"
-- require "wallTile"
-- require "startTile"
-- require "endTile"
-- require "hazardTile"
-- require "world"

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
    GameStateManager:keypressed(key, scancode, isrepeat)
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end