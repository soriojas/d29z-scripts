local Disk = GetPartFromPort(1, "Disk")
local interval = Disk:Read("Interval")

if interval then 
    print("found")
    if interval >= 3  then 
        Disk:Write("Interval", 1)
        Beep(1.2)
        TriggerPort(1)
    else -- 
        Disk:Write("Interval", interval + 1)
        Beep(0.2)
    end
    print(interval)
else
    print("not found")
    Disk:Write("Interval", 1)   
end