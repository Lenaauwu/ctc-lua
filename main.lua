local switches = require("data/switches")
local modem = peripheral.find("modem",rednet.open)

function sendCommand(switchName, direction)
    return rednet.send(switches.data()[switchName]["computerID"],direction) -- 0,1,2 || straight, left, right || back, left, right
end
