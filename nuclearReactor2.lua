--for planets with infinite uranium, not for anywhere else

local Disk = GetPartFromPort(1, "Disk")
local Extractor = GetPartFromPort(1, "Extractor")

local interval = Disk:Read("Interval")
local state = Disk:Read("State")

if state and interval then --check if interval data exists on disk  
else --initialize data on disk
    Disk:Write("Interval", 0)
    Disk:Write("State", "waiting")
end

while wait(1) do
    if state == "waiting" then        
        if interval < 1200 then --wait this many seconds minutes
            Disk:Write("Interval", interval + 1) --count up
        else
            Disk:Write("State", "refilling")
            Disk:Write("Interval", 0) --reset counter
        end
    elseif state == "refilling" then        
        for i=1,4 do TriggerPort(1) wait() end --eject depleted uranium
        Extractor:Configure({MaterialToExtract="Uranium"}) --mine uranium
        wait(3)        
        Extractor:Configure({MaterialToExtract="Coal"}) --dont mine uranium
        Disk:Write("State", "waiting") --start counting
    end
    interval = Disk:Read("Interval")
    state = Disk:Read("State")
end