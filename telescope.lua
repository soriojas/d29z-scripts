print("Begin Script")
local Telescope = GetPartFromPort(1, "Telescope") --[[ 
    methods: Signal WhenRegionLoads() waits for data to load, CoordinateInfo GetCoordinate(x1,y1,x2,y2) 
]]
Telescope:Configure({ViewCoordinates="35, -35, 5, -7, false"})
local CoordinateInfo = Telescope:GetCoordinate()

function dumpInfo() --prints data about a planet
    for key, value in pairs(CoordinateInfo) do
        print(key)
        print(value)
    end
    while wait(2) do
        Beep(0.5)
    end
end

function dumpResources() --prints ores on a planet    
    if CoordinateInfo["Resources"] then
        for index, value in pairs(CoordinateInfo["Resources"]) do
            print(value)
        end
    end
end
