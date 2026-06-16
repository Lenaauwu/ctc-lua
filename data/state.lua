local state = {}
local signalController = require("controller/signalController")

local lockedSwitches = {}
local lockedSignals = {}
local lockedBlocks = {}

function state.lockPath(path)
    for _, switch in pairs(path.switches) do
        lockedSwitches[switch.switchID] = true
    end

    for _, signal in pairs(path.signals) do
        lockedSignals[signal] = true

        for _, block in pairs(signalController.getSignalBlocks(signal)) do
            lockedBlocks[block] = true
        end
    end
end

function state.unlockPath(path)
    for _, switch in pairs(path.switches) do
        lockedSwitches[switch.switchID] = false
    end

    for _, signal in pairs(path.signals) do
        lockedSignals[signal] = false

        for _, block in pairs(signalController.getSignalBlocks(signal)) do
            lockedBlocks[block] = false
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