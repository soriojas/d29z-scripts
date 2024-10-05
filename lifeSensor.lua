local Screen = GetPartFromPort(1, 'Screen')
local LifeSensor = GetPartFromPort(2, 'LifeSensor')
local myPosition = LifeSensor.CFrame.Position
local defaultLabelProperties = {        
    AnchorPoint = Vector2.new(0.5, 0.5);
    Position = UDim2.new({0.5, 0, 0.5, 0});
    BackgroundTransparency = 1;
    Size = UDim2.new(0,100,0,100);
    Text = '+';
    TextSize = 20;
    TextScaled = false;
    TextColor3 = Color3.new(1, 1, 10);
}

Screen:ClearElements()
local centerLabel = Screen:CreateElement('TextLabel', defaultLabelProperties)
centerLabel.Text = "+"

local reading = LifeSensor:GetReading()
local playerCache = {}
local playerLabels = {}
for playerName, playerPosition in pairs(reading) do
    local screenSize = Screen:GetDimensions()
    playerLabels[playerName] = Screen:CreateElement('TextLabel', defaultLabelProperties)
    playerLabels[playerName] = UDim2.new(0.5, playerPosition.x*screenSize.x/1000, 0.5, playerPosition.z*screenSize.y/1000)
end