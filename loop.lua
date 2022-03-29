local Anchor = GetPartFromPort(3, "Anchor")
local val = true

while wait(0.2) do
    if val then
        val = false
    else
        val = true
    end
    Anchor:Configure({Anchored=val})
end