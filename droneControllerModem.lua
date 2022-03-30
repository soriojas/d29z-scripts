local modem = GetPartFromPort(4001, "Modem")

modem:Connect("MessageSent", function(str)
    print(str)
end)