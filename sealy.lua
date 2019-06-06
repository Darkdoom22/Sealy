_addon.name = 'Sealy'
_addon.author = 'Darkdoom'
_addon.version = '0.0.1'
_addon.command = 'Sealy'
_addon.commands = {'start','stop','help'}
_addon.language = 'english'

require('logger')
require('coroutine')
packets = require('packets')
res = require('resources')
running = false

	function Sealy_command(...)
	if #arg > 3 then
		windower.add_to_chat(167, 'Invalid command. //Sealy help for valid options.')
	elseif #arg == 1 and arg[1]:lower() == 'start' then
		if running == false then
			running = true
			windower.add_to_chat(200, 'Sealy starting')
			find()
		else
			windower.add_to_chat(200, 'Sealy is already running.')
		end
	elseif #arg == 1 and arg[1]:lower() == 'stop' then
		if running == true then
			running = false
			windower.add_to_chat(200, 'Sealy stopped')
		else
			windower.add_to_chat(200, 'Sealy not running.')
			running = false
		end
	elseif #arg == 1 and arg[1]:lower() == 'help' then
		windower.add_to_chat(200, 'Available Options:')
		windower.add_to_chat(200, '  //Sealy start - Does the thing')
		windower.add_to_chat(200, '  //Sealy stop - Does not do the thing')
		windower.add_to_chat(200, '  //Sealy help -  Avail Commands: //Sealy Start,stop,help. ')
	end
end
	
windower.register_event('addon command', Sealy_command)
windower.register_event('incoming text', function(new, old)
	local info = windower.ffxi.get_info()
	if not info.logged_in then
		return
	else
		check_incoming_text(new)
	end
end)

windower.register_event("chat message", function(message, mode)

	if mode == 3 or mode == 4 then
	
	if type(message) == 'string' then

	if message == 'goseal' then
	running = true
	Get_Seal()
	windower.add_to_chat(167, 'Got it!')
	else 
	return
	end
end
end
end)







function check_incoming_text(original)
	local org = original:lower()
	
	if org:find('goseal') ~= nil then
		running = true
		Get_Seal()
		end
end

function Get_Seal() 



log('Getting seal and tping')

local gob = windower.ffxi.get_mob_by_name('Shiftrix')
    if gob then
	
        local p = packets.new('outgoing', 0x01A, {
            ['Target'] = gob.id,
            ['Target Index'] = gob.index,
        })
        packets.inject(p)

end

	coroutine.sleep(5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(4)
	
	windower.send_command('setkey down down')
	coroutine.sleep(.05)
	windower.send_command('setkey down up')
	coroutine.sleep(.5)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(3)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(3)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(3)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(3)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(3)
	
	windower.send_command('setkey up down')
	coroutine.sleep(.05)
	windower.send_command('setkey up up')
	coroutine.sleep(.1)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	coroutine.sleep(4)
	
	windower.send_command('setkey enter down')
	coroutine.sleep(.05)
	windower.send_command('setkey enter up')
	
	 
	log('Seals obtained') 
	running = false
	end




	