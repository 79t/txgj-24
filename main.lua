Object = require "classic"
require "tile"
require "floorTile"
require "wallTile"
require "startTile"
require "endTile"
require "hazardTile"



local Ball = require "ball"
local ball

require "world"


function love.load()

    local FloorTile = require "floorTile"
    local WallTile = require "wallTile"
    local HazardTile = require "hazardTile"
    local EndTile = require "endTile"
    local StartTile = require "startTile"
    ball = Ball()

    local yCounter = 0
    for line in world.levelFile:gmatch '%S+' do
        yCounter = yCounter + 1
        local xCounter = 0
        for ch in line:gmatch '[^.]+' do --I hate this sm
            xCounter = xCounter + 1
            local tile = nil
            if ch == "W" then
                tile = WallTile(xCounter, yCounter)
            elseif ch == "F" then
                tile = FloorTile(xCounter, yCounter)
            elseif ch == "H" then
                tile = HazardTile(xCounter, yCounter)
            elseif ch == "E" then
                tile = EndTile(xCounter, yCounter)
            elseif ch == "S" then
                tile = StartTile(xCounter, yCounter)
            end
            table.insert(world.tileMap, tile)
        end
    end

end

function love.draw()
   Tile = require "tile" 
   love.graphics.rectangle("fill", window.margin, 0, window.tileSpace.size.x, window.tileSpace.size.y)
   local index = 0
   while index < #world.tileMap do
    index = index+1
    local myTile = world.tileMap[index]
    love.graphics.draw(myTile.image, myTile.topLeft.x, myTile.topLeft.y, 0, Tile.scaleFactor, Tile.scaleFactor)
   end

   love.graphics.draw(ball.image, ball.topLeft.x, ball.topLeft.y, 0, Ball.scaleFactor, Ball.scaleFactor)
end

function love.update()
    ball:updateMovement()
    ball:updatePos()
    local index = 0
    while index < #world.tileMap do
        index = index + 1
        local tile = world.tileMap[index]
        tile:checkCollision(ball)
    end
    -- if not music:isPlaying( ) then
	-- 	love.audio.play( music )
	-- end
end