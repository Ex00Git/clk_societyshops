ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

--------
function OpenWeedshopMenu()
    local WeedsopMenu = RageUI.CreateMenu("Weedshop", "Menu Fournisseur")
        RageUI.Visible(WeedsopMenu, not RageUI.Visible(WeedsopMenu))
        while WeedsopMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(WeedsopMenu, true, true, true, function()
                for k,v in pairs(Shops.tabac) do
                    RageUI.ButtonWithStyle(v.label.. ' Prix: ' .. v.price .. '$', nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('clk_societyshops:buy', v.name, v.price, 'society_weedshop')
                        end
                    end)
                end
            end, function() 
        end)
    
        if not RageUI.Visible(WeedsopMenu) then
            WeedsopMenu = RMenu:DeleteType("Weedshop", true)
        end

    end
end

function OpenTabacMenu()
    local TabacMenu = RageUI.CreateMenu("Tabac", "Menu Fournisseur")
        RageUI.Visible(TabacMenu, not RageUI.Visible(TabacMenu))
        while TabacMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(TabacMenu, true, true, true, function()
                for k,v in pairs(Shops.tabac) do
                    RageUI.ButtonWithStyle(v.label.. ' Prix: ' .. v.price .. '$', nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('clk_societyshops:buy', v.name, v.price, 'society_tabac')
                        end
                    end)
                end
            end, function() 
        end)
    
        if not RageUI.Visible(TabacMenu) then
            TabacMenu = RMenu:DeleteType("Tabac", true)
        end

    end
end

function OpenChichaMenu()
    local ChichaMenu = RageUI.CreateMenu("Chicha", "Menu Fournisseur")
        RageUI.Visible(ChichaMenu, not RageUI.Visible(ChichaMenu))
        while ChichaMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(ChichaMenu, true, true, true, function()
                for k,v in pairs(Shops.tabac) do
                    RageUI.ButtonWithStyle(v.label.. ' Prix: ' .. v.price .. '$', nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('clk_societyshops:buy', v.name, v.price, 'society_chicha')
                        end
                    end)
                end
            end, function() 
        end)
    
        if not RageUI.Visible(ChichaMenu) then
            ChichaMenu = RMenu:DeleteType("Chicha", true)
        end

    end
end

function OpenBahamasMenu()
    local BahamasMenu = RageUI.CreateMenu("Bahamas", "Menu Fournisseur")
        RageUI.Visible(BahamasMenu, not RageUI.Visible(BahamasMenu))
        while BahamasMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(BahamasMenu, true, true, true, function()
                for k,v in pairs(Shops.tabac) do
                    RageUI.ButtonWithStyle(v.label.. ' Prix: ' .. v.price .. '$', nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('clk_societyshops:buy', v.name, v.price, 'society_bahamas')
                        end
                    end)
                end
            end, function() 
        end)
    
        if not RageUI.Visible(BahamasMenu) then
            BahamasMenu = RMenu:DeleteType("Bahamas", true)
        end

    end
end

function OpenMedusaMenu()
    local MedusaMenu = RageUI.CreateMenu("Medusa", "Menu Fournisseur")
        RageUI.Visible(MedusaMenu, not RageUI.Visible(MedusaMenu))
        while MedusaMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(MedusaMenu, true, true, true, function()
                for k,v in pairs(Shops.tabac) do
                    RageUI.ButtonWithStyle(v.label.. ' Prix: ' .. v.price .. '$', nil, { }, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('clk_societyshops:buy', v.name, v.price, 'society_medusa')
                        end
                    end)
                end
            end, function() 
        end)
    
        if not RageUI.Visible(MedusaMenu) then
            MedusaMenu = RMenu:DeleteType("Medusa", true)
        end

    end
end


Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'weedshop' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.Weedshop.position.x, Config.Weedshop.position.y, Config.Weedshop.position.z)
            if dist3 <= 7.0 then
                Timer = 0
                DrawMarker(20, Config.Weedshop.position.x, Config.Weedshop.position.y, Config.Weedshop.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 128, 0, 128, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        OpenWeedshopMenu()
                    end   
            end
        end 

        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'tabac' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.Tabac.position.x, Config.Tabac.position.y, Config.Tabac.position.z)
            if dist3 <= 7.0 then
                Timer = 0
                DrawMarker(20, Config.Tabac.position.x, Config.Tabac.position.y, Config.Tabac.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 128, 0, 128, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        OpenTabacMenu()
                    end   
            end
        end 

        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'chicha' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.Chicha.position.x, Config.Chicha.position.y, Config.Chicha.position.z)
            if dist3 <= 7.0 then
                Timer = 0
                DrawMarker(20, Config.Chicha.position.x, Chicha.Tabac.position.y, Config.Tabac.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 128, 0, 128, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        OpenChichaMenu()
                    end   
            end
        end 

        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'bahamas' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.Bahamas.position.x, Config.Bahamas.position.y, Config.Bahamas.position.z)
            if dist3 <= 7.0 then
                Timer = 0
                DrawMarker(20, Config.Bahamas.position.x, Config.Bahamas.position.y, Config.Bahamas.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 128, 0, 128, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        OpenBahamasMenu()
                    end   
            end
        end 

        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'medusa' then
            local plyCoords3 = GetEntityCoords(GetPlayerPed(-1), false)
            local dist3 = Vdist(plyCoords3.x, plyCoords3.y, plyCoords3.z, Config.Medusa.position.x, Config.Medusa.position.y, Config.Medusa.position.z)
            if dist3 <= 7.0 then
                Timer = 0
                DrawMarker(20, Config.Medusa.position.x, Config.Medusa.position.y, Config.Medusa.position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 128, 0, 128, 255, 0, 1, 2, 0, nil, nil, 0)
            end
            if dist3 <= 2.0 then
                Timer = 0   
                RageUI.Text({ message = "Appuyez sur ~p~[E]~s~ pour accéder au menu", time_display = 1 })
                    if IsControlJustPressed(1,51) then           
                        OpenMedusaMenu()
                    end   
            end
        end 
        Citizen.Wait(Timer)
    end
end)