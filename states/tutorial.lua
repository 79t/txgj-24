local TutorialState = {}

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
ww = World("level0.txt")


function TutorialState:enter()
    print("Going into gamestate")
    music:setVolume(.5)

   ball.center = {
        x = ball.startPos.x,
        y = ball.startPos.y
    }
end


function TutorialState:draw()
   love.graphics.rectangle("fill", window.margin, 0, window.tileSpace.size.x, window.tileSpace.size.y)
   ww:draw()

   love.graphics.draw(ball.image, ball.topLeft.x, ball.topLeft.y, 0, Ball.scaleFactor, Ball.scaleFactor)
   love.graphics.draw(forceFieldNS.image, forceFieldNS.topLeft.x, forceFieldNS.topLeft.y)
   love.graphics.draw(forceFieldNS.image2, forceFieldNS.topLeft2.x, forceFieldNS.topLeft2.y)
   love.graphics.print("Player 1: use 'W' and 'S' to activate your North and South forces", 140, 50)
   love.graphics.print("Player 2: use 'J' and 'L' to activate your West and East forces", 140, 70)
   love.graphics.print("Avoid the hazardous spikes as you move your egg", 200, 170)
   love.graphics.print("Return the egg to its nest!", 250, 275)

end

function TutorialState:update()
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
return TutorialState 