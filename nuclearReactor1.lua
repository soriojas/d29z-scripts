local Disk = GetPartFromPort(1, "Disk")
local interval = Disk:Read("Interval")

local function insertUranium() --trigger uranium dispensers
    TriggerPort(2)
end

local function ejectUranium() --eject uranium 4 times
    for i=1,4 do TriggerPort(1) wait() end
end

if interval then --check if interval data exists on disk
    if interval >= 100 then
        Disk:Write("Interval", 1) --reset counter
        ejectUranium()
        insertUranium()
    else
        Disk:Write("Interval", interval + 1)
    end
else --initialize data on disk
    Disk:Write("Interval", 1)
end