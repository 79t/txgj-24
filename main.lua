Object = require "classic"
require "tile"
require "floorTile"
require "wallTile"
require "startTile"
require "endTile"
require "hazardTile"

-- mywindow = {}

-- myworld = {}

myworld = {
    levelFile = love.filesystem.read("assets/level0.txt"),
    tileMap = {}
}

mywindow = {
    margin = 100,
    tileSpace = {
        topLeft = {x = 125, y = 0},
        size = {x = 600, y = 600}
    }
}


function love.load()


    local yCounter = 0
    for line in myworld.levelFile:gmatch '%S+' do
        yCounter = yCounter + 1
        local xCounter = 0
        for ch in line:gmatch '[^.]+' do --I hate this sm
            xCounter = xCounter + 1
            if ch == "W" then
                local tile = WallTile(xCounter, yCounter)
                table.insert(myworld.tileMap, tile)
            elseif ch == "F" then
                local tile = FloorTile(xCounter, yCounter)
                table.insert(myworld.tileMap, tile)
            elseif ch == "H" then
                local tile = HazardTile(xCounter, yCounter)
                table.insert(myworld.tileMap, tile)
            elseif ch == "E" then
                local tile = EndTile(xCounter, yCounter)
                table.insert(myworld.tileMap, tile)
            elseif ch == "S" then
                local tile = StartTile(xCounter, yCounter)
                table.insert(myworld.tileMap, tile)
            end
        end
    end

    print(myworld.tileMap)
end

function love.draw()
   Tile = require "tile" 
   love.graphics.rectangle("fill", mywindow.margin, 0, mywindow.tileSpace.size.x, mywindow.tileSpace.size.y)
   local index = 0
   while index < #myworld.tileMap do
    index = index+1
    local myTile = myworld.tileMap[index]
    love.graphics.draw(myTile.image, myTile.topLeft.x, myTile.topLeft.y, 0, Tile.scaleFactor, Tile.scaleFactor)
   end
end