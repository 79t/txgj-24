
window = {
    width = 800,
    height = 600,
    margin = 100,
    tileSpace = {
        topLeft = {
            x = 100, y = 0
        },
        size = {
            x = 600, y = 600
        }
    }
}

-- world = {
--     levelFile = love.filesystem.read("assets/testLevel.txt"),
--     size = {x = 16, y = 16},
--     tileSize = {
--         x = 37.5, y = 37.5 --height/size
--     },
--     tileMap = {}
-- }

function IsBetween(target, lower, upper)
    return target > lower and target < upper
end

function IsWithin(point1, point2, minDist)
    return (math.abs(point1-point2)) < minDist
end