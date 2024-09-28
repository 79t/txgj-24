function IsBetween(target, lower, upper)
    return target > lower and target < upper
end

function IsWithin(point1, point2, minDist)
    return (math.abs(point1-point2)) < minDist
end