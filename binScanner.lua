local bins = GetPartsFromPort(1, "Bin")  --get adjacent bins
print("Found " .. #bins .. " bins.")
function callback(port) 
    local disk = GetPartFromPort(port, "Disk") --get the disk from the remote port
    for _, bin in ipairs(bins) do 
        local resource = bin:GetResource() --get the number of resources in a bin
        if not disk:Read(resource) then disk:Write(resource, 0) end --if key doesn't exist, make one
        disk:Write(resource, bin:GetAmount() + disk:Read(resource)) --sum up resources
    end
end
GetPort(4001):Connect("Triggered", callback)