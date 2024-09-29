
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

worldCfg = {
    size = {x=32, y=32},
    tileSize = {
        width = 18.75, height=18.75
    },
    keyBind = {
        up = 'w',
        down = 's',
        left = 'j',
        right = 'l'
    }
}

function IsBetween(target, lower, upper)
    return target > lower and target < upper
end

function IsWithin(point1, point2, minDist)
    return (math.abs(point1-point2)) < minDist
end

function inBtwn(low, mid, up)
    return low<mid and mid<up
end

function isWithin(point1, point2, minDiff)
    return math.abs(point1 - point2) < minDiff
end