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
    ball = Ball()

    local yCounter = 0
    for line in world.levelFile:gmatch '%S+' do
        yCounter = yCounter + 1
        local xCounter = 0
        for ch in line:gmatch '[^.]+' do --I hate this sm
            xCounter = xCounter + 1
            if ch == "W" then
                local tile = WallTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            elseif ch == "F" then
                local tile = FloorTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            elseif ch == "H" then
                local tile = HazardTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            elseif ch == "E" then
                local tile = EndTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            elseif ch == "S" then
                local tile = StartTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            end
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
    local index = 0
    while index < #world.tileMap do
        index = index + 1
        ---@type Tile
        local tile = world.tileMap[index]
        -- print(ball)
        tile:checkCollision(ball)
    end
    ball:updateMovement()
    ball:updatePos()
    -- if not music:isPlaying( ) then
	-- 	love.audio.play( music )
	-- end
end