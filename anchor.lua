local Microphone = GetPartFromPort(1, "Microphone") -- Gets microphone attached to port 1
local Anchor = GetPartFromPort(1, "Anchor") -- Gets anchor attached to port 1
local Owner = "namehere"
local Enabled = false

-- Connects to the microphone, adding an event to it that will listen for chat input
Microphone:Connect("Chatted", function(Player, Message) 
    if Player == Owner then return end
    if Message:lower():sub(0, 6) == "anchor" then -- If the message starts with anchor
        Enabled = true
        Anchor:Configure({Anchored=true})
    elseif Message:lower():sub(0, 6) == "unanchor" then 
        Enabled = false
    end
    while not Enabled do --repeatedly disable the anchor
        Anchor:Configure({Anchored=false})
        wait(2)
    end
end)