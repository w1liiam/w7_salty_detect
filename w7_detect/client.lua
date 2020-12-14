local voice = false
local check = false
local displayingPluginScreen = false

AddEventHandler("SaltyChat_TalkStateChanged", function(isTalking)
    if isTalking then
        voice = true
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

		if IsControlJustPressed(0, 0x8FD015D8) then --W
			check = true
		end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
		
		if check then 
			if not voice then
				DrawTxt(
					"~ e ~ Salty Chat eklentisi bağlı değil ~ n ~~ q ~ Team Speak Uygulamasini Acin: ~ o ~ ts3:westernrp ~ n ~~ q ~ ~ e ~ Salty Chat ~ q ~ yuklediginizden ve etkin ~ n ~ ~ o ~ discord.gg/westernrp ~ q ~ adresine gidin ve sorun yaşarsanız destek isteyin. ~ n ~~ n ~ SaltyChat kuruluysa ~ t6 ~ Bas konus ~ q ~ dugmesine basin.", 0.50, 0.0, 0.6, 0.6, true, 161, 3, 0, 255, true, 10000)
				FreezeEntityPosition(GetPlayerPed(), true)
			else
				FreezeEntityPosition(GetPlayerPed(), false)
			end
		end
    end
end)


function DrawTxt(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
 local str = CreateVarString(10, "LITERAL_STRING", str, Citizen.ResultAsLong())
	SetTextScale(w, h)
	SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
	SetTextCentre(centre)
    if enableShadow then SetTextDropshadow(1, 0, 0, 0, 255) end
	Citizen.InvokeNative(0xADA9255D, 10);
	DisplayText(str, x, y)
end