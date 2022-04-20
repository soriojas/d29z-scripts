print("Begin Script")
local StarMap = GetPartFromPort(1, "StarMap") -- methods: GetSystems()[], GetBodies()[]
local Telescope = GetPartFromPort(1, "Telescope") -- methods: Signal WhenRegionLoads(), CoordinateInfo GetCoordinate(x1,y1,x2,y2)

local CoordinateInfo = Telescope:GetCoordinate(-1,-74,-2,7)

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
    local StarMap = GetPartFromPort(1, "StarMap") 
    for key, value in StarMap:GetBodies() do
        print(key) --coordinates
        print(JSONEncode(value)) --type
    end
end

dumpBodies()

