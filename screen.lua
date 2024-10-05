local screen = GetPartFromPort(1, "Screen")
local screenSize = screen:GetDimensions()

local textBox = screen:CreateElement('TextLabel', {        
    AnchorPoint = Vector2.new(0, 0);
    BackgroundTransparency = 0;
    Position = UDim2.new(0, 50, 0, 0);
    Size = UDim2.new(0,50,0,50); -- 1 stud is 50px
    Text = "Hello!";
    TextSize = 20;
    TextScaled = false;
    TextColor3 = Color3.new(1, 1, 10);
}) --see https://robloxapi.github.io/ref/class/TextLabel.html

wait(2)

textBox.Text = "Bye."

wait(2)

screen:ClearElements()