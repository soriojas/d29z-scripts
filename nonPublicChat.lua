local Keyboard = GetPartFromPort(1, "Keyboard")
local Speaker = GetPartFromPort(1, "Speaker")

local function chat(text)
    text = text:sub(1, -2)
    Speaker:Chat(text)
end

Keyboard:Connect("TextInputted", chat)

Keyboard:Connect("KeyPressed", function(key) --only works when kb attached to a seat
    Beep(0.4)
end)