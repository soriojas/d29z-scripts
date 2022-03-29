function callback(port)
    local disk = GetPartFromPort(port, "Disk")
    print(disk:Read("Key"))
    Beep(1)
end

GetPort(4001):Connect("Triggered", callback)