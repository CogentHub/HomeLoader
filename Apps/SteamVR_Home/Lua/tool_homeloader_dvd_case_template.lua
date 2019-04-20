

local turnedOn = false
local lightEnt = nil
local controller = nil
local currentPlayer = nil
local handID = 0
local handAttachment = nil
local pickupTime = 0
local PICKUP_TRIGGER_DELAY = 0.2

local lightKeyvals = {
	classname = "light_spot";
	targetname = "flashlight_light";
	enabled = 0;
	color = "209 192 184 255";
	brightness = 4;
	range = 3000;
	indirectlight = 0;
	attenuation1 = 0.3;
	attenuation2 = 0;
	falloff = 10;
	innerconeangle = 15;
	outerconeangle = 230;
	castshadows = 1;
	lightcookie = "flashlight";
}

function Precache(context)
	PrecacheSoundFile("soundevents/soundevents_addon.vsndevts", context)
end

function SetEquipped( self, pHand, nHandID, pHandAttachment, pPlayer )
	handID = nHandID
	controller = pHand
	currentPlayer = pPlayer
	handAttachment = pHandAttachment
	pickupTime = Time()
	
	print("SetEquipped")
	
	if lightEnt == nil
	then
		lightEnt = SpawnEntityFromTableSynchronous(lightKeyvals.classname, lightKeyvals)
		
	end	
	lightEnt:SetParent(handAttachment, "light")
	lightEnt:SetLocalOrigin(Vector(0,0,0))
	lightEnt:SetLocalAngles(0, 0, 0)
	
	if turnedOn
	then
		DoEntFireByInstanceHandle(handAttachment, "Skin", "1", 0 , nil, nil)
	end
	
	local paintColor = thisEntity:GetRenderColor()
	handAttachment:SetRenderColor(paintColor.x, paintColor.y, paintColor.z)
	
	return true
end

function SetUnequipped()

	local paintColor = handAttachment:GetRenderColor()
	thisEntity:SetRenderColor(paintColor.x, paintColor.y, paintColor.z)

	if lightEnt ~= nil 
	then
		lightEnt:SetParent(thisEntity, "light")
	end

	return true
end

function OnHandleInput(input)

	local nIN_TRIGGER = IN_USE_HAND1; if (handID == 0) then nIN_TRIGGER = IN_USE_HAND0 end;
	local nIN_GRIP = IN_GRIP_HAND1; if (handID == 0) then nIN_GRIP = IN_GRIP_HAND0 end;
	
	if input.buttonsPressed:IsBitSet(nIN_TRIGGER)
	then
		input.buttonsPressed:ClearBit(nIN_TRIGGER)
		if Time() > pickupTime + PICKUP_TRIGGER_DELAY
		then
			OnTriggerPressed(self)
		end
	end
	
	-- Catch the unpress even, so you don't drop the tool.
	if input.buttonsReleased:IsBitSet(nIN_TRIGGER) 
	then
		input.buttonsReleased:ClearBit(nIN_TRIGGER)
	end
	
	if input.buttonsReleased:IsBitSet(nIN_GRIP)
	then
		input.buttonsReleased:ClearBit(nIN_GRIP)
		thisEntity:ForceDropTool();
	end

	return input;
end


