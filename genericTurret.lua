local target = ""
local LifeSensor = GetPartFromPort(1, 'LifeSensor')
local Gyro = GetPartFromPort(1, 'Gyro')
local prevPos = Vector3.new(0,0,0)

while wait() do
    local lifeforms = LifeSensor:GetReading()
    if lifeforms[target] then
        local curPos = lifeforms[target]
        local displacement = curPos - prevPos
        Gyro:PointAt(curPos+displacement*18) --11 to 13 good range for players 18 for fast ships
        prevPos = curPos
    end
end
