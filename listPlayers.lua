local Screen = GetPartFromPort(1, 'Screen') -- assigning the screen on port 1 to a variable
local LifeSensor = GetPartFromPort(2, 'LifeSensor')

Screen:ClearElements() -- clear all elements already on the screen so there arent any old elements on it
local TextLabel = Screen:CreateElement('TextLabel', {
    AnchorPoint = Vector2.new(0.5, 0.5);
    Position = UDim2.fromScale(0.5, 0.5);
    Size = UDim2.fromScale(1, 1);
    Text = ' ';
    TextSize = 20;
    TextScaled = false;
})

local reading = LifeSensor:GetReading()
local out = "Players: "
for playerName, position in pairs(reading) do
  out = out .. string.sub(playerName, 1, 2) .. ", "
  break
end


TextLabel:ChangeProperties({ -- change the text and size
    Text = out;
    TextSize = 25
})

