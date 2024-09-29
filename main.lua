if arg[2] == "debug" then
    require("lldebugger").start()
end


Object = require "classic"
require "tile"
require "floorTile"
require "wallTile"
require "startTile"
require "endTile"
require "hazardTile"
require "world"



-- local Ball = require "ball"
-- local ForceFieldNS = require "forceFieldNS"
-- local ball, forceFieldNS, music

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

-- require "world"


-- function love.load()

--     local FloorTile = require "floorTile"
--     local WallTile = require "wallTile"
--     ball = Ball()
--     forceFieldNS = ForceFieldNS()
--     music = love.audio.newSource("assets/1-draft1.mp3", "stream")
--     music:setVolume(.5)

--     local yCounter = 0
--     for line in world.levelFile:gmatch '%S+' do
--         yCounter = yCounter + 1
--         local xCounter = 0
--         for ch in line:gmatch '.' do --I hate this sm
--             xCounter = xCounter + 1
--             local tile = nil
--             if ch == "W" then
--                 tile = WallTile(xCounter, yCounter)
--             elseif ch == "F" then
--                 tile = FloorTile(xCounter, yCounter)
--             elseif ch == "H" then
--                 tile = HazardTile(xCounter, yCounter)
--             elseif ch == "E" then
--                 tile = EndTile(xCounter, yCounter)
--             elseif ch == "S" then
--                 tile = StartTile(xCounter, yCounter)
--                 ball.startPos = {
--                     x = tile.topLeft.x,
--                     y = tile.topLeft.y
--                 }
--             end
--             table.insert(world.tileMap, tile)
--         end
--     end
--     ball.center = {
--         x = ball.startPos.x,
--         y = ball.startPos.y
--     }

-- end

-- function love.draw()
--    Tile = require "tile" 
--    love.graphics.rectangle("fill", window.margin, 0, window.tileSpace.size.x, window.tileSpace.size.y)
--    local index = 0
--    while index < #world.tileMap do
--     index = index+1
--     local myTile = world.tileMap[index]
--     love.graphics.draw(myTile.image, myTile.topLeft.x, myTile.topLeft.y, 0, Tile.scaleFactor, Tile.scaleFactor)
--    end

--    love.graphics.draw(ball.image, ball.topLeft.x, ball.topLeft.y, 0, Ball.scaleFactor, Ball.scaleFactor)
--    love.graphics.draw(forceFieldNS.image, forceFieldNS.topLeft.x, forceFieldNS.topLeft.y)
--    love.graphics.draw(forceFieldNS.image2, forceFieldNS.topLeft2.x, forceFieldNS.topLeft2.y)
-- end

-- function love.update()
--     local index = 0
--     while index < #world.tileMap do
--         index = index + 1
--         ---@type Tile
--         local tile = world.tileMap[index]
--         tile:checkCollision(ball)
--     end
--     ball:updateMovement()
--     ball:updatePos()
--     forceFieldNS:updateMovement()
--     if not music:isPlaying( ) then
-- 		love.audio.play( music )
-- 	end
-- end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end