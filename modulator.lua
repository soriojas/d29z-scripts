--hypothetical garbage. doesn't do anything.

toastbread = coroutine.create(function(frequency)
    local finalTime = frequency*8
	initialTime = tick()
	local deltaTime=tick()-initialTime
	while deltaTime<=finalTime do
		print("Toasting bread for "..deltaTime.." seconds.\n")
		coroutine.yield()
		deltaTime=tick()-initialTime
	end
	print("Bread is ready!")
end)

sequence = {0, 0, 0, 0, 0, 0, 0, 0}

encode = coroutine.create(function ()
    local initialTime = tick()
	local deltaTime=tick()-initialTime
    for i=0.001,8,deltaTime do
    	sequence
		coroutine.yield()
    end
end)

local connection = GetPort(1):Connect("Triggered", callback)

function callback()
	connection:Unbind()
	connection = GetPort(1):Connect("Triggered", function ()
		sequence[i]=1
	end)	
	while coroutine.resume(encode) do

	end
end


function ioRead() --frequency is 1Hz
	local connection
	local sequence = {0, 0, 0, 0, 0, 0, 0, 0}

	function one(i)
		sequence[math.ceil(i)]=1
	end

	local iT = tick()
	local dT=tick()-iT
	for i=0.001,8,dT do
		connection = GetPort(1):Connect("Triggered", one(i)) 
		--connects Port 1's "Triggered" event to function "one()"
		dT=tick()-iT
		wait()
	end
	connection:Unbind() --disconnects the event

	return sequence
end

