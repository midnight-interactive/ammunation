ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('loutzearmu:buy')
AddEventHandler('loutzearmu:buy', function(price, weapon, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
	xPlayer.removeMoney(price)
    	xPlayer.addWeapon(weapon, 200)

         TriggerClientEvent('esx:showAdvancedNotification', source, "AirSoft Store", "Paiement ~g~accepté", "Merci de votre ~g~achat~s~ dans notre boutique", "CHAR_JOE", "Chat Box")
     else
          TriggerClientEvent('esx:showAdvancedNotification', source, "AirSoft Store", "Paiement ~r~refusé", "Malheuresement, nous ~r~faisont pas crédit~s~", "CHAR_JOE", "Chat Box")    end
end)