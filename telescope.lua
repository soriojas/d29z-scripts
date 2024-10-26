function dumpTable(table)
    local temp = ""
    for key, value in pairs(table) do
        print(type(value))
        if type(value) == table then
            temp = temp..dumpTable(value)
        else
            temp = temp..", "..key..":"..tostring(value)
        end
    end
    return temp
end

function callback(regionData)
    print(dumpTable(regionData))
end

function update()
    while wait(0.333) do
        local Telescope = GetPartFromPort(1, "Telescope")
        Telescope:WhenRegionLoads(callback)
    end
end

local Telescope = GetPartFromPort(1, "Telescope")
Telescope:WhenRegionLoads("(A) ")
Telescope:Configure({ViewCoordinates="0, 0, 0, 0, false"})
Telescope:WhenRegionLoads("(B) ")
Telescope:Configure({ViewCoordinates="0, 0, 0, 0, false"})
Telescope:WhenRegionLoads("(C) ")