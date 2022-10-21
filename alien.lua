local Bin = GetPartFromPort(2, "Bin")
local Switch = GetPartFromPort(1, "Switch")

function onGyroTriggered()
    Switch:Configure({SwitchValue=true})
    wait(1)
    Switch:Configure({SwitchValue=false})
end

while wait() do
    if Bin:GetResource() ~= "Coal" and Bin:GetAmount() > 0 then
        TriggerPort(1)
        wait(1) 
        TriggerPort(1)
    end
end

GetPort(2):Connect("Triggered", onGyroTriggered)