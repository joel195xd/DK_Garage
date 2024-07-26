RegisterNetEvent('showParkingMarkers')
AddEventHandler('showParkingMarkers', function()
    -- Define zonas de estacionamiento aquí, ejemplo:
    local parkingZones = {
        {x = -50.0, y = -1075.0, z = 25.0},
        {x = 200.0, y = -800.0, z = 30.0}
    }
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            for _, zone in pairs(parkingZones) do
                DrawMarker(1, zone.x, zone.y, zone.z - 1.0, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.5, 0, 255, 0, 150, false, false, 2, false, nil, nil, false)
                if Vdist(playerCoords, zone.x, zone.y, zone.z) < 1.5 then
                    -- Muestra un mensaje para estacionar el vehículo
                    SetTextComponentFormat('STRING')
                    AddTextComponentString('Presiona ~INPUT_CONTEXT~ para estacionar el vehículo')
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                    
                    if IsControlJustReleased(0, 51) then -- 51 es la tecla E
                        TriggerServerEvent('parkVehicle')
                    end
                end
            end
        end
    end)
end)
