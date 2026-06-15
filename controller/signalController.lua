local signals = require("data/signals")

local signalController = {}

function signalController.isSignal(signalId)
    return signals[signalId] ~= nil
end

function signalController.getSignalBlocks(signalID)
    return signals.data()[signalID].blocks
end

-- do more signal Stuff

return signalController