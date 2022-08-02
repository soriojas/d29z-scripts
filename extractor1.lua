local Extractor = GetPartFromPort(1, "Extractor")
local Ores = {"Stone", "Flint", "Ruby", "Sulfur", "Grass", "Oil"}
local index = 1
while wait(2) do
    Extractor:Configure({MaterialToExtract=Ores[index]}) --do extractor things

    index = index + 1 --count
    if not Ores[index] then
        index = 1
    end
end