function demodulate(port,frequency)
	local connection
	local byte = 0 --NUL, 0000 0000

	local initialTime = tick()
	local deltaTime = tick()-initialTime
	for i="1e-14",8*frequency,deltaTime do
		connection = port:Connect("Triggered", function()
            byte = bit32.replace(byte,1,math.ceil(i/frequency-1),1)
        end) 
		wait()
        deltaTime = tick()-initialTime
        connection:Unbind()
	end
	return byte
end

function modulate(port,frequency,byte)
	for i=0,7 do
		if bit32.extract(byte,i,1) == 1 then
			TriggerPort(port)
		end
		wait(frequency)
	end
end

--[[
hasn't been tested

encode with string.byte(string) and decode with string.char(byte)
]]