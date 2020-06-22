ITEMS = {}

--> Event :
RegisterNetEvent("GTA:LoadClientJob")
AddEventHandler("GTA:LoadClientJob", function(newJobName, newService)
	config.Job = newJobName
	config.Service = newService
end)

RegisterNetEvent("gui:getItems")
AddEventHandler("gui:getItems", function(THEITEMS)
    ITEMS = {}
    ITEMS = THEITEMS
end)

--Function :
function CheckItemNumber(item)
	local itemamount = 0
		if ITEMS[item] ~= nil then
			itemamount = ITEMS[item].quantity
		end
	return itemamount
end

Ninja_Core__DisplayHelpAlert = function(msg)
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(msg);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end

function DrawMissionText(m_text, showtime)
    ClearPrints()
	SetTextEntry_2("STRING")
	AddTextComponentString(m_text)
	DrawSubtitleTimed(showtime, 1)
end

function LocalPed()
    return GetPlayerPed(-1)
end

function deleteCar( entity ) --> Function qui permet de supprimer votre véhicule de service.
	SetEntityAsMissionEntity(entity,true,true)
	Citizen.InvokeNative( 0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized( entity ) )
end