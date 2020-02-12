function love.load()
	Object = require("classic")
	require "wire"
	require "position"
	require "cube"
	require "grid"
	require "triangle"

	camPosition = Position(0,0,0)
	rotationY = 0.5
	Fov = math.pi/2

	grid = Grid(Position(2,-2.5,-3))
end

function love.update(dt)
	
end

function love.draw()
	love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 680, 0)

	for i = 1, #grid.triangles do 
		local camPosStart = toCamCoords(grid.triangles[i].start)
		local camPosMid = toCamCoords(grid.triangles[i].mid)
		local camPosStop = toCamCoords(grid.triangles[i].stop)
		
		local drawStart = pointOnCanvas(camPosStart)
		local drawMid = pointOnCanvas(camPosMid)
		local drawEnd = pointOnCanvas(camPosStop)

		love.graphics.polygon(
			"line",
			drawStart.x,
			drawStart.y,
			drawMid.x,
			drawMid.y,
			drawEnd.x,
			drawEnd.y
		)
	end
end

function pointOnCanvas(pos)
	local angleH = math.atan2(pos.y, pos.x)
	local angleV = math.atan2(pos.z, pos.x)

	angleH = angleH / math.abs(math.cos(angleH))
	angleV = angleV / math.abs(math.cos(angleV))

	local x = (love.graphics.getWidth() / 2) - (angleH * love.graphics.getWidth() / Fov)
	local y = (love.graphics.getHeight() / 2) - (angleV * love.graphics.getWidth() / Fov)

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
	rPos.x = rx * math.cos(-rotationY) + rz * math.sin(-rotationY)
	rPos.z = rz * math.cos(-rotationY) - rx * math.sin(-rotationY)

	return rPos
end