# TUTORIAL: WIRELESS PORTS

This short tutorial teches you how to make wireless ports. This is possible due to two things. Firstly, a callback function to a Triggered event has its first argument set to the part from which the trigger originated. Secondly, the GetPartFromPort() function can accept a Port instead of a PortID.

Consider a basic example with two Microcontrollers. Each Microcontroller is connected to one Port, which is connected to one Antenna. Both Antennas have the same AntennaID. The left Port is also connected to a Disk. This setup is shown in Figure 1:

![The left Microcontroller writes something to the Disk and triggers its connected Port. The code is shown in Script 1:](https://i.imgur.com/EwzV1z3.png)

```
local disk = GetPartFromPort(1, "Disk")
disk:Write("Key", "Hello World!")

TriggerPort(1)
```

The right Microcontroller listens for triggers to its connected Port. The Triggered event callback function has one argument, which will be set internally to the part that originated the trigger. In this case, this is the Port of the left Microcontroller. The right Microcontroller can then access the left Microcontroller's Disk by querying the returned Port. The code is shown in Script 2:

```
function callback(port)
    
    local disk = GetPartFromPort(port, "Disk")
    print(disk:Read("Key"))
end
```

GetPort(1):Connect("Triggered", callback)

This will print "Hello World!" to the F9 console. The right Microcontroller accessed the Disk connected to the Port of the left Microcontroller, with no physical connection between the two. This therefore results in a wireless Port that is as fast as a normal Port. The future is now.