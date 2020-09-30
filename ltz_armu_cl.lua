-- CREDITS
print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^1 LouTzeTV^7")
print("^0[^3Serveur^0] ^7:^0 ^0Space Rôleplay^7")
print("^0======================================================================^7")

--ESSENTIAL

ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

--PMENU

local Airsoft = {

    Base = { Title = "Ammu-Nation", HeaderColor = {255,1,1} },
    Data = { currentMenu = "Available :" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Knife" then
                    TriggerServerEvent('loutzearmu:buy', 250, "weapon_knife", "Knife")
            elseif btn.name == "Bat" then 
                    TriggerServerEvent('loutzearmu:buy', 400, "weapon_bat", "Bat")
            elseif btn.name == "Switchblade" then 
                    TriggerServerEvent('loutzearmu:buy', 900, "weapon_switchblade", "Switchblade")
            elseif btn.name == "Flashlight" then 
                    TriggerServerEvent('loutzearmu:buy', 100, "weapon_flashlight", "Flashlight")
            elseif btn.name == "Katana" then 
                    TriggerServerEvent('loutzearmu:buy', 700, "weapon_katana", "Katana")
              end
        end,
    },

    Menu = {
        ["Available :"] = {
            b = {
                {name = "Knife", ask = "~g~250$", askX = true},
                {name = "Bat", ask = "~g~400$", askX = true},
                {name = "Switchblade", ask = "~g~900$", askX = true},
                {name = "Flashlight", ask = "~g~100$", askX = true},
                {name = "Katana", ask = "~g~700$", askX = true},
            }
        },
    }
}

-- POS SHOP & TEXTE

local Shops = {
    { x = 22.05, y = -1107.17, z = 29.79}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(Shops) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, Shops[k].x, Shops[k].y, Shops[k].z)

            if dist <= 2.0 then
                ESX.ShowHelpNotification("Press ~INPUT_TALK~ to purchase a ~r~weapon")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(Airsoft)
				end
            end
        end
    end
end)

-- PEDS

Citizen.CreateThread(function()
    local hash = GetHashKey("cs_joeminuteman")

    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVEMALE", "cs_joeminuteman", 22.73, -1105.48, 28.79, 156.88, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)
