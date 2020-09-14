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

    Base = { Title = "AirSoft Store", HeaderColor = {255,1,1} },
    Data = { currentMenu = "Disponible :" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Couteau" then
                    TriggerServerEvent('loutzearmu:buy', 250, "weapon_knife", "Couteau")
            elseif btn.name == "Batte" then 
                    TriggerServerEvent('loutzearmu:buy', 400, "weapon_bat", "Batte")
            elseif btn.name == "Cran d'arrêt" then 
                    TriggerServerEvent('loutzearmu:buy', 900, "weapon_switchblade", "Cran d'arrêt")
            elseif btn.name == "Lampe Torche" then 
                    TriggerServerEvent('loutzearmu:buy', 100, "weapon_flashlight", "Lampe Torche")
            elseif btn.name == "Katana" then 
                    TriggerServerEvent('loutzearmu:buy', 700, "weapon_katana", "Katana")
              end
        end,
    },

    Menu = {
        ["Disponible :"] = {
            b = {
                {name = "Couteau", ask = "~g~250$", askX = true},
                {name = "Batte", ask = "~g~400$", askX = true},
                {name = "Cran d'arrêt", ask = "~g~900$", askX = true},
                {name = "Lampe Torche", ask = "~g~100$", askX = true},
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
                ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec le ~r~vendeur")
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