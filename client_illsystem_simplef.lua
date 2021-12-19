local QBCore = exports['qb-core']:GetCoreObject()
local infected = {}
local chance_to_get_infected = 50
local chance_to_get_corona,chance_to_get_fever,chance_to_get_cancer = 100,30,15 
local effected_fever,effected_cancer,effected_corona = false,false,false

local function corona_effected()
    if not effected_corona then
        effected_corona = true
        SetPedMotionBlur(PlayerPedId(), true)
   
    end
    CreateThread(function ()
        while effected_corona do
            RequestAnimDict('timetable@gardener@smoking_joint')
            Wait(25000)
            local player = PlayerPedId()
            local chance =  math.random(1,100)
            if chance <= 49 then
                TaskPlayAnim(player, "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
                Citizen.Wait(2000)
                ClearPedTasks(player)

            elseif chance >= 50 and chance <= 60 then
                TaskPlayAnim(player, "timetable@gardener@smoking_joint", "idle_cough", 8.0, 8.0, -1, 50, 0, false, false, false)
                Citizen.Wait(2200)
				TriggerServerEvent('sneezeSync')
                ClearPedTasks(player)
            else
                if math.random(1,100) < 50 then
                    QBCore.Functions.Notify("Feeling really sick!", "error")
                    SetEntityHealth(player,GetEntityHealth(player) - 1)
                    ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 0.1)
                    Wait(5000)
                    ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 0.0)
                else
                    QBCore.Functions.Notify("You have a bad fever!", "error")
                    SetEntityHealth(player,GetEntityHealth(player) - 2)
                    ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 0.1)
                    Wait(5000)
                    ShakeGameplayCam("FAMILY5_DRUG_TRIP_SHAKE", 0.0)

                end

                Wait(25000)
            end

        end
    end)
end






RegisterNetEvent('sneeze', function(playerId)
	local playerPed = GetPlayerPed(GetPlayerFromServerId(playerId))
	local particleDictionary = "cut_bigscr"
	local particleName = "cs_bigscr_beer_spray"

	RequestNamedPtfxAsset(particleDictionary)

	while not HasNamedPtfxAssetLoaded(particleDictionary) do
		Citizen.Wait(1)
	end

	SetPtfxAssetNextCall(particleDictionary)
	local bone = GetPedBoneIndex(playerPed, 47495)
	local effect = StartParticleFxLoopedOnPedBone(particleName, playerPed, -0.1, 0.5, 0.5, -90.0, 0.0, 20.0, bone, 1.0, false, false, false)

	Citizen.Wait(1500)
	StopParticleFxLooped(effect, 0)

end)

local function fever_effected()
    if not effected_fever then
        effected_fever = true
    end
    CreateThread(function ()
        while effected_fever do
            Wait(5000)
            print('effected by fever')
        end
    end)
end


local function cancer_effected()
    if not effected_cancer then
        effected_cancer = true
    end
    CreateThread(function ()
        while effected_cancer do
            Wait(5000)
            print('effected by cancer')
        end
    end)
    
end
CreateThread(function ()
    while true do
        Wait(1000)
        if math.random(1,100) <= chance_to_get_infected and not effected_fever and not effected_cancer and not effected_corona then
            local get_disease_chance = math.random(1,100)
            if get_disease_chance <= chance_to_get_corona and  get_disease_chance > chance_to_get_cancer and not effected_fever then
                print("corona")
                corona_effected()
            elseif get_disease_chance <= chance_to_get_cancer and not effected_cancer then
                print("cancer")
                cancer_effected()
            elseif get_disease_chance <= chance_to_get_fever and  get_disease_chance > chance_to_get_corona and not  effected_corona then
                print("fever")
                fever_effected()
            else
                if not effected_fever then
                    print("fever")
                    fever_effected()
                end

            end
            
        end
    end
    
end)


