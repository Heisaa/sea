function love.load()
	Object = require("classic")
	require "wire"
	require "position"
	require "grid"
	require "triangle"

	camPosition = Position(0.81,3.7,4.3)
	rotationY = 1.2
	Fov = math.pi/2

	grid = Grid(Position(0,0,0))
end

function love.update(dt)
	grid:update()
	grid.ySpeed = grid.ySpeed +  0.3 * dt
	grid.xSpeed = grid.xSpeed + translate(math.sin(grid.ySpeed*6), -1, 1, -0.08, 0.08) * dt

end

function love.draw()
	love.graphics.setColor(1,1,1,1)
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 680, 0)

	for i = #grid.triangles, 1, -1 do
		local triangle = grid.triangles[i]
		local camPosStart = toCamCoords(triangle.start)
		local camPosMid = toCamCoords(triangle.mid)
		local camPosStop = toCamCoords(triangle.stop)
		
		local drawStart = pointOnCanvas(camPosStart)
		local drawMid = pointOnCanvas(camPosMid)
		local drawEnd = pointOnCanvas(camPosStop)

		local zAverage = (triangle.start.z + triangle.mid.z + triangle.stop.z) / 3
		local red = translate(zAverage, 0, 1, 0.01, 0.1)
		local green = translate(zAverage, 0, 1, 0.1, 0.4)
		local blue = translate(zAverage, 0, 1, 0.2, 0.5)
		
		love.graphics.setColor(red, green, blue,1)
		
		love.graphics.polygon(
			"fill",
			drawStart.x,
			drawStart.y,
			drawMid.x,
			drawMid.y,
			drawEnd.x,
			drawEnd.y
		)
	end
end

local atan2 = math.atan2
local abs = math.abs
local cos = math.cos
local sin = math.sin
local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

function pointOnCanvas(pos)
	local angleH = atan2(pos.y, pos.x)
	local angleV = atan2(pos.z, pos.x)

	angleH = angleH / abs(cos(angleH))
	angleV = angleV / abs(cos(angleV))

	local x = (width / 2) - (angleH * width / Fov)
	local y = (height / 2) - (angleV * width / Fov)

	return Position(x, y, 0)
end

function toCamCoords(pos)
	local rPos = Position(pos.x - camPosition.x, pos.y - camPosition.y, pos.z - camPosition.z)
	--rotation
	local rx = rPos.x
	local rz = rPos.z

	--y-axis
	rx = rPos.x
	rz = rPos.z
	rPos.x = rx * cos(-rotationY) + rz * sin(-rotationY)
	rPos.z = rz * cos(-rotationY) - rx * sin(-rotationY)

	return rPos
end

function translate(value, leftMin, leftMax, rightMin, rightMax)
    local leftSpan = leftMax - leftMin
    local rightSpan = rightMax - rightMin

    local valueScaled = (value - leftMin) / (leftSpan)

	return rightMin + (valueScaled * rightSpan)
end