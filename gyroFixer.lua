local Gyros = GetPartsFromPort(1, "Gyro")

for Gyro in pairs(Gyros) do
    Gyro:Configure({MaxTorque="120000,120000,120000"})
end