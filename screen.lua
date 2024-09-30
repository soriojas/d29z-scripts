local screen = GetPartFromPort(1, "Screen")
local screenSize = screen:GetDimensions()
scale = 1
print(screenSize.x)

local textBox = screen:CreateElement('TextLabel', {        
    AnchorPoint = Vector2.new(0.5, 0.5);
    BackgroundTransparency = 0;
    Position = UDim2.new(0.5, x * scale * screenSize.x , 0.5, z  * scale * screenSize.y);
    Size = UDim2.new(0,100,0,100);
    Text = "Hello world!";
    TextSize = 20;
    TextScaled = false;
    TextColor3 = Color3.new(1, 1, 10);
})

wait(2)

textBox.Text = "Goodbye world."

wait(2)

screen:ClearElements()