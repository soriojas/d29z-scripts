--INCOMPLETE
local Disk = GetPartFromPort(1, "Disk")
local Instrument = GetPartFromPort(1,"Instrument")

local currentTime = Instrument:GetReading()
local lastTime = Disk:Read("LastTime")

function timeToSeconds(time) -- time in WoS is 24 minutes per day/night cycle
    local mm, ss, xx = time:match("([^:]+):([^:]+):([^:]+)")
    return tonumber(mm) * 60 + tonumber(ss)
end

function timeDisplacement(time1, time2)
    local displacement = time1 - time2
    if time1 >= time2 then
        return time1-time2
    else
        return (24*60) - time2 + time1
    end
end

print(timeToSeconds(currentTime))

if lastTime then --check if data exists
    if true then --total time <
        Beep(1.2)
        TriggerPort(1)
    else --
        Beep(0.2)
    end
else --initialize data
    Disk:Write("LastTime", currentTime)
end