ESX              = nil
local PlayerData = {}
local isMenuOpen = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local options = {
    {label = "Ban Player", value = 'ban_player'},
    {label = "Kick Player", value = 'kick_player'},
    {label = "bring Player", value = 'bring_player'},
    {label = "Teleport To Player", value = 'teleport_to_player'},
    {label = "Spawn Money", value = 'spawn_money'},
    {label = "Spawn Item", value = 'spawn_item'},
    {label = "Spawn Weapon", value = 'spawn_weapon'},
    {label = "Noclip", value = 'noclip'},
    {label = "Godmode", value = 'godmode'},
    {label = "Reset Health", value = 'heal_player'},
    {label = "Reset Food/Hunger", value = 'reset_food_thirst'},
    {label = "Get Car Keys", value = 'get_car_keys'},
    {label = "Spawn Vehicle (Model)", value = 'spawn_vehicle'},
    {label = "Delete Vehicle", value = 'delete_vehicle'},
    {label = "Vehicle Customization", value = 'vehicle_mods'},
    {label = "Repair Vehicle", value = 'repair_vehicle'},
    {label = "Clean Vehicle", value = 'clean_vehicle'},
    {label = "Flip Vehicle", value = 'flip_vehicle'},
    {label = "Set Max Fuel", value = 'max_fuel'},
    {label = "Teleport To Waypoint", value = 'tpm'},
    {label = "Edit Player Model", value = 'player_skin'},
    {label = "Coords Display", value = 'coords'},
}

function OpenMenu()
    isMenuOpen = true
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_menu', {
    	title    = 'Admin Menu',
		align    = 'top-left',
		elements = options
	}, function(data, menu)
        if data.current.value == 'ban_player' then
            -- To do
        end
        if data.current.value == 'kick_player' then
            -- To do
        end
        if data.current.value == 'bring_player' then
            -- To do
        end
        if data.current.value == 'teleport_to_player' then
            -- To do
        end
        if data.current.value == 'spawn_money' then
            -- To do
        end
        if data.current.value == 'spawn_item' then
            -- To do
        end
        if data.current.value == 'spawn_weapon' then
            -- To do
        end
        if data.current.value == 'noclip' then
            TriggerEvent('esx_admin:noclip')
        end
        if data.current.value == 'godmode' then
            TriggerEvent('esx_admin:godmode')
        end
        if data.current.value == 'heal_player' then
            TriggerEvent('esx_admin:HealPlayer')
        end
        if data.current.value == 'reset_food_thirst' then
            TriggerEvent('esx_admin:ResetFoodThirst')
        end
        if data.current.value == 'get_car_keys' then
            TriggerEvent('esx_admin:GetCarKeys')
        end
        if data.current.value == 'spawn_vehicle' then
            -- To do
        end
        if data.current.value == 'delete_vehicle' then
            TriggerEvent('esx_admin:delete_vehicle')
        end
        if data.current.value == 'vehicle_mods' then
            -- To do
        end
        if data.current.value == 'repair_vehicle' then
            TriggerEvent('esx_admin:repair_vehicle')
        end
        if data.current.value == 'clean_vehicle' then
            TriggerEvent('esx_admin:clean_vehicle')
        end
        if data.current.value == 'flip_vehicle' then
            TriggerEvent('esx_admin:flipcar')
        end
        if data.current.value == 'max_fuel' then
            TriggerEvent('esx_admin:max_fuel')
        end
        if data.current.value == 'tpm' then
            TriggerEvent('esx_admin:tpm')
        end
        if data.current.value == 'player_skin' then
            TriggerEvent('esx_skin:openSaveableMenu')
        end
        if data.current.value == 'coords' then
            ToggleCoords()
        end
    end,
	function(data, menu)
		menu.close()
        isMenuOpen = false
	end)
end

RegisterCommand('a:menu', function()
    OpenMenu()
end, false)