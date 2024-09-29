local LevelThree = {}

Object = require "classic"
require "tile"
require "floorTile"
require "wallTile"
require "startTile"
require "endTile"
require "hazardTile"



local Ball = require "ball"
local ForceFieldNS = require "forceFieldNS"
ball = Ball()
forceFieldNS = ForceFieldNS()
music = love.audio.newSource("assets/1-draft1.mp3", "stream")


local World = require "world"
local ww = World("level3.txt")


function LevelThree:enter()
    print("Going into gamestate 3")
    music:setVolume(.5)

   ball.center = {
        x = ball.startPos.x,
        y = ball.startPos.y
    }
    ball.acceleration = { x = 0, y = 0 }
    ball.velocity = { x = .001, y = .001 }
end


function LevelThree:draw()
   love.graphics.rectangle("fill", window.margin, 0, window.tileSpace.size.x, window.tileSpace.size.y)
   ww:draw()

   love.graphics.draw(ball.image, ball.topLeft.x, ball.topLeft.y, 0, Ball.scaleFactor, Ball.scaleFactor)
   love.graphics.draw(forceFieldNS.image, forceFieldNS.topLeft.x, forceFieldNS.topLeft.y)
   love.graphics.draw(forceFieldNS.image2, forceFieldNS.topLeft2.x, forceFieldNS.topLeft2.y)
end

function LevelThree:update()
    local index = 0
    while index < #ww.tileMap do
        index = index + 1
        ---@type Tile
        local tile = ww.tileMap[index]
        tile:checkCollision(ball)
    end
    ball:updateMovement()
    ball:updatePos()
    forceFieldNS:updateMovement()
    if not music:isPlaying( ) then
		love.audio.play( music )
	end
end
return LevelThree