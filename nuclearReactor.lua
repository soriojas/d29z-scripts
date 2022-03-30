local disk = GetPartFromPort(1, "Disk")
local interval = disk:Read("Interval")


if interval > 3 then
    disk:Write("Interval", 1)
    Beep(1)
else
    disk:Write("Interval", interval + 1)
end

disk:Write("Interval", "1")