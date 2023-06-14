print("Begin Script")
local Telescope = GetPartFromPort(1, "Telescope") -- methods: Signal WhenRegionLoads(), CoordinateInfo GetCoordinate(x1,y1,x2,y2)

Telescope:Configure({ViewCoordinates="-78, -93, 0, 0, false"})
local CoordinateInfo = Telescope:GetCoordinate()

function dumpInfo()
    local temp = ""
    for key, value in pairs(CoordinateInfo) do
        temp = temp..", "..key..":"..tostring(value)
    end
    print(temp)
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
        print(count.. temp)
        return true
    end
end

--    bugs: server returns duplicate keys or no keys at all. can be fixed over time or by calling GetCoordinate() 2 or 3 times.

local SectorA = { x = -48, y = 24 }
local SectorB = { x = SectorA.x , y = SectorA.y }

for sx=SectorA.x, SectorB.x,-1 do
    for sy=SectorA.y, SectorB.y,-1 do
        for rx=-10,10 do
            for ry=-10,10 do
                Telescope:Configure({ViewCoordinates=sx..","..sy..","..rx..","..ry.."false"})
                CoordinateInfo = Telescope:GetCoordinate()
                if dumpResources() then
                    print(sx..","..sy..","..rx..","..ry)
                    dumpInfo()
                end
            end
            wait()
        end
    end
end


print("End Script")



--[[
35,-35,5,-7
1,-74,-2,7
]]




