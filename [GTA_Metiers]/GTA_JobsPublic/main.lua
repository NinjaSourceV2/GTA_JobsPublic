--||@SuperCoolNinja.||--

-- Blips Mineur : 
RegisterNetEvent("GTA:ShowMineurBlip")
AddEventHandler('GTA:ShowMineurBlip', function(bool)
	if bool and #config.BlipsMineur  == 0 then
		for station,pos in pairs(PositionMineur) do
			local loc = pos
			pos = pos.Vestiaire
			local blip = AddBlipForCoord(pos[1],pos[2],pos[3])
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


Citizen.CreateThread(function()
    while true do
		Citizen.Wait(0)
		if config.Job == "Mineur" then
			TriggerEvent("GTA:ShowMineurBlip",true)
		else
			TriggerEvent("GTA:ShowMineurBlip",false)
		end
    end
end)