RegisterNetEvent('QBCore:Server:OnPlayerLoaded')
AddEventHandler('QBCore:Server:OnPlayerLoaded', function()
	local src = source
	local identifiers = GetPlayerIdentifiers(src)
    local license
    for _, v in pairs(identifiers) do
        if string.find(v, 'license') then
            license = v
            break
        end
    end
	if checkIfLicenseExists(license) then 
        print('Found duplicate, Kicking player ' .. src)
        DropPlayer(src, "Don't do this again bitch ;)")   
    end
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	local src = source
	local identifiers = GetPlayerIdentifiers(src)
    local license
    for _, v in pairs(identifiers) do
        if string.find(v, 'license') then
            license = v
            break
        end
    end
	if checkIfLicenseExists(license) then 
        print('Found duplicate, Kicking player ' .. src)
        DropPlayer(src, "Don't do this again bitch ;)")   
    end
end)
    

function checkIfLicenseExists(license)
    local players = GetPlayers()
    local count = 0
    for _, player in pairs(players) do
        local identifiers = GetPlayerIdentifiers(player)
        for _, id in pairs(identifiers) do
            if string.find(id, 'license') then
                if id == license then
                    count = count + 1
                end
            end
        end
    end
    if count > 1 then
        return true
    end
end


