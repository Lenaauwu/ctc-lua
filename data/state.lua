local state = {}
local signalController = require("controller/signalController")

local lockedSwitches = {}
local lockedSignals = {}
local lockedBlocks = {}

function state.pathState(path,lock)
    for _, switch in pairs(path.switches) do
        lockedSwitches[switch.switchID] = lock
    end

    for _, signal in pairs(path.signals) do
        lockedSignals[signal] = lock

        for _, block in pairs(signalController.getSignalBlocks(signal)) do
            lockedBlocks[block] = lock
        end
    end
end


function state.isLockedSwitch(switchID)
    return lockedSwitches[switchID] or false
end

function state.isLockedSignal(signalID)
    return lockedSignals[signalID] or false
end

function state.isLockedBlock(blockID)
    return lockedBlocks[blockID] or false
end

function state.unlockSwitch(switchID)
    lockedSwitches[switchID] = false
end

function state.unlockSignal(signalID)
    lockedSignals[signalID] = false
end

function state.unlockBlock(blockID)
    lockedSignals[blockID] = false
end

return state