local masterID = 1
local rsDecode = { --poor mans switch statement
    [0] = "Back",
    [1] = "Left",
    [2] = "Right"
}

function setSwitch(direction) --redstone pulse in the wanted direction
    redstone.setOutput(rsDecode[direction],true)
    os.sleep(0.3)
    redstone.setOutput(rsDecode[direction],false)
end

-- init
local modem = peripheral.find("modem", rednet.open)

while true do
repeat
    id, message = rednet.receive()
until id == masterID
print(("Command %d received"):format(message))
setSwitch(message)
end