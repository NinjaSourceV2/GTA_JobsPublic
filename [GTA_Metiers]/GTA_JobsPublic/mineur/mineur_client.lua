--||@SuperCoolNinja.||--
local Duree = 0
local Duree2 = 0
local Duree3 = 0

--> Variable :
local maxCuivreSlot = 31 --> Nombre maximum qu'il peut contenir dans son inventaire
local payeTotaleMineur = 2500 --> A changer ici la paye. (Je l'ai fait de manniere vraiment basic)

RegisterNetEvent("GTA:ShowMineurBlip")
AddEventHandler('GTA:ShowMineurBlip', function(bool)
	if bool and #config.BlipsMineur == 0 then
		for _,pos in pairs(PositionMineur) do
			local loc = pos
			pos = pos.Vestiaire
			local blip = AddBlipForCoord(pos.x,pos.y,pos.z)
			SetBlipSprite(blip,78)
			SetBlipColour(blip, 16)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Mineur')
			EndTextCommandSetBlipName(blip)
			SetBlipAsShortRange(blip,true)
			SetBlipAsMissionCreatorBlip(blip,true)
			table.insert(config.BlipsMineur, {blip = blip, pos = loc})
		end
	elseif bool == false and #config.BlipsMineur > 0 then
		for _,v in ipairs(config.BlipsMineur) do
			if DoesBlipExist(v.blip) then
				SetBlipAsMissionCreatorBlip(v.blip,false)
				Citizen.InvokeNative(0x86A652570E5F25DD, Citizen.PointerValueIntInitialized(v.blip))
			end
		end
		config.BlipsMineur = {}
	end
end)

RegisterNetEvent("GTA:ShowMineurBlipPoint")
AddEventHandler('GTA:ShowMineurBlipPoint', function ()
    for _,pos in pairs(PositionMineur) do
        --Vestiaire :
        local posVestiaire = pos.Vestiaire
        MineurVestiaire = AddBlipForCoord(posVestiaire.x,posVestiaire.y,posVestiaire.z)
        SetBlipSprite(MineurVestiaire,366)		
        SetBlipColour(MineurVestiaire, 16)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('VESTIAIRE')
        EndTextCommandSetBlipName(MineurVestiaire)

        --Sortie du camion :
        MineurCamion = AddBlipForCoord(978.145690917969,-1919.07055664063,31.1356315612793)
        SetBlipSprite(MineurCamion,318)		
        SetBlipColour(MineurCamion, 16)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('SORTIE CAMION')
        EndTextCommandSetBlipName(MineurCamion)

        --Mine :
        local posMine = pos.Recolte
        MineurChamps = AddBlipForCoord(posMine.x,posMine.y,posMine.z)
        SetBlipSprite(MineurChamps,78)		
        SetBlipColour(MineurChamps, 16)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('MINE DE CUIVRE')
        EndTextCommandSetBlipName(MineurChamps)

        --Traitement :
        local posTraitement = pos.traitement
        MineurTraitement = AddBlipForCoord(posTraitement.x, posTraitement.y, posTraitement.z)
        SetBlipSprite(MineurTraitement,233)	
        SetBlipColour(MineurTraitement, 16)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('TRAITEMENT DE CUIVRE')
        EndTextCommandSetBlipName(MineurTraitement)

        --Revente :
        local posVente = pos.vente
        MineurRevente = AddBlipForCoord(posVente.x,posVente.y,posVente.z)
        SetBlipSprite(MineurRevente,277)	
        SetBlipColour(MineurRevente, 16)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('REVENTE DE CUIVRE')
        EndTextCommandSetBlipName(MineurRevente)    
    end
end)


RegisterNetEvent("GTA:RemoveBlipPoint")
AddEventHandler("GTA:RemoveBlipPoint", function ()
    --On retire le blip vestiaire si la personne n'est plus mineur :
    if MineurVestiaire ~= nil and DoesBlipExist(MineurVestiaire) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MineurVestiaire))
        MineurVestiaire = nil
    end

    --On retire le blip sortie de camion si la personne n'est plus mineur :
    if MineurCamion ~= nil and DoesBlipExist(MineurCamion) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MineurCamion))
        MineurCamion = nil
    end

    --On retire le champ de mine si la personne n'est plus mineur :
    if MineurChamps ~= nil and DoesBlipExist(MineurChamps) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MineurChamps))
        MineurChamps = nil
    end

    --On retire le blip traitement si la personne n'est plus mineur :
    if MineurTraitement ~= nil and DoesBlipExist(MineurTraitement) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MineurTraitement))
        MineurTraitement = nil
    end

    --On retire le blip revente si la personne n'est plus mineur :
    if MineurRevente ~= nil and DoesBlipExist(MineurRevente) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MineurRevente))
        MineurRevente = nil
    end
end)



RegisterNetEvent("GTA:isPlayerMineurOnService")
AddEventHandler("GTA:isPlayerMineurOnService", function ()
    if config.Service == false then
        local homme = GetHashKey("mp_m_freemode_01")
        if(GetEntityModel(GetPlayerPed(-1)) == homme) then
            SetPedComponentVariation(LocalPed(), 11, 5, 0, 2)  -- Top
            SetPedComponentVariation(LocalPed(), 8, 59, 0, 2)   -- teeshirt
            SetPedComponentVariation(LocalPed(), 6, 25, 0, 2)   -- Chaussure
            SetPedComponentVariation(LocalPed(), 4, 0, 12, 2)   -- Pantalon
            SetPedComponentVariation(LocalPed(), 3, 34, 0, 2)   -- torsos
        else
            SetPedComponentVariation(GetPlayerPed(-1), 11, 11, 2, 2)  -- Top
            SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 0, 2)   -- teeshirt
			SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 2)   -- Chaussure
			SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 2)   -- Pantalon
			SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 2)   -- torsos
        end
        TriggerEvent("GTA:ShowMineurBlipPoint")
        TriggerServerEvent("GTA:UpdateServiceOn")
    else
        TriggerServerEvent("GTA:UpdateServiceOff")
        TriggerServerEvent("GTA:LoadVetement")
        TriggerEvent("GTA:RemoveBlipPoint")
    end
        
    config.Service = not config.Service
end)

RegisterNetEvent("GTA:TenueMineur")
AddEventHandler("GTA:TenueMineur", function ()
    local homme = GetHashKey("mp_m_freemode_01")
    if(GetEntityModel(GetPlayerPed(-1)) == homme) then
        SetPedComponentVariation(LocalPed(), 11, 5, 0, 2)  -- Top
        SetPedComponentVariation(LocalPed(), 8, 59, 0, 2)   -- teeshirt
        SetPedComponentVariation(LocalPed(), 6, 25, 0, 2)   -- Chaussure
        SetPedComponentVariation(LocalPed(), 4, 0, 12, 2)   -- Pantalon
        SetPedComponentVariation(LocalPed(), 3, 34, 0, 2)   -- torsos
    else
        SetPedComponentVariation(GetPlayerPed(-1), 11, 11, 2, 2)  -- Top
        SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 0, 2)   -- teeshirt
        SetPedComponentVariation(GetPlayerPed(-1), 6, 26, 0, 2)   -- Chaussure
        SetPedComponentVariation(GetPlayerPed(-1), 4, 35, 0, 2)   -- Pantalon
        SetPedComponentVariation(GetPlayerPed(-1), 3, 11, 0, 2)   -- torsos
    end
end)



RegisterNetEvent("GTA:isVehMineurOut")
AddEventHandler("GTA:isVehMineurOut", function ()
    if config.VehiculeSortie == false then  
        local carid = GetHashKey("rubble")
        RequestModel(carid) 
        while not HasModelLoaded(carid) do
            Citizen.Wait(0)
        end
        
        if(mineurVeh ~= nil) then	
            deleteCar(mineurVeh)
        end

        local playerCoords = GetEntityCoords(LocalPed())
        playerCoords = playerCoords + vector3(0, 2, 0)

        mineurVeh = CreateVehicle(carid, 978.145690917969,-1919.07055664063,31.1356315612793, 0.0, true, false)
        TaskWarpPedIntoVehicle(LocalPed(), mineurVeh, -1)
    else
        deleteCar(mineurVeh)
    end

    config.VehiculeSortie = not config.VehiculeSortie
end)

------------------------------------> OPTIMISATION A VENIR ... TODO.
Citizen.CreateThread(function()
    while true do
        Duree = 1000
        for _, pos in pairs(PositionMineur) do
            if (config.Job == "Mineur") then

                ---> Update du timer pour opitmisation :
                Duree = 8

                --Prise de Service :
                if getDistance(GetEntityCoords(LocalPed()), pos.Vestiaire) < 5 then
                    if config.Service == true then
                        if GetLastInputMethod(0) then
                            Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~r~finir~w~ votre ~b~service~w~.")
                        else
                            Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~finir~w~ votre ~b~service~w~.")
                        end
                    else
                        if GetLastInputMethod(0) then
                            Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour vous ~b~équiper~w~.")
                        else
                            Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour vous ~b~équiper~w~.")
                        end
                    end
                    
                    if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) then -->Prise de service
                        TriggerEvent("GTA:isPlayerMineurOnService")
                    end
                end
                
                if config.Service == true then
                    --Sortie de camion :
                    if getDistance(GetEntityCoords(LocalPed()), pos.SpawnCamion) < 5 then
                        if config.VehiculeSortie == false then
                            if GetLastInputMethod(0) then
                                Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~b~sortir~w~ votre camion.")
                            else
                                Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~b~sortir~w~ votre camion.")
                            end
                        else
                            if GetLastInputMethod(0) then
                                Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~r~ranger~w~ votre camion.")
                            else
                                Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~ranger~w~ votre camion.")
                            end
                        end 

                        if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175))  then --> Sortie de camion :
                            TriggerEvent("GTA:isVehMineurOut")
                        end
                    end


                    --Recolte Process:
                    if config.recolteEnCours == true and config.joueurProcheRecolte == true then
                        if (exports.nMenuPersonnel:getQuantity("Cuivre") >= maxCuivreSlot) then
                            DrawMissionText("~h~~r~Inventaire Complet", 10000)
                            config.recolteEnCours = false
                        else
                            while (exports.nMenuPersonnel:getQuantity("Cuivre") < maxCuivreSlot) and (config.recolteEnCours == true) and (config.joueurProcheRecolte == true) do
                                DrawMissionText("~h~~b~Récolte~w~ en cours...", 3000)
                                exports['nCoreGTA']:progression(3000) --> Bar de progression.
                                Wait(3000)
                                DrawMissionText("~h~~g~+1~w~ Cuivre...", 1000)
                                TriggerEvent("player:receiveItem", "Cuivre", 1)
                                CheckItemNumber("Cuivre")
                            end
                        end
                    else
                        config.recolteEnCours = false
                    end

                    --Traitement Process:
                    if config.traitementEnCours == true and config.joueurProcheTraitement == true then
                        if (exports.nMenuPersonnel:getQuantity("Cuivre") <= 0) then
                            DrawMissionText("~h~~g~Traitement terminé", 10000)
                            config.traitementEnCours = false
                        else
                            while (exports.nMenuPersonnel:getQuantity("Cuivre") > 0) and (config.traitementEnCours == true) and (config.joueurProcheTraitement == true) do
                                DrawMissionText("~h~~b~Traitement~w~ en cours...", 3000)
                                exports['nCoreGTA']:progression(3000) --> Bar de progression.
                                Wait(3000)
                                DrawMissionText("~h~~g~+1~w~ Fil de Cuivre...", 1000)
                                TriggerEvent('player:looseItem', "Cuivre", 1)
                                TriggerEvent("player:receiveItem", "Fil de Cuivre", 1)
                                Wait(1000)
                                CheckItemNumber("Cuivre")
                                CheckItemNumber("Fil de Cuivre")
                            end
                        end
                    else
                        config.traitementEnCours = false
                    end

                    --Revente Process:
                    if config.reventeEnCours == true and config.joueurProcheRevente == true then
                        if(exports.nMenuPersonnel:getQuantity("Fil de Cuivre") <= 0) then
                            DrawMissionText("~h~~g~Revente terminé", 10000)
                            config.reventeEnCours = false
                        else
                            while (exports.nMenuPersonnel:getQuantity("Fil de Cuivre") > 0) and (config.reventeEnCours == true) and (config.joueurProcheRevente == true) do
                                DrawMissionText("~h~~b~Revente~w~ en cours...", 3000)
                                exports['nCoreGTA']:progression(3000) --> Bar de progression.
                                Wait(3000)
                                DrawMissionText("~h~Vous avez vendu ~g~+1 fil de Cuivre~w~...", 1000)
                                TriggerEvent('player:looseItem', "Fil de Cuivre", 1)
                                TriggerServerEvent("GTA:RecevoirPayeMineur", tonumber(payeTotaleMineur))
                                Wait(1000)
                                CheckItemNumber("Fil de Cuivre")
                            end
                        end
                    else
                        config.reventeEnCours = false
                    end
                end
            end
        end
        Citizen.Wait(Duree)
    end
end)




---------------------------------> Check si le joueur appuie sur E pour vendre puis qu'il n'est pas déjà en récolte en cours ...
Citizen.CreateThread(function()
    while true do
        Duree2 = 1000
        if config.Service == true then
            Duree2 = 8
            --Recolte :
            if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) and (config.joueurProcheRecolte == true) and (config.recolteEnCours == false) then
                if IsPedInAnyVehicle(LocalPed(), true) == false then
                    config.recolteEnCours = true
                else
                    DrawMissionText("~h~~r~Vous devez sortir du véhicule pour travailler.", 2000)
                end
            elseif (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) and (config.joueurProcheRecolte == true) and (config.recolteEnCours == true) then
                config.recolteEnCours = false
            end
        end
        Citizen.Wait(Duree2)
    end
end)


---------------------------------> Check si le joueur appuie sur E pour vendre puis qu'il n'est pas déjà en traitement en cours ...
Citizen.CreateThread(function()
    while true do
        Duree2 = 1000
        if config.Service == true then
            Duree2 = 8
            --Traitement :
            if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) and (config.joueurProcheTraitement == true) and (config.traitementEnCours == false) then
                if IsPedInAnyVehicle(LocalPed(), true) == false then
                    config.traitementEnCours = true
                else
                    DrawMissionText("~h~~r~Vous devez sortir du véhicule pour travailler.", 2000)
                end
            elseif (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) and (config.joueurProcheTraitement == true) and (config.traitementEnCours == true) then
                config.traitementEnCours = false
            end
        end
        Citizen.Wait(Duree2)
    end
end)



---------------------------------> Check si le joueur appuie sur E pour vendre puis qu'il n'est pas déjà en vente en cours ...
Citizen.CreateThread(function()
    while true do
        Duree2 = 1000
        if config.Service == true then
            Duree2 = 8
            --Revente :
            if (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) and (config.joueurProcheRevente == true) and (config.reventeEnCours == false) then
                if IsPedInAnyVehicle(LocalPed(), true) == false then
                    config.reventeEnCours = true
                else
                    DrawMissionText("~h~~r~Vous devez sortir du véhicule pour vendre.", 2000)
                end
            elseif (IsControlJustReleased(0, 54) or IsControlJustReleased(0, 175)) and (config.joueurProcheRevente == true) and (config.reventeEnCours == true) then
                config.reventeEnCours = false
            end
        end
        Citizen.Wait(Duree2)
    end
end)



---> Check Distance du joueur par apport a la zone : 
Citizen.CreateThread(function()
    while true do
        Duree3 = 1000
        if config.Service == true then
            Duree3 = 8
            for _, pos in pairs(PositionMineur) do

                -------> RECOLTE ZONE :
                if config.recolteEnCours == true and getDistance(GetEntityCoords(LocalPed()), pos.Recolte) > 10.0001 then
                    DrawMissionText("~r~ vous avez quitté la zone.", 1000)
                    config.joueurProcheRecolte = false
                    config.recolteEnCours = false
                else
                    if config.recolteEnCours == false and getDistance(GetEntityCoords(LocalPed()), pos.Recolte) < 10.0001 then
                        config.joueurProcheRecolte = true
                    end
                end

                if config.recolteEnCours == false and config.joueurProcheRecolte == true then
                    if GetLastInputMethod(0) then
                        Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~g~récolter ~w~.")
                    else
                        Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~g~récolter ~w~.")
                    end
                elseif config.recolteEnCours == true and config.joueurProcheRecolte == true then
                    if GetLastInputMethod(0) then
                        Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~r~stopper ~w~ la ~g~récolte ~w~.")
                    else
                        Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~stopper ~w~ la ~g~récolte ~w~.")
                    end
                end
                
                if getDistance(GetEntityCoords(LocalPed()), pos.Recolte) > 10.0001 then 
                    config.joueurProcheRecolte = false
                    config.recolteEnCours = false
                    DrawMarker(1, pos.Recolte.x,pos.Recolte.y,pos.Recolte.z-1.1001, 0, 0, 0, 0, 0, 0, 20.0, 20.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
                end

                -------> TRAITEMENT ZONE :
                if config.traitementEnCours == true and getDistance(GetEntityCoords(LocalPed()), pos.traitement) > 10.0001 then
                    DrawMissionText("~r~ vous avez quitté la zone.", 1000)
                    config.joueurProcheTraitement = false
                    config.traitementEnCours = false
                else
                    if config.traitementEnCours == false and getDistance(GetEntityCoords(LocalPed()), pos.traitement) < 10.0001 then
                        config.joueurProcheTraitement = true
                    end
                end

                if config.traitementEnCours == false and config.joueurProcheTraitement == true then
                    if GetLastInputMethod(0) then
                        Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~g~traiter ~w~.")
                    else
                        Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~g~traiter ~w~.")
                    end
                elseif config.traitementEnCours == true and config.joueurProcheTraitement == true then
                    if GetLastInputMethod(0) then
                        Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~r~stopper ~w~ le ~g~traitement ~w~.")
                    else
                        Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~stopper ~w~ le ~g~traitement ~w~.")
                    end
                end

                if getDistance(GetEntityCoords(LocalPed()), pos.traitement) > 10.0001 then 
                    config.joueurProcheTraitement = false
                    config.traitementEnCours = false
                    DrawMarker(1, pos.traitement.x,pos.traitement.y,pos.traitement.z, 0, 0, 0, 0, 0, 0, 20.0, 20.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
                end

                -------> REVENTE ZONE :
                if config.reventeEnCours == true and getDistance(GetEntityCoords(LocalPed()), pos.vente) > 10.0001 then
                    DrawMissionText("~r~ vous avez quitté la zone.", 1000)
                    config.joueurProcheRevente = false
                    config.reventeEnCours = false
                else
                    if config.reventeEnCours == false and getDistance(GetEntityCoords(LocalPed()), pos.vente) < 10.0001 then
                        config.joueurProcheRevente = true
                    end
                end

                if config.reventeEnCours == false and config.joueurProcheRevente == true then
                    if GetLastInputMethod(0) then
                        Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~g~vendre ~w~.")
                    else
                        Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~g~vendre ~w~.")
                    end
                elseif config.reventeEnCours == true and config.joueurProcheRevente == true then
                    if GetLastInputMethod(0) then
                        Ninja_Core__DisplayHelpAlert("Appuyez sur ~INPUT_CONTEXT~ pour ~r~stopper ~w~ la ~g~vente ~w~.")
                    else
                        Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~stopper ~w~ la ~g~vente ~w~.")
                    end
                end

                if getDistance(GetEntityCoords(LocalPed()), pos.vente) > 10.0001 then 
                    config.joueurProcheRevente = false
                    config.reventeEnCours = false
                    DrawMarker(1, pos.vente.x,pos.vente.y,pos.vente.z, 0, 0, 0, 0, 0, 0, 20.0, 20.0, 2.0, 178, 236, 93, 155, 0, 0, 2, 0, 0, 0, 0)
                end
            end
        end
        Citizen.Wait(Duree3)
    end
end)