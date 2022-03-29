local modem = GetPartFromPort(101, "Modem")

modem:Connect("MessageSent", function(str)
    print(str)
end)