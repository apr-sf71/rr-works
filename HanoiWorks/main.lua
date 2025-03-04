-- 
-- Abstract: The hanoi game platform for the tutoring class
--
-- Copyright (C) 2011 Reflexive Rabbit
--
-- based on DragPlatforms sample project
-- 
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

local physics = require("physics")
local hanoiDrag = require("hanoiDrag")

local function setup()
	physics.start()

	display.setStatusBar( display.HiddenStatusBar )

	local background = display.newImage( "bkg_bricks.png", true )
	background.x = display.contentWidth / 2
	background.y = display.contentHeight / 2

	local ground = display.newImage( "floor.png" )
	ground.x = 240; ground.y = 320
	physics.addBody( ground, "static", { friction=0.6 } )

	local sticks = {}
	for i=1,3 do
		sticks[i] = display.newImage( "stick.png" )
		sticks[i].x = 80+160*(i-1); sticks[i].y = 142
		physics.addBody( sticks[i], "static", { isSensor = true  } )
	
		sticks[i].collision = hanoiDrag.stickCollision
		sticks[i]:addEventListener( "collision", sticks[i] )
		sticks[i].myName = "stick"..i
	end
	
	local plate = display.newImage( "plate.png" )
	plate.x = 80; plate.y = 200
	physics.addBody( plate, { density=1.0, bounce=0.3 } )
	plate.isFixedRotation = true 
	plate.myName = "plate"

	local plate2 = display.newImage( "plate2.png" )
	plate2.x = 80; plate.y = 200
	physics.addBody( plate2, { density=1.0, bounce=0.3 } )
	plate2.isFixedRotation = true 
	plate2.myName = "plate2"

	local plate3 = display.newImage( "plate3.png" )
	plate3.x = 80; plate.y = 200
	physics.addBody( plate3, { density=1.0, bounce=0.3 } )
	plate3.isFixedRotation = true 
	plate3.myName = "plate3"



	-- Add touch event listeners to objects
	plate:addEventListener( "touch", hanoiDrag.startDrag )
	plate2:addEventListener( "touch", hanoiDrag.startDrag )
	plate3:addEventListener( "touch", hanoiDrag.startDrag )
end

setup()


