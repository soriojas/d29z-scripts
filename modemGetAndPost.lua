local Modem = GetPartFromPort(1,"Modem")
Modem:PostRequest("theworld", "Hello World!") --(domain, message)
print(Modem:GetRequest("theworld")) --(domain)