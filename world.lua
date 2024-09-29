---@class World
---@field levelFile string
---@field size {x: number, y: number}
---@field tileSize {width: number, height: number}
---@field tileMap Tile[][]
-- world = {
--     levelFile = love.filesystem.read("assets/level0.txt"),
--     size = {x = 32, y = 32},
--     tileSize = {
--         -- width = 37.5, height = 37.5 --height/size
--         width = 18.75, height = 18.75
--     },
--     tileMap = {},
--     startPos = {x = 0, y = 0},
--     keyBind = {
--         up = 'w',
--         down = 's',
--         left = 'j',
--         right = 'l'
--     }
-- }

local Object = require "classic"

local World = Object:extend()
-- require "tile"
require "floorTile"
require "wallTile"
require "startTile"
require "endTile"
require "util"
require "hazardTile"

function World:new(levelfile)
    local FloorTile = require "floorTile"
    local WallTile = require "wallTile"
    self.levelFile = love.filesystem.read("assets/" .. levelfile)
    self.size = {x=32, y=32}
    self.tileSize = {
        width = 18.75, height=18.75
    }
    self.tileMap = {}
    self.startPos = {x = 0, y = 0}
    self.keyBind = {
        up = 'w',
        down = 's',
        left = 'j',
        right = 'l'
    }
    local yCounter = 0
    for line in self.levelFile:gmatch '%S+' do
        yCounter = yCounter + 1
        local xCounter = 0
        for ch in line:gmatch '.' do --I hate this sm
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
                ball.startPos = {
                    x = tile.topLeft.x,
                    y = tile.topLeft.y
                }
            end
            table.insert(self.tileMap, tile)
        end
    end
end

function World:draw()
    local Tile = require "tile"
    local index = 0
    while index < #self.tileMap do
     index = index+1
     local myTile = self.tileMap[index]
     love.graphics.draw(myTile.image, myTile.topLeft.x, myTile.topLeft.y, 0, Tile.scaleFactor, Tile.scaleFactor)
    end
end

return World