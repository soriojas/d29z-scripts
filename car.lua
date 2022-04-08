local Motor = GetPartFromPort(3, 'Motor')

local function forward()
    Motor:Configure({Power=1})
end

local function stop()
    Motor:Configure({Power=0})
end

local function backward()
    Motor:Configure({Power=-1})
end

GetPort(1):Connect("Triggered", forward)
GetPort(2):Connect("Triggered", stop)
GetPort(3):Connect("Triggered", backward)