if arg[2] == "debug" then
    require("lldebugger").start()
end

local window, world, ball, dt, accelForce, maxSpeed, music
Object = require "classic"
require "tile"
require "floorTile"

function love.load()

    Object = require "classic"
    require "tile"
    require "floorTile"

    -- instantiate stuff here
    music = love.audio.newSource("assets/1-draft1.mp3", "stream")
    dt = 60
    window = {
        minWinWidth = 800,
        minWinHeight = 600,
        winWidth = 0,
        winHeight = 0,
        margin = 125,
        tileSpace = {
            topLeft = {
                x = 1, y = 1
            },
            size = {
                x = 1, y = 1
            }
        },
    }
    
    love.window.setMode( window.minWinWidth, window.minWinHeight)
    window.winWidth = window.minWinWidth
    window.winHeight = window.minWinHeight
    window.margin = (window.winWidth - window.winHeight)/2
    window.tileSpace = {
        topLeft = {x = window.margin, y = 0},
        size = {x = window.winHeight, y = window.winHeight}
    }

    world = {
        levelFile = love.filesystem.read("assets/testLevel.txt"),
        size = {x = 16, y = 16},
        tileSize = {width = 0, height = 0},
        tileMap = {}
    }
    world.tileSize = {width = window.winHeight/world.size.x, height = window.winHeight/world.size.y}
    local yCounter = 0
    for line in world.levelFile:gmatch '%S+' do
        yCounter = yCounter + 1
        local xCounter = 0
        for ch in line:gmatch '[^.]+' do --I hate this sm
            xCounter = xCounter + 1
            -- local nImage = "assets/wallTile.png"
            -- local nTileType = "wall"
            -- local nCollision = false
            if ch == "W" then
                -- nImage = "assets/wallTile.png"
                -- nTileType = "wall"
                -- nCollision = true
                local tile = WallTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            elseif ch == "F" then
                -- nImage = "assets/floorTile.png"
                -- nTileType = "floor"
                local tile = FloorTile(xCounter, yCounter)
                table.insert(world.tileMap, tile)
            end
            -- local tile = {
            --     collision = nCollision,
            --     scaleFactor = .5859,
            --     gameCoordinate = {x = xCounter, y = yCounter},
            --     center = {x = 0, y = 0},
            --     topLeft = {x = 0, y = 0},
            --     image = love.graphics.newImage(nImage),
            --     tileType = nTileType
            -- }
            -- tile.topLeft = {
            --     x = window.margin + ((tile.gameCoordinate.x - 1) * world.tileSize.width),
            --     y = (tile.gameCoordinate.y - 1) * world.tileSize.height
            -- }
            -- tile.center = {
            --     x = tile.topLeft.x + world.tileSize.width/2,
            --     y = tile.topLeft.y + world.tileSize.height/2
            -- }
            -- table.insert(world.tileMap, tile)
        end
    end
    

    accelForce = .1
    maxSpeed = 10
    ball = {
        center = {x = 200/2, y = 200/2},
        velocity = {x = -.01, y = -.01},
        acceleration = {x = 0, y = 0},
        imageSize = {width = 128, height = 128},
        scaleFactor = .25,
        trueSize = {width = 0, height = 0},
        topLeft = {x = 0, y = 0},
        image = love.graphics.newImage("assets/Chaser_Red_Circle.png")
    }
    ball.center = {
        x = window.winWidth/2,
        y = window.winHeight/2
    }
    ball.trueSize = {
        width = ball.imageSize.width*ball.scaleFactor, 
        height = ball.imageSize.height*ball.scaleFactor
    }
    ball.topLeft = {
        x = ball.center.x - ball.trueSize.width/2, 
        y = ball.center.y - ball.trueSize.height/2
    }
end

function love.update()
    UpdateMovement(ball)
    UpdatePosition(ball)
    local index = 0
    while index < #world.tileMap do
        index = index + 1
        local tile = world.tileMap[index]
        CheckCollision(tile)
    end
    if not music:isPlaying( ) then
		love.audio.play( music )
	end
end


function love.draw()
    require "floorTile"
    Tile = require "tile" 
    love.graphics.rectangle("fill", window.margin, 0, window.tileSpace.size.x, window.tileSpace.size.y)
    local index = 0
    while index < #world.tileMap do
        index = index + 1
        local tile = world.tileMap[index]
        love.graphics.draw(tile.image, tile.topLeft.x, tile.topLeft.y, 0, Tile.scaleFactor, Tile.scaleFactor)
    end
    --love.graphics.print(#world.tileMap)
    love.graphics.draw(ball.image, ball.topLeft.x, ball.topLeft.y, 0, ball.scaleFactor, ball.scaleFactor)
    local testFt = FloorTile(5, 5)
    -- love.graphics.draw(testFt.actualImageFile, testFt.topLeft.x, testFt.topLeft.y, 0, Tile.scaleFactor)

end

function UpdateMovement (ballObj)
    if (love.keyboard.isDown('w')) then ballObj.acceleration.y = -accelForce end
    if (love.keyboard.isDown('a')) then ballObj.acceleration.x = -accelForce end
    if (love.keyboard.isDown('s')) then ballObj.acceleration.y = accelForce end
    if (love.keyboard.isDown('d')) then ballObj.acceleration.x = accelForce end

    ballObj.velocity.x = ballObj.velocity.x + ballObj.acceleration.x
    ballObj.velocity.y = ballObj.velocity.y + ballObj.acceleration.y

    if (ballObj.velocity.x > maxSpeed) then ballObj.velocity.x = maxSpeed end
    if (ballObj.velocity.x < -maxSpeed) then ballObj.velocity.x = -maxSpeed end
    if (ballObj.velocity.y > maxSpeed) then ballObj.velocity.y = maxSpeed end
    if (ballObj.velocity.y < -maxSpeed) then ballObj.velocity.y = -maxSpeed end


    ballObj.center.x = ballObj.center.x + ballObj.velocity.x
    ballObj.center.y = ballObj.center.y + ballObj.velocity.y

end

function UpdatePosition (obj)
    obj.topLeft = {x = obj.center.x - obj.trueSize.width/2, y = obj.center.y - obj.trueSize.height/2}
end

function CheckCollision(tile)
    if tile.collision == false then
        return false
    end

    local left, right, top, bottom
    left = tile.topLeft.x
    top = tile.topLeft.y
    right = tile.topLeft.x + world.tileSize.width
    bottom = tile.topLeft.y + world.tileSize.height

    if (IsBetween(ball.center.x, left, right)) then
        if (IsWithin(ball.center.y, top, ball.trueSize.height/2)) then
            ball.velocity.y = -math.abs(ball.velocity.y)*.9
            return true
        elseif (IsWithin(ball.center.y, bottom, ball.trueSize.height/2)) then
            ball.velocity.y = math.abs(ball.velocity.y)*.9
            return true
        end
    elseif (IsBetween(ball.center.y, top, bottom)) then
        if (IsWithin(ball.center.x, left, ball.trueSize.width/2)) then
            ball.velocity.x = -math.abs(ball.velocity.x)*.9
            return true
        elseif (IsWithin(ball.center.x, right, ball.trueSize.width/2)) then
            ball.velocity.x = math.abs(ball.velocity.x)*.9
            return true
        end
    end
    return false
end

function IsBetween(target, lower, upper)
    return target > lower and target < upper
end

function IsWithin(point1, point2, minDist)
    return (math.abs(point1-point2)) < minDist
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end