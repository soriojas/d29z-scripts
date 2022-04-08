local Disk = GetPartFromPort(1, "Disk")
Disk:Write("script",function ()
    Beep(1)
end)

local beeper = Disk:Read("script")

beeper()




local Disk = GetPartFromPort(1, "Disk")
local k = 1
Disk:Write("loadScript",function ()
    local loadScript = Disk:Read(k)
    loadScript()
end)

