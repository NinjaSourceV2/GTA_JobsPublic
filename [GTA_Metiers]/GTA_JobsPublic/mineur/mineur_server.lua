RegisterServerEvent('GTA:RecevoirPayeMineur')
AddEventHandler('GTA:RecevoirPayeMineur', function(payeTotaleMineur)
	local source = source
    TriggerEvent('GTA:AjoutArgentPropre', source, tonumber(payeTotaleMineur))
end)