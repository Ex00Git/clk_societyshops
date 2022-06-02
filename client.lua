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
function OpenJobMenu(jobraw, job)
    local society = 'society_' .. job
    local JobMenu = RageUI.CreateMenu("Menu Fournisseur", "Société")
        RageUI.Visible(JobMenu, not RageUI.Visible(JobMenu))
        while JobMenu do
            Citizen.Wait(0)
            RageUI.IsVisible(JobMenu, true, true, true, function()
                for k,v in pairs(jobraw) do
                    RageUI.ButtonWithStyle(v.label, nil, {RightLabel = v.price .. '$'}, true, function(Hovered, Active, Selected)
                        if (Selected) then
                            TriggerServerEvent('clk_societyshops:buy', job, v.price, v.name)
                        end
                    end)
                end
            end, function() 
        end)
    
        if not RageUI.Visible(JobMenu) then
            JobMenu = RMenu:DeleteType("Menu Fournisseur", true)
        end

    end
end

Citizen.CreateThread(function()
    while true do
        local Timer = 500
        if ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then
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
                        --OpenJobMenu(Weedshop, 'Weedshop')
                        OpenJobMenu(Weedshop, 'Weedshop')
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
                        OpenJobMenu(tabac, 'tabac')
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
                        OpenJobMenu(chicha, 'chicha')
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
                        OpenJobMenu(bahamas, 'bahamas')
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
                        OpenJobMenu(medusa, 'medusa')
                    end   
            end
        end 
        Citizen.Wait(Timer)
    end
end)