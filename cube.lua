Cube = Object:extend()

function Cube:new(pos, size)
    self.size = size
    self.wires = {}
    self.wires[1] = Wire(pos:getRelative(self.size/2, self.size/2, self.size/2), pos:getRelative(-self.size/2, self.size/2, self.size/2))
    self.wires[2] = Wire(pos:getRelative(self.size/2, -self.size/2, self.size/2), pos:getRelative(-self.size/2, -self.size/2, self.size/2))
    self.wires[3] = Wire(pos:getRelative(self.size/2, self.size/2, self.size/2), pos:getRelative(self.size/2, -self.size/2, self.size/2))
    self.wires[4] = Wire(pos:getRelative(-self.size/2, self.size/2, self.size/2), pos:getRelative(-self.size/2, -self.size/2, self.size/2))
    self.wires[5] = Wire(pos:getRelative(self.size/2, self.size/2, -self.size/2), pos:getRelative(-self.size/2, self.size/2, -self.size/2))
    self.wires[6] = Wire(pos:getRelative(self.size/2, -self.size/2, -self.size/2), pos:getRelative(-self.size/2, -self.size/2, -self.size/2))
    self.wires[7] = Wire(pos:getRelative(self.size/2, self.size/2, -self.size/2), pos:getRelative(self.size/2, -self.size/2, -self.size/2))
    self.wires[8] = Wire(pos:getRelative(-self.size/2, self.size/2, -self.size/2), pos:getRelative(-self.size/2, -self.size/2, -self.size/2))
    self.wires[9] = Wire(pos:getRelative(self.size/2, self.size/2, self.size/2), pos:getRelative(self.size/2, self.size/2, -self.size/2))
    self.wires[10] = Wire(pos:getRelative(self.size/2, -self.size/2, self.size/2), pos:getRelative(self.size/2, -self.size/2, -self.size/2))
    self.wires[11] = Wire(pos:getRelative(-self.size/2, -self.size/2, self.size/2), pos:getRelative(-self.size/2, -self.size/2, -self.size/2))
    self.wires[12] = Wire(pos:getRelative(-self.size/2, self.size/2, self.size/2), pos:getRelative(-self.size/2, self.size/2, -self.size/2))
end

function Cube:update(pos)
    self.wires[1] = Wire(pos:getRelative(self.size/2, self.size/2, self.size/2), pos:getRelative(-self.size/2, self.size/2, self.size/2))
    self.wires[2] = Wire(pos:getRelative(self.size/2, -self.size/2, self.size/2), pos:getRelative(-self.size/2, -self.size/2, self.size/2))
    self.wires[3] = Wire(pos:getRelative(self.size/2, self.size/2, self.size/2), pos:getRelative(self.size/2, -self.size/2, self.size/2))
    self.wires[4] = Wire(pos:getRelative(-self.size/2, self.size/2, self.size/2), pos:getRelative(-self.size/2, -self.size/2, self.size/2))
    self.wires[5] = Wire(pos:getRelative(self.size/2, self.size/2, -self.size/2), pos:getRelative(-self.size/2, self.size/2, -self.size/2))
    self.wires[6] = Wire(pos:getRelative(self.size/2, -self.size/2, -self.size/2), pos:getRelative(-self.size/2, -self.size/2, -self.size/2))
    self.wires[7] = Wire(pos:getRelative(self.size/2, self.size/2, -self.size/2), pos:getRelative(self.size/2, -self.size/2, -self.size/2))
    self.wires[8] = Wire(pos:getRelative(-self.size/2, self.size/2, -self.size/2), pos:getRelative(-self.size/2, -self.size/2, -self.size/2))
    self.wires[9] = Wire(pos:getRelative(self.size/2, self.size/2, self.size/2), pos:getRelative(self.size/2, self.size/2, -self.size/2))
    self.wires[10] = Wire(pos:getRelative(self.size/2, -self.size/2, self.size/2), pos:getRelative(self.size/2, -self.size/2, -self.size/2))
    self.wires[11] = Wire(pos:getRelative(-self.size/2, -self.size/2, self.size/2), pos:getRelative(-self.size/2, -self.size/2, -self.size/2))
    self.wires[12] = Wire(pos:getRelative(-self.size/2, self.size/2, self.size/2), pos:getRelative(-self.size/2, self.size/2, -self.size/2))
end

function Cube:draw()
    
end