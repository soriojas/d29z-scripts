local disk = GetPartFromPort(4001, "Disk")
disk:Write("Key", "Hello World!")

TriggerPort(4001)
