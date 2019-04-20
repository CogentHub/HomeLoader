 
CPauseManager = class(
	{
		players = nil;
		thinkEnt = nil;
		spawnItems = ""
	}, 	
	{
		THINK_INTERVAL = 0.02	
	},
	nil
)

function CPauseManager.constructor(self, spawnItems)
	self.spawnItems = spawnItems
	self.players = {}
	self.thinkEnt = SpawnEntityFromTableSynchronous("logic_script", 
		{targetname = "pause_think_ent", vscripts = "player_pause_ent"})
		
	self.spawnItems2 = SPAWN_ITEMS2
	self.players = {}
	self.thinkEnt = SpawnEntityFromTableSynchronous("logic_script", 
		{targetname = "pause_think_ent", vscripts = "player_pause_ent"})
		
	self.spawnItems3 = SPAWN_ITEMS3
	self.players = {}
	self.thinkEnt = SpawnEntityFromTableSynchronous("logic_script", 
		{targetname = "pause_think_ent", vscripts = "player_pause_ent"})
		
	self.spawnItems4 = SPAWN_ITEMS4
	self.players = {}
	self.thinkEnt = SpawnEntityFromTableSynchronous("logic_script", 
		{targetname = "pause_think_ent", vscripts = "player_pause_ent"})
end


function CPauseManager:Init()
	
	self.thinkEnt:GetPrivateScriptScope().EnableThink(self, self.THINK_INTERVAL)
	
	CustomGameEventManager:RegisterListener("pause_panel_spawn_item", self.SpawnItem)
	CustomGameEventManager:RegisterListener("pause_panel_spawn_item_2", self.SpawnItem2)
	CustomGameEventManager:RegisterListener("pause_panel_spawn_item_3", self.SpawnItem3)
	CustomGameEventManager:RegisterListener("pause_panel_spawn_item_4", self.SpawnItem4)

end


function CPauseManager:DoPrecache(context)
	for i, item in ipairs(self.spawnItems) do
	
		PrecacheModel(item.keyvals.model, context)
		
		if item.modelPrecache then
			for j, model in ipairs(item.modelPrecache) do
	
				PrecacheModel(model, context)
			end
		end
		
		if item.particlePrecache then
			for j, particle in ipairs(item.particlePrecache) do
	
				PrecacheParticle(particle, context)
			end
		end
	end
end


function CPauseManager:Think()
	local playerList = Entities:FindAllByClassname("player")

	for _, player in pairs(playerList)
	do
		if not self.players[player] then
			self.players[player] =
			{
				paused = false;
				pausePanel = nil
			}
		end
		
		if self.players[player].paused then
		
			if not (player:IsVRDashboardShowing() or player:IsContentBrowserShowing()) then
				self.players[player].paused = false
				self:Unpause(player)
			end
		else
				
			if player:IsVRDashboardShowing() or player:IsContentBrowserShowing() then
				self.players[player].paused = true
				self:Pause(player)
			end
		
		end 
	end
end

function CPauseManager:Pause(playerEnt)

	if not self.players[playerEnt] then
		self.players[playerEnt] =
		{
			paused = false;
			pausePanel = nil
		}
	end
		
	local angles = QAngle(0, playerEnt:GetHMDAvatar():GetAngles().y, 0)
	
	local keyvals =
	{
		origin = playerEnt:GetHMDAvatar():GetCenter() + 
			RotatePosition(Vector(0,0,0), angles, Vector(70, 0, 32)),
		targetname = "homeloader_menu_panel",
		dialog_layout_name = "file://{resources}/layout/custom_destination/homeloader_menu_panel.xml",
		width = "156.78",
		height = "59",
		panel_dpi = "32",
		interact_distance = "128",
		horizontal_align = "1",
		vertical_align = "1",
		orientation = "0",
		angles = RotateOrientation(angles, QAngle(0, -90, 90))
	}
	self.players[playerEnt].pausePanel = SpawnEntityFromTableSynchronous("point_clientui_world_panel", keyvals)
	
	CustomGameEventManager:Send_ServerToPlayer(playerEnt, "pause_panel_register", 
		{id = playerEnt:GetUserID(), panel = self.players[playerEnt].pausePanel:GetEntityIndex()})
		
	self:PopulateItems(playerEnt, self.players[playerEnt].pausePanel)
end


function CPauseManager:PopulateItems(playerEnt, panel)
	for i, item in ipairs(self.spawnItems) do

			local data =
			{
				item = i,
				img = item.img,
				name = item.name,
				panel = panel:GetEntityIndex()
			}
			-- print(data)
			CustomGameEventManager:Send_ServerToPlayer(playerEnt, "pause_panel_add_item", data)
	end
	
	for i, item in ipairs(self.spawnItems2) do

			local data2 =
			{
				item = i,
				img = item.img,
				name = item.name,
				panel = panel:GetEntityIndex()
			}
			-- print(data2)
			CustomGameEventManager:Send_ServerToPlayer(playerEnt, "pause_panel_add_item_2", data2)
	end
	
	for i, item in ipairs(self.spawnItems3) do

			local data3 =
			{
				item = i,
				img = item.img,
				name = item.name,
				panel = panel:GetEntityIndex()
			}
			-- print(data3)
			CustomGameEventManager:Send_ServerToPlayer(playerEnt, "pause_panel_add_item_3", data3)
	end
	
	for i, item in ipairs(self.spawnItems4) do

			local data4 =
			{
				item = i,
				img = item.img,
				name = item.name,
				panel = panel:GetEntityIndex()
			}
			-- print(data4)
			CustomGameEventManager:Send_ServerToPlayer(playerEnt, "pause_panel_add_item_4", data4)
	end
	
end


function CPauseManager:Unpause(playerEnt)

	if not self.players[playerEnt] then
		self.players[playerEnt] =
		{
			paused = false;
			pausePanel = nil
		}
	end
	
	self.players[playerEnt].pausePanel:Kill()
	self.players[playerEnt].pausePanel = nil

end


function CPauseManager:IsPaused(playerEnt)

	if self.players[playerEnt] then
		return self.players[playerEnt].paused
	end
	return false
end


function CPauseManager:TeleportPlayerStart(data)
	local player = GetPlayerFromUserID(data.id)
	local destination = Entities:FindByName(nil, "teleport_dest")
	if destination then
		CPauseManager:TeleportPlayer(player, destination)
	end	
end


function CPauseManager:TeleportPlayer(player, destination)	
	local manager = g_VRScript.pauseManager --Hack for not having self here
	
	local localPausePanelOrigin = nil
	
	if manager.players[player] and manager.players[player].pausePanel then
		localPausePanelOrigin = manager.players[player].pausePanel:GetOrigin() - player:GetHMDAnchor():GetOrigin()
	end
	
	local localPlayerOrigin = player:GetHMDAnchor():GetOrigin() - player:GetOrigin()

	player:GetHMDAnchor():SetOrigin(destination:GetOrigin() + Vector(0, 0, -32) 
		+ Vector(localPlayerOrigin.x, localPlayerOrigin.y, 0))
		
	if g_VRScript.playerPhysController then
		g_VRScript.playerPhysController:SetVelocity(player, Vector(0,0,0))
	end
	
	EmitSoundOnClient("Slope.UITeleport", player)

	if manager.players[player] and manager.players[player].pausePanel then
		local origin = player:GetHMDAnchor():GetOrigin() + localPausePanelOrigin
		local angles = manager.players[player].pausePanel:GetAngles()
		manager.players[player].pausePanel:Kill()
		
		local keyvals =
	{
		origin = player:GetHMDAnchor():GetOrigin() + localPausePanelOrigin,
		targetname = "homeloader_menu_panel",
		dialog_layout_name = "file://{resources}/layout/custom_destination/homeloader_menu_panel.xml",
		width = "156.78",
		height = "24",
		panel_dpi = "32",
		interact_distance = "128",
		horizontal_align = "1",
		vertical_align = "1",
		orientation = "0",
		angles = angles
	}
	manager.players[player].pausePanel = SpawnEntityFromTableSynchronous("point_clientui_world_panel", keyvals)
	
	CustomGameEventManager:Send_ServerToPlayer(player, "pause_panel_register", 
		{id = player:GetUserID(), panel = manager.players[player].pausePanel:GetEntityIndex()})
	
	manager:PopulateItems(player, manager.players[player].pausePanel)
	end
end


function CPauseManager:SpawnItem(data)
	local player = GetPlayerFromUserID(data.id)
	local panel = EntIndexToHScript(data.panel)
	local manager = g_VRScript.pauseManager --Hack for not having self here
	
	print("Spawning item ID: " .. data.itemID)
	
	local item = manager.spawnItems[data.itemID]
	
	if not IsValidEntity(player) or not IsValidEntity(panel) then
		return
	end
	
	local handID = CPauseManager:GetClosestHandID(player, panel:GetOrigin())
	
	local keyvals = vlua.clone(item.keyvals)

	keyvals.origin = player:GetHMDAvatar():GetVRHand(handID):GetOrigin()
		
	if item.isTool then
		local ent = SpawnEntityFromTableSynchronous("prop_destinations_tool", keyvals)
	
		--player:EquipPropTool(ent, handID)
		EmitSoundOn("default_equip", ent)
	else
		EmitSoundOn("default_equip", ent)
		SpawnEntityFromTableSynchronous("prop_destinations_physics", keyvals)
	end
	
end

function CPauseManager:SpawnItem2(data2)
	local player = GetPlayerFromUserID(data2.id)
	local panel = EntIndexToHScript(data2.panel)
	local manager = g_VRScript.pauseManager --Hack for not having self here
	
	local item = manager.spawnItems2[data2.itemID]
	
	if not IsValidEntity(player) or not IsValidEntity(panel) then
		return
	end
	
	local handID = CPauseManager:GetClosestHandID(player, panel:GetOrigin())
	
	local keyvals = vlua.clone(item.keyvals)

	keyvals.origin = player:GetHMDAvatar():GetVRHand(handID):GetOrigin()
		
	if item.isTool then
		local ent = SpawnEntityFromTableSynchronous("prop_destinations_tool", keyvals)
	
		--player:EquipPropTool(ent, handID)
		EmitSoundOn("default_equip", ent)
	else
		EmitSoundOn("default_equip", ent)
		SpawnEntityFromTableSynchronous("prop_destinations_physics", keyvals)
	end
	
end

function CPauseManager:SpawnItem3(data3)
	local player = GetPlayerFromUserID(data3.id)
	local panel = EntIndexToHScript(data3.panel)
	local manager = g_VRScript.pauseManager --Hack for not having self here
	
	local item = manager.spawnItems3[data3.itemID]
	
	if not IsValidEntity(player) or not IsValidEntity(panel) then
		return
	end
	
	local handID = CPauseManager:GetClosestHandID(player, panel:GetOrigin())
	
	local keyvals = vlua.clone(item.keyvals)

	keyvals.origin = player:GetHMDAvatar():GetVRHand(handID):GetOrigin()
		
	if item.isTool then
		local ent = SpawnEntityFromTableSynchronous("prop_destinations_tool", keyvals)
	
		--player:EquipPropTool(ent, handID)
		EmitSoundOn("default_equip", ent)
	else
		EmitSoundOn("default_equip", ent)
		SpawnEntityFromTableSynchronous("prop_destinations_physics", keyvals)
	end
	
end

function CPauseManager:SpawnItem4(data4)
	local player = GetPlayerFromUserID(data4.id)
	local panel = EntIndexToHScript(data4.panel)
	local manager = g_VRScript.pauseManager --Hack for not having self here
	
	local item = manager.spawnItems4[data4.itemID]
	
	if not IsValidEntity(player) or not IsValidEntity(panel) then
		return
	end
	
	local handID = CPauseManager:GetClosestHandID(player, panel:GetOrigin())
	
	local keyvals = vlua.clone(item.keyvals)

	keyvals.origin = player:GetHMDAvatar():GetVRHand(handID):GetOrigin()
		
	if item.isTool then
		local ent = SpawnEntityFromTableSynchronous("prop_destinations_tool", keyvals)
	
		--player:EquipPropTool(ent, handID)
		EmitSoundOn("default_equip", ent)
	else
		EmitSoundOn("default_equip", ent)
		SpawnEntityFromTableSynchronous("prop_destinations_physics", keyvals)
	end
	
end

function CPauseManager:GetClosestHandID(player, origin)
	
	local hand0 = player:GetHMDAvatar():GetVRHand(0)
	local hand1 = player:GetHMDAvatar():GetVRHand(1)
	
	if (hand0:GetOrigin() - origin):Length() < (hand1:GetOrigin() - origin):Length() then
		return 0
	else
		return 1
	end
end


