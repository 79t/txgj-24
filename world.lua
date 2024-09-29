---@class World
---@field levelFile string
---@field size {x: number, y: number}
---@field tileSize {width: number, height: number}
---@field tileMap Tile[][]
world = {
    levelFile = love.filesystem.read("assets/level0_c.txt"),
    size = {x = 16, y = 16},
    tileSize = {
        -- width = 37.5, height = 37.5 --height/size
        width = 18.75, height = 18.75
    },
    tileMap = {},
    startPos = {x = 0, y = 0}
}