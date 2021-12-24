-- NS100#0001

local ped = PlayerPedId()
local id = GetPlayerServerId(PlayerPedId())
local author = "Author - NS100#0001"
local name = "NS100"

local sleep = 5000 -- was 1000

Citizen.CreateThread(function()
	while true do
	Citizen.Wait(5)
	local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -946.88415527344, -807.48101806641, 15.927081135559, true)

	if dist < 70 and IsPedOnFoot(PlayerPedId()) then

		sleep = 0

	drawoppon(1.350, 1.460, 1.2,1.0,0.50, "Playing At ~r~Park Ramps -~w~ (ID: " .. GetPlayerServerId(NetworkGetEntityOwner(GetPlayerPed(-1))) .. ') - ~w~'.. GetPlayerName(PlayerId()), 255, 255, 255, 255)
	end
end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(100)

		local dist = GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -946.88415527344, -807.48101806641, 15.927081135559, true) -- dist from skate ramps

		if dist < 20 then

         Citizen.Wait(700)

    if IsEntityDead(PlayerPedId()) then 
		print(author)
		DoScreenFadeOut(800)
		SetPlayerInvincible(ped, true)
		print("you are dead cuddi")
		Citizen.Wait(1300)
        Revive(ped)

		SetEntityCoords(ped, -958.81219482422, -779.43450927734, 17.836095809937) -- where you revive at
		SetEntityHeading(ped, 230.6388092041) 

		print("Alive!")
    else 
        if not IsEntityDead(PlayerPedId()) then 
            Citizen.Wait(6000)
        end
    end
end
end -- dist
end)








function Revive(ped)
        if ped ~= nil and ped ~= 0 then
            local coords = GetEntityCoords(ped)
            local heading = GetEntityHeading(ped)
            DoScreenFadeOut(800)
            SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
            NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
            SetPlayerInvincible(ped, false)
            ClearPedBloodDamage(ped)
            DoScreenFadeIn(800)
    end
end


function drawoppon(x,y ,width,height,scale, text, r,g,b,a, outline)
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour( 255,255,255, 255 )
	SetTextDropShadow(255, 255, 255, 255,255)
	SetTextEdge(255, 255, 255, 255, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - width/2, y - height/2 + 0.005)
end
