print(("\n"):rep(40))
--thanks to the writer of print_r.lua for making tables less of a headache to look at
function print_r (t) 
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end
-----------------------------------------

local recentData

function dumpTable(table)
    local temp = ""
    for key, value in pairs(table) do
        if type(value) == "table" then
            temp = temp.." || "..key..":{{"..dumpTable(value).."}}"
        else
            temp = temp.." || "..key..":"..tostring(value)
        end
    end
    recentData = temp
    return temp
end

local Telescope = GetPartFromPort(1, "Telescope")

function callback(regionData)
    --print(dumpTable(regionData))
    print(print_r(regionData))
    --recentData = true
end

function update()
    while recentData == nil do
        Telescope:WhenRegionLoads(callback)
        --Telescope:Configure({ViewCoordinates="7, 70, -4, 5, false"})
        wait(0.333)
    end
end

update()