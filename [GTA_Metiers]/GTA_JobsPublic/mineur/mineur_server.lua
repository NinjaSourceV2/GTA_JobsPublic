
--> Version de la Resource : 
PerformHttpRequest("https://raw.githubusercontent.com/NinjaSourceV2/GTA_JobsPublic/master/%5BGTA_Metiers%5D/GTA_JobsPublic/fxmanifest.lua", function(errorCode, result, headers)
	local version = GetResourceMetadata(GetCurrentResourceName(), 'resource_version', 0)

	if string.find(tostring(result), version) == nil then
		print("\n\r ^2[GTA_JobsPublic]^1 La version que vous utilisé n'est plus a jours, veuillez télécharger la dernière version: ^3["..version .."]\n\r")
	end
end, "GET", "", "")

RegisterServerEvent('GTA:RecevoirPayeMineur')
AddEventHandler('GTA:RecevoirPayeMineur', function(payeTotaleMineur)
	local source = source
    TriggerEvent('GTA:AjoutArgentPropre', source, tonumber(payeTotaleMineur))
end)