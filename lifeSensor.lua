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

Screen:ClearElements() --wipe the screen clean

local centerLabel = Screen:CreateElement('TextLabel', defaultLabelProperties)
centerLabel.Text = "+"  --draw the center

local function movePlayerLabel(label)
    label.position = UDim2.new(0.5, playerPosition.x*screenSize.x/1000, 0.5, playerPosition.z*screenSize.y/1000)
end

local playerLabels = {}
local function updateReadings()
    local screenSize = Screen:GetDimensions()
    local reading = LifeSensor:GetReading()
    for playerName, playerPosition in pairs(reading) do
        if playerLabels[playerName] == nil then --create new label for new player
            playerLabels[playerName] = Screen:CreateElement('TextLabel', defaultLabelProperties)
        end
        movePlayerLabel(playerLabels[playerName])
        reading.remove(playerName) --remove scanned players from cache
    end
    for playerName, playerPosition in pairs(reading) do --delete labels from nonexistant players 
        playerLabels[playerName]:Destroy()
        playerLabels.remove(playerName)
    end
end

GetPort(1):Connect("Triggered", updateReadings)