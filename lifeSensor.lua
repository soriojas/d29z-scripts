--incomplete

local Screen = GetPartFromPort(1, 'Screen') print(Screen)
local LifeSensor = GetPartFromPort(1, 'LifeSensor') print(LifeSensor)
--local myPosition = LifeSensor.Position
local defaultLabelProperties = {        
    AnchorPoint = Vector2.new(0.5, 0.5);
    Position = UDim2.new(0.5, 0, 0.5, 0);
    BackgroundTransparency = 1;
    Size = UDim2.new(0,100,0,100);
    Text = '+';
    TextSize = 20;
    TextScaled = false;
    TextColor3 = Color3.new(1, 1, 10);
}

Screen:ClearElements() --wipe the screen clean

local centerLabel = Screen:CreateElement('TextLabel', defaultLabelProperties)

local function movePlayerLabel(label, position) --todo: make label pos relative to player pos
    label.position = UDim2.new(0.5, playerPosition.x*screenSize.x/1000, 0.5, playerPosition.z*screenSize.y/1000)
end

local playerLabels = {}
local function updateReadings()
    local screenSize = Screen:GetDimensions()
    local reading = LifeSensor:GetReading()
    if #reading >= #playerLabels then
        for name, position in pairs(reading) do
            if playerLabels[name] == nil then
                playerLabels[name] = Screen:CreateElement('TextLabel', defaultLabelProperties)
            end
            movePlayerLabel(playerLabels[name], position)
        end
    else
        for name, label in playerLabels do
            if reading[name] == nil then
                label:Destroy()
                playerLabels.remove(name)
            end
        end
    end
end

GetPort(1):Connect("Triggered", updateReadings)


-- for playerName, playerPosition in pairs(reading) do --delete labels from nonexistant players 
--     playerLabels[playerName]:Destroy()
--     playerLabels.remove(playerName)
-- end