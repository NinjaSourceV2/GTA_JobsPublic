--||@SuperCoolNinja.||--

AddEventHandler('playerSpawned', function(spawn)
	TriggerServerEvent("GTA:LoadJobsJoueur")

	Wait(250)

	
	if config.Job == "Mineur" then 
		TriggerEvent("GTA:ShowMineurBlip", true)
	else
		TriggerEvent("GTA:ShowMineurBlip", false)
	end

	if config.Job == "Mineur" and config.Service == true then 
		TriggerEvent("GTA:ShowMineurBlipPoint")
	else
		TriggerEvent("GTA:RemoveBlipPoint")
	end
end)