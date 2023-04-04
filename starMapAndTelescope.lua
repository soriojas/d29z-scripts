print("Begin Script")
local StarMap = GetPartFromPort(1, "StarMap") -- methods: GetSystems()[], GetBodies()[]
local Telescope = GetPartFromPort(1, "Telescope") -- methods: Signal WhenRegionLoads(), CoordinateInfo GetCoordinate(x1,y1,x2,y2)

Telescope:Configure({ViewCoordinates="0, 0, 0, 0, false"}) 
local CoordinateInfo = Telescope:GetCoordinate()

function dumpInfo()
    for key, value in pairs(CoordinateInfo) do
        print(key)
        print(value)
    end
end

function dumpResources()
    if CoordinateInfo["Resources"] ~= nil then
        for index, value in pairs(CoordinateInfo["Resources"]) do
            print(value)
        end        
    end
end

function dumpBodies()
    for key, value in StarMap:GetBodies() do
        print(key) --coordinates
        print(JSONEncode(value)) --type
    end
end

function dumpSystems()
    for key, value in StarMap:GetSystems() do
        print(key) --coordinates
        print(JSONEncode(value)) --type
    end
end

local SectorA = { x = -78 , y = -83 }
local SectorB = { x = -78 , y = -83 }

for sx=SectorA.x, SectorB.x do
    for sy=SectorA.y, SectorB.y do
        for rx=-10,10 do
            for ry=1,10 do
                print(".")
                Telescope:Configure({ViewCoordinates=sx..","..sy..","..rx..","..ry.."false"}) 
                CoordinateInfo = Telescope:GetCoordinate()
                dumpResources()
                dumpInfo()
                wait()
            end
        end
    end
end