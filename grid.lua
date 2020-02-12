Grid = Object:extend()

function Grid:new(pos)
    self.triangles = {}
    self.scale = 0.2
    self.xTriangles = 20 --double
    self.yTriangles = 20 --double
    self.zValue = {}

    --set zValue
    for y = 1, self.yTriangles + 1 do
        self.zValue[y] = {}
        for x = 1, self.xTriangles + 1 do
            self.zValue[y][x] =  love.math.random() * 0.1
        end
    end

    for y = 1, self.yTriangles do
        for x = 1, self.xTriangles do
            table.insert(
                self.triangles,
                Triangle(
                    pos:getRelative(x * self.scale, y * self.scale, self.zValue[y][x]),
                    pos:getRelative(x * self.scale, (y + 1) * self.scale, self.zValue[y + 1][x]),
                    pos:getRelative((x + 1) * self.scale, y * self.scale, self.zValue[y][x + 1])
                )
            )
            table.insert(
                self.triangles,
                Triangle(
                    pos:getRelative(x * self.scale, (y + 1) * self.scale, self.zValue[y + 1][x]),
                    pos:getRelative((x + 1) * self.scale, (y + 1) * self.scale, self.zValue[y + 1][x + 1]),
                    pos:getRelative((x + 1) * self.scale, y * self.scale, self.zValue[y][x + 1])
                )
            )
        end
    end
end
