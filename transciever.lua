function demodulate(port,frequency)
	local connection
	local byte = 0 --NUL, 0000 0000
	local t = "1e-14"

	connection = port:Connect("Triggered", function()
		byte = bit32.replace(byte,1,math.ceil(t/frequency-1),1)
	end) 

	while t <= 8 * frequency do
		t = t + frequency
		wait(frequency)
	end

	connection:Unbind()

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