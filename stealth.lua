local Keyboard = GetPartFromPort(6, "Keyboard")
local Gyro = GetPartFromPort(7, "Gyro")
local Switch = GetPartFromPort(7, "Switch")

local keyDown=false
local door = CFrame.new(0,999999979520,0)
local hinge = CFrame.new()
local speed = 0.025
local offset = hinge:inverse() * door; -- offset before rotation

local function turn(yaw, pitch)
    hinge = hinge * CFrame.Angles(yaw, 0, pitch) -- rotate the hinge
    door = hinge * offset -- apply offset to rotated hinge
    Gyro:PointAt(door.Position)
end

turn(0,math.rad(60))

local function onKeyDown(key)
    Switch:Configure({SwitchValue=true})
    keyDown = true
    while keyDown == true do
        local yaw = {["w"] = 0,["s"] = 0,["a"] = 1,["d"] = -1}
        local pitch = {["w"] = -1,["s"] = 1,["a"] = 0,["d"] = 0}
        turn(yaw[key]*speed,pitch[key]*speed)
        wait()
    end
end

local function onKeyUp(key)
    Switch:Configure({SwitchValue=false})
    local keys = {[Enum.KeyCode.W] = true, [Enum.KeyCode.S] = true, [Enum.KeyCode.A] = true, [Enum.KeyCode.D]= true}
    if keys[key] == true then
        keyDown = false
    end
end

GetPort(1):Connect("Triggered", function() onKeyDown("w") end)
GetPort(2):Connect("Triggered", function() onKeyDown("s") end)
GetPort(3):Connect("Triggered", function() onKeyDown("a") end)
GetPort(4):Connect("Triggered", function() onKeyDown("d") end)
Keyboard:Connect("KeyPressed", onKeyUp)