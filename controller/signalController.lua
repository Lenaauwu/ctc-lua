local signals = require("data/signals")

local signalController = {}

function signalController.getSignalBlocks(signalID)
    return signals.data()[signalID].blocks
end

-- do more signal Stuff

return signalController