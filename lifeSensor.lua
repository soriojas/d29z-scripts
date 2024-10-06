--incomplete

local Screen = GetPartFromPort(1, 'Screen') print(Screen)
local LifeSensor = GetPartFromPort(1, 'LifeSensor') print(LifeSensor)
local myPosition = LifeSensor.Position
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

--todo: make label pos relative to player pos
local function movePlayerLabel(label, position)
    local scale = 0.1
    label.Position = UDim2.new(0.5, position.x * scale, 0.5, position.z * scale);
end

local playerLabels = {}
local function update()
    myPosition = LifeSensor.Position
    local screenSize = Screen:GetDimensions()
    local reading = LifeSensor:GetReading()
    if #reading >= #playerLabels then
        for name, position in pairs(reading) do
            if playerLabels[name] == nil then
                playerLabels[name] = Screen:CreateElement('TextLabel', defaultLabelProperties)
                playerLabels[name].Text = string.sub(name, 1, 3)
            end
            movePlayerLabel(playerLabels[name], position)
            print(name.." "..position.x.." "..position.y.." "..position.z)
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

GetPort(1):Connect("Triggered", update)
