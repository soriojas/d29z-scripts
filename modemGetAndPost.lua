local Modem = GetPartFromPort(1,"Modem")
Modem:PostRequest("theworld", "Hello World!")
print(Modem:GetRequest("theworld"))