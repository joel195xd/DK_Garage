local MySQL = exports.ghmattimysql

RegisterCommand('park', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(source), false)
        if vehicle and vehicle ~= 0 then
            local model = GetEntityModel(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            local pos = GetEntityCoords(vehicle)
            local heading = GetEntityHeading(vehicle)

            MySQL.Async.execute('INSERT INTO parked_vehicles (owner_id, vehicle_model, vehicle_plate, position_x, position_y, position_z, heading) VALUES (@owner_id, @vehicle_model, @vehicle_plate, @position_x, @position_y, @position_z, @heading)',
            {
                ['@owner_id'] = xPlayer.identifier,
                ['@vehicle_model'] = model,
                ['@vehicle_plate'] = plate,
                ['@position_x'] = pos.x,
                ['@position_y'] = pos.y,
                ['@position_z'] = pos.z,
                ['@heading'] = heading
            })

            -- Delete vehicle after parking
            DeleteEntity(vehicle)
            TriggerClientEvent('chat:addMessage', source, {
                args = {"Sistema", "Vehículo estacionado correctamente."}
            })
        else
            TriggerClientEvent('chat:addMessage', source, {
                args = {"Sistema", "No estás en un vehículo."}
            })
        end
    end
end, false)

RegisterCommand('retrieve', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll('SELECT * FROM parked_vehicles WHERE owner_id = @owner_id', {
            ['@owner_id'] = xPlayer.identifier
        }, function(vehicles)
            if #vehicles > 0 then
                for _, vehicle in ipairs(vehicles) do
                    local model = vehicle.vehicle_model
                    local pos = vector3(vehicle.position_x, vehicle.position_y, vehicle.position_z)
                    local heading = vehicle.heading

                    -- Spawn vehicle
                    local vehicleHash = GetHashKey(model)
                    RequestModel(vehicleHash)
                    while not HasModelLoaded(vehicleHash) do
                        Citizen.Wait(0)
                    end

                    local spawnedVehicle = CreateVehicle(vehicleHash, pos, heading, true, false)
                    SetVehicleNumberPlateText(spawnedVehicle, vehicle.vehicle_plate)
                    
                    -- Remove from database
                    MySQL.Async.execute('DELETE FROM parked_vehicles WHERE id = @id', {
                        ['@id'] = vehicle.id
                    })

                    TriggerClientEvent('chat:addMessage', source, {
                        args = {"Sistema", "Vehículo recuperado: " .. vehicle.vehicle_plate}
                    })
                end
            else
                TriggerClientEvent('chat:addMessage', source, {
                    args = {"Sistema", "No tienes vehículos estacionados."}
                })
            end
        end)
    end
end, false)
