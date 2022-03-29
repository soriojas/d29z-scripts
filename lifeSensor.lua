local Screen = GetPartFromPort(1, 'Screen') -- assigning the screen on port 1 to a variable
local LifeSensor = GetPartFromPort(2, 'LifeSensor')
local Instrument = GetPartFromPort(3, 'Instrument')
local scale = 0.05
local screenSize = Screen:GetDimensions()

local myPosition = Instrument:GetReading()
local myPosition = myPosition:gsub("%s+", "") --space remover
local x, y, z = myPosition:match("([^,]+),([^,]+),([^,]+)")

Screen:ClearElements() -- clear all elements already on the screen so there arent any old elements on it
    Screen:CreateElement('TextLabel', {        
        AnchorPoint = Vector2.new(0.5, 0.5);
        BackgroundTransparency = 1;
        Position = UDim2.new(0.5, x * scale * screenSize.x/1000 , 0.5, z  * scale * screenSize.y/1000);
        Size = UDim2.new(0,100,0,100);
        Text = '+';
        TextSize = 20;
        TextScaled = false;
        TextColor3 = Color3.new(1, 1, 10);
})

local reading = LifeSensor:GetReading()
for playerName, position in pairs(reading) do
    Screen:CreateElement('TextLabel', {
        AnchorPoint = Vector2.new(0.5, 0.5);
        BackgroundTransparency = 1;
        Position = UDim2.new(0.5, position.x * scale * screenSize.x/1000, 0.5, position.z * scale * screenSize.y/1000 );
        Size = UDim2.new(0,100,0,100);
        Text = string.sub(playerName, 1, 2);
        TextSize = 20;
        TextScaled = false;
        TextColor3 = Color3.new(1, 0, 0);
    })
end

--0.05 scale when 20x20 studs or 1000x1000px


