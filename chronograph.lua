local Sign = GetPartFromPort(1, "Sign")
GetPort(1):Connect("Triggered", function()
    local initialTick = tick()
    Sign:Configure({SignText="--"})
    while wait() do
        local Glass = GetPartFromPort(2, "Glass")
        if Glass == nil then
            Sign:Configure({SignText=tick()-initialTick})
            break
        end
    end
end)