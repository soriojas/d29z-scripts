for i=1,10 do print() end
print("Begin Script")
local Telescope = GetPartFromPort(1, "Telescope") -- methods: Signal WhenRegionLoads(), CoordinateInfo GetCoordinate(x1,y1,x2,y2)

Telescope:Configure({ViewCoordinates="0, 0, 0, 0, false"})
local CoordinateInfo = Telescope:GetCoordinate()

function dumpInfo()
    local temp = ""
    for key, value in pairs(CoordinateInfo) do
        if key ~= "Resources" then
            temp = temp..", "..key..":"..tostring(value)
        end
    end
    return temp
end

function dumpResources()
    if CoordinateInfo["Resources"] ~= nil then
        local temp = ""
        local tbl = {}
        local count = 0 --# of unique resources
        for index, value in pairs(CoordinateInfo["Resources"]) do
            temp = temp..", "..value
            if tbl[value] == nil then
                count = count + 1
            end
            tbl[value]=value
        end
        return count.. temp
    end
end

--    bugs: server returns duplicate keys or no keys at all. can be fixed over time or by calling GetCoordinate() 2 or 3 times.

local SectorA = { x = 10, y = 70 }
local SectorB = { x = 7 , y = 68 }

for sx=SectorA.x, SectorB.x,-1 do
    for sy=SectorA.y, SectorB.y,-1 do
        for rx=-10,10 do
            for ry=-10,10 do
                currentCoords= sx..","..sy..","..rx..","..ry..", false"
                Telescope:Configure({ViewCoordinates= currentCoords})
                CoordinateInfo = Telescope:GetCoordinate()
                local resources = dumpResources()
                if resources ~= nil then
                    print(sx..","..sy..","..rx..","..(ry-1).."\n"..dumpInfo().."\n"..temp)
                end
                wait()
            end
        end
    end
end

-- Telescope:Configure({ViewCoordinates= "7,70,-4,-5,false"})
-- CoordinateInfo = Telescope:GetCoordinate()
-- print(dumpInfo())

print("End Script")



--[[
35,-35,5,-7
1,-74,-2,7
]]

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

while wait(0.333) do
    local Telescope = GetPartFromPort(1, "Telescope")
    Telescope:WhenRegionLoads(callback)
end