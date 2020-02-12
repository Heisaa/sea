Position = Object:extend()

function Position:new(x, y, z)
    self.x = x
    self.y = y
    self.z = z
end

function Position:getRelative(dx, dy, dz)
    return Position(self.x + dx, self.y + dy, self.z + dz)
end