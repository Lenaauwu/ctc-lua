local switches = require("data/switches")

local switchController = {}

function switchController.changeSwitch(switchId, direction)
    return rednet.send(switches.data()[switchId].computerID, direction)
end

function switchController.resetSwitch(switchID)
    switchController.changeSwitch(switchID, switches.data()[switchID]["defaultState"] or 0)
end

return switchController