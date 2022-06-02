ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('clk_societyshops:buy')
AddEventHandler('clk_societyshops:buy', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('esx:showNotification', source, "~g~Achat(s)~w~ effectué(s) !")
    xPlayer.addInventoryItem(item, 1)
end)