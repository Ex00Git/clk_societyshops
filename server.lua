ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('clk_societyshops:buy')
AddEventHandler('clk_societyshops:buy', function(job, price, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_' .. job, function(account)
        if account.money >= price then
            if xPlayer.canCarryItem(item, 1) then
                account.removeMoney(price)
                xPlayer.addInventoryItem(item, 1)
                TriggerClientEvent('esx:showNotification', source, "Achat ~g~Effectué~w~ !")
            else
                TriggerClientEvent('esx:showNotification', source, "Vous ne pouvez pas en prendre plus !")
            end
        else
            TriggerClientEvent('esx:showNotification', source, "Votre entreprise n'a pas assez d'argent, il manque : ~r~"..price-account.money.."$")
        end

    end)
end)

