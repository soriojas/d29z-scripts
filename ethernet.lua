local StorageSensor = GetPartFromPort(1, 'StorageSensor')
local Filter = GetPartFromPort(1, 'Filter')

Filter:Configure({Filter='Copper'})
GetPort(1):Connect("Triggered", function ()
    Beep(1)
end)