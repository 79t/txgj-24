---@class World
---@field levelFile string
---@field size {x: number, y: number}
---@field tileSize {width: number, height: number}
---@field tileMap Tile[][]
world = {
    levelFile = love.filesystem.read("assets/level0.txt"),
    size = {x = 16, y = 16},
    tileSize = {
        width = 37.5, height = 37.5 --height/size
    },
    tileMap = {},
    startPos = {x = 0, y = 0}
}