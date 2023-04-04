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
    for index, value in pairs(CoordinateInfo["Resources"]) do
        print(value)
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

local SectorA = { x = 0 , y = 0}
local SectorB = { x = 0 , y = 0}

for names = 1, 3 do
    
end