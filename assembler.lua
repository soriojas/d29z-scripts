local disk = GetPartFromPort(4001, "Disk")
local inventory = disk:ReadEntireDisk()
disk:ClearDisk()

local constraints = {
    ["Antenna"] = {
        {"Wire",'=',1000} ---Incomplete
    }
}

TriggerPort(4001)
for k,v in pairs(inventory) do
    
end


