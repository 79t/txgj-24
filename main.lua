local levelSelect = require "states.levelSelect"
levelSelect = require "states.levelSelect"
mainMenu = require "states.menu"
winScreen = require "states.win"
music = love.audio.newSource("assets/1-draft1.mp3", "stream")

-- this gets vscode debugger working
if arg[2] == "debug" then
    require("lldebugger").start()
end

local GameStateManager = require "GameStateManager"

local MainMenu = require "states.menu"

local buttonReturn
function love.load()
    music:setVolume(.25)
    GameStateManager:setState(MainMenu)
    buttonReturn = love.graphics.newImage("assets/ButtonReturn.png")

end

function love.update(dt)   
    GameStateManager:update(dt)
    if not music:isPlaying( ) then
		love.audio.play( music )
	end
end

function love.draw()
    GameStateManager:draw()
    love.graphics.draw(buttonReturn, 715, 15, 0, .75, .75)
end

function love.keypressed(key, scancode, isrepeat)
    if key == "b" then
        GameStateManager:setState(MainMenu)
    end
    GameStateManager:keypressed(key, scancode, isrepeat)
end

function love.mousepressed(x, y, button)
    if (x > 700 and x < 800 and y > 0 and y < 100) then
        GameStateManager:setState(MainMenu)
    end
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