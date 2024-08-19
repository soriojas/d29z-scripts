function demodulate(port,frequency)
	local connection
	local byte = 0 --NUL, 0000 0000

	local initialTime = tick()
	local deltaTime = tick()-initialTime
	for i="1e-14",8*frequency,deltaTime do
		connection = port:Connect("Triggered", function()
            byte = bit32.replace(byte,1,math.floor(i/frequency),1)
        end) 
		wait()
        deltaTime = tick()-initialTime
        connection:Unbind()
	end
	return byte
end