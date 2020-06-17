--> Version de la Resource : 
local LatestVersion = ''; CurrentVersion = '1.2'
PerformHttpRequest('https://raw.githubusercontent.com/NinjaSourceV2/GTA_JobsPublic/master/%5BGTA_Metiers%5D/GTA_JobsPublic/VERSION', function(Error, NewestVersion, Header)
    LatestVersion = NewestVersion
    if CurrentVersion ~= NewestVersion then
        print("\n\r ^2[GTA_JobsPublic]^1 La version que vous utilisé n'est plus a jours, veuillez télécharger la dernière version. ^3\n\r")
    end
end)