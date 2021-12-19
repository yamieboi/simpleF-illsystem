local QBCore = exports['qb-core']:GetCoreObject()
local infected = {}
local chance_to_get_infected = 50
local chance_to_get_corona,chance_to_get_fever,chance_to_get_cancer = 25,30,15 
local effected_fever,effected_cancer,effected_corona = false,false,false

local function corona_effected()
    if not effected_corona then
        effected_corona = true
    end
    CreateThread(function ()
        while effected_corona do
            
        end
    end)
end


local function fever_effected()
    if not effected_fever then
        effected_fever = true
    end
    CreateThread(function ()
        while effected_fever do
            
        end
    end)
end


local function cancer_effected()
    if not effected_cancer then
        effected_cancer = true
    end
    CreateThread(function ()
        while effected_cancer do
            
        end
    end)
    
end
CreateThread(function ()
    while true do
        Wait(1000)
        if math.random(1,100) <= chance_to_get_infected then
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


