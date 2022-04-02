Beep(0.1)
local Screen = GetPartFromPort(1, 'Screen') -- assigning the screen on port 1 to a variable
local LifeSensor = GetPartFromPort(1, 'LifeSensor')
local Instrument = GetPartFromPort(1, 'Instrument')
local Compass = GetPartFromPort(2, 'Instrument')
local scale = 0.25 --0.25 for 2000 studs
local screenSize = Screen:GetDimensions()

local myPosition, x, y, z
function updateMyPosition()
    myPosition = Instrument:GetReading():gsub("%s+", "") --space remover
    x, y, z = myPosition:match("([^,]+),([^,]+),([^,]+)")
end
updateMyPosition()

function stringToVector3(str)
    str:gsub("%s+", "") --space remover
    local a,b,c = str:match("([^,]+),([^,]+),([^,]+)") --comma separator
    return Vector3.new(a,b,c)
end

Screen:ClearElements() -- clear all elements already on the screen so there arent any old elements on it

local centerLabel = Screen:CreateElement('TextLabel', {        
        AnchorPoint = Vector2.new(0.5, 0.5);
        Position = UDim2.new(0.5, 0, 0.5, 0);
        Size = UDim2.new(0,100,0,100);
        Text = '^';
        BackgroundTransparency = 1;
        TextSize = 20;
        TextScaled = false;
        TextColor3 = Color3.new(1, 1, 10);
})

local labels = {}
local oldLabels = {}
while wait(0.2) do
    local reading = LifeSensor:GetReading()    
    for playerName in pairs(reading) do
        oldLabels[playerName] = nil
    end    
    for playerName in pairs(oldLabels) do
        oldLabels[playerName]:Destroy()
        oldLabels[playerName] = nil
        labels[playerName] = nil
    end
    for playerName, position in pairs(reading) do    
        if labels[playerName] then --if player exist
            labels[playerName]:ChangeProperties({ 
                Position = UDim2.new(0.5, (position.x-x) * scale * screenSize.x/1000, 0.5, (position.z-z) * scale * screenSize.y/1000)
            })
            oldLabels[playerName] = labels[playerName]
        else --add player
            Beep(0.2)
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
            labels[playerName] = newLabel
        end
    end
    local rot = stringToVector3(Compass:GetReading())
    centerLabel:ChangeProperties({
        Rotation = -rot.y
    })
    updateMyPosition()
end