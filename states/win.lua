local WinState = {}

function WinState:draw()
    love.graphics.print("You win!!!! Press M to go to levelselect", 100, 150)
end

return WinState