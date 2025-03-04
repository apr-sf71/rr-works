-- w5.lua 
-- design function to move disk

module(..., package.seeall)

local towers = {}

towers["t1"] = {}
towers["t2"] = {}
towers["t3"] = {}

local function towerStart()
	towers["t1"] = {3, 2, 1}
	towers["t2"] = {}
	towers["t3"] = {}
end

local function moveDiskFromTo(diskNo,fromTower, toTower)

	if (fromTower[#fromTower] ~= diskNo) then
		return false
	end
	if((toTower[#toTower] or 99) < diskNo) then
		return false
	end
	toTower[#toTower+1] = diskNo
	fromTower[#fromTower] = nil
	return true

end
	


run = function()
	WorkPad1:setText("start is on worktable 1-3")
	WorkPad2:setText("move1 is on worktable 4-6")
	
	towerStart()
	for i=1,3 do
		WorkTable[i]:setText("start tower ".. i .. " contain " .. 
			(towers["t"..i][1] or " ") ..",".. 
			(towers["t"..i][2] or " ") ..",".. 
			(towers["t"..i][3] or " ") )
	end
	
	moveDiskFromTo(1, towers["t1"], towers["t3"])
	for i=1,3 do
		WorkTable[i+3]:setText("move 1 tower ".. i .. " contain " .. 
			(towers["t"..i][1] or " ") ..",".. 
			(towers["t"..i][2] or " ")..",".. 
			(towers["t"..i][3] or " ") )
	end
	
	moveDiskFromTo(2, towers["t1"], towers["t2"])
	for i=1,3 do
		WorkTable[i+6]:setText("move 2 tower ".. i .. " contain " .. 
			(towers["t"..i][1] or " ") ..",".. 
			(towers["t"..i][2] or " ")..",".. 
			(towers["t"..i][3] or " ") )
	end
end