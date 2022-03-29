local Screen = GetPartFromPort(1, 'Screen') -- assigning the screen on port 1 to a variable

Screen:ClearElements() -- clear all elements already on the screen so there arent any old elements on it
local TextLabel = Screen:CreateElement('TextLabel', {
    AnchorPoint = Vector2.new(0.5, 0.5);
    BackgroundTransparency = 1;
    Position = UDim2.new(0.5, 150, 0.5, 0);
    Size = UDim2.new(0,100,0,100);
    Text = ' ';
    TextSize = 20;  
    TextScaled = false;
    TextColor3 = Color3.new(1, 0, 0);
})

TextLabel:ChangeProperties({ -- change the text and size
    Text = 'X'
})

