local Screen = GetPartFromPort(1, 'Screen') -- assigning the screen on port 1 to a variable
local LifeSensor = GetPartFromPort(2, 'LifeSensor')
local Instrument = GetPartFromPort(3, 'Instrument')
local scale = 0.25
local screenSize = Screen:GetDimensions()

local myPosition, x, y, z
function updateMyPosition()
    myPosition = Instrument:GetReading():gsub("%s+", "") --space remover
    x, y, z = myPosition:match("([^,]+),([^,]+),([^,]+)")
end
updateMyPosition()

Screen:ClearElements() -- clear all elements already on the screen so there arent any old elements on it
local centerLabel = Screen:CreateElement('TextLabel', {        
        AnchorPoint = Vector2.new(0.5, 0.5);
        Position = UDim2.new(0.5, 0, 0.5, 0);
        Size = UDim2.new(0,100,0,100);
        Text = '+';
        BackgroundTransparency = 1;
        TextSize = 20;
        TextScaled = false;
        TextColor3 = Color3.new(1, 1, 10);
})

local reading = LifeSensor:GetReading()
local labels = {}
for playerName, position in pairs(reading) do    
    local newLabel = Screen:CreateElement('TextLabel', {
        AnchorPoint = Vector2.new(0.5, 0.5);
        Position = UDim2.new(0.5, (position.x-x) * scale * screenSize.x/1000, 0.5, (position.z-z) * scale * screenSize.y/1000 );
        Size = UDim2.new(0,100,0,100);
        Text = string.sub(playerName, 1, 2);
        BackgroundTransparency = 1;
        TextSize = 10;
        TextScaled = false;
        TextColor3 = Color3.new(1, 0, 0);
    })
    table.insert(labels, newLabel)
end


while wait(0.4) do
    reading = LifeSensor:GetReading()
    updateMyPosition()
    local i = 1
    for playerName, position in pairs(reading) do    
        labels[i]:ChangeProperties({ 
            Position = UDim2.new(0.5, (position.x-x) * scale * screenSize.x/1000, 0.5, (position.z-z) * scale * screenSize.y/1000)
        })
        i = i + 1
    end
end

