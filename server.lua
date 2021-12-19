RegisterServerEvent('sneezeSync')
AddEventHandler('sneezeSync', function()
	local _source = source
	TriggerClientEvent('sneeze', -1, _source)
end)