Grid = Object:extend()

function Grid:new(pos)
    self.pos = pos
    self.triangles = {}
    self.scale = 0.2
    self.xTriangles = 15 --double
    self.yTriangles = 35 --double
    self.zValue = {}
    self.xOffset = 0
    self.yOffset = 0
    self.xSpeed = 0
    self.ySpeed = 0
end

function Grid:update()
    --set zValue
    self.yOffset = self.ySpeed
    for y = 1, self.yTriangles + 1 do
        self.zValue[y] = {}
        self.xOffset = self.xSpeed
        for x = 1, self.xTriangles + 1 do
            self.zValue[y][x] =  translate(love.math.noise(self.xOffset,self.yOffset), 0, 1, 0, 0.6)
            self.xOffset = self.xOffset + 0.18
        end
        self.yOffset = self.yOffset + 0.18
    end

    self.triangles = {}
    for y = 1, self.yTriangles do
        for x = 1, self.xTriangles do
            table.insert(
                self.triangles,
                Triangle(
                    self.pos:getRelative(x * self.scale, y * self.scale, self.zValue[y][x]),
                    self.pos:getRelative(x * self.scale, (y + 1) * self.scale, self.zValue[y + 1][x]),
                    self.pos:getRelative((x + 1) * self.scale, y * self.scale, self.zValue[y][x + 1])
                )
            )
            table.insert(
                self.triangles,
                Triangle(
                    self.pos:getRelative(x * self.scale, (y + 1) * self.scale, self.zValue[y + 1][x]),
                    self.pos:getRelative((x + 1) * self.scale, (y + 1) * self.scale, self.zValue[y + 1][x + 1]),
                    self.pos:getRelative((x + 1) * self.scale, y * self.scale, self.zValue[y][x + 1])
                )
            )
        end
    end
end
