ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('clk_societyshops:buy')
AddEventHandler('clk_societyshops:buy', function(item,price,society)
    ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
        local society_money = money
    
        if society_money >= price then
            TriggerServerEvent('esx_society:withdrawMoney', society, price)
            TriggerClientEvent('esx:showNotification', source, "~g~Achat(s)~w~ effectué(s) !")
        else
            TriggerClientEvent('esx:showNotification', source, "La société ~r~n'a pas assez d\'argent")
        end

    end, society)
end)