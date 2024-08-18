encode = coroutine.create(function(frequency)
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

while wait() do 
	coroutine.resume(encode, 0.2)
end

GetPort(1):Connect("Triggered", callback)

co = coroutine.create(function ()
    local initialTime = tick()
	local deltaTime=tick()-initialTime
    for i=0,8,deltaTime do
      --do something
      coroutine.yield()
    end
  end)