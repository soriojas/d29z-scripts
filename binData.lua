local disk = GetPartFromPort(4001, "Disk")
local inventory = disk:ReadEntireDisk()
disk:ClearDisk()

print("You have:")

TriggerPort(4001)
for k,v in pairs(inventory) do
    print(k.." = "..v)
end

print("\n")

