Beep(0.2)
local a1 = GetPartFromPort(1, "Transporter")
local a2 = GetPartFromPort(2, "Transporter")

while wait(1) do    
    math.randomseed(tick()+4000)
    local randomnumber = math.random(1, 999)
    a1:Configure({TransporterID=randomnumber}) 
    a2:Configure({TransporterID=randomnumber})
end

--antennas go up to 9999 and transporters 999