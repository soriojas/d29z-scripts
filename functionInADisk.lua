local Disk = GetPartFromPort(1, "Disk")
Disk:Write("script",function ()
    Beep(1)
end)

local beeper = Disk:Read("script")

beeper()