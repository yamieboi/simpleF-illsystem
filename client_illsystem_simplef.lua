local QBCore = exports['qb-core']:GetCoreObject()
local infected = {}
local chance_to_get_infected = 50
local chance_to_get_corona,chance_to_get_fever,chance_to_get_cancer = 25,30,15 
CreateThread(function ()
    while true do
        Wait(1000)
        if math.random(1,100) <= chance_to_get_infected then
            local get_disease_chance = math.random(1,100)
            if get_disease_chance <= chance_to_get_corona and  get_disease_chance > chance_to_get_cancer then
                print("corona")
            elseif get_disease_chance <= chance_to_get_cancer then
                print("cancer")
            elseif get_disease_chance <= chance_to_get_fever and  get_disease_chance > chance_to_get_corona then
                print("fever")
            else
                print("fever")
            end
            
        end
    end
    
end)