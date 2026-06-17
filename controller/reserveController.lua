local systemState = require("data/state")
local paths = require("data/paths")

local switchController = require("controller/switchController")
local signalController = require("controller/signalController")

local reserveController = {}


function reserveController.isPathFree(pathName)

    local blocks = {}
    for _, signal in pairs(paths.data()[pathName].signals) do
        for _, block in pairs(signalController.getSignalBlocks(signal)) do
            blocks[#blocks+1] = block
        end
    end

    for _, block in pairs(blocks) do
        if systemState.isLockedBlock(block) then
            return false
        end
    end

    -- check signals and switches?

    return true
end

function reserveController.setPath(pathName,state)
    systemState.pathState(paths.data()[pathName],state)
    -- add blocks, switches and signals to systemState
    for _, data in pairs(paths.data()[pathName].switches) do
        switchController.changeSwitch(data.switchID, data.state) 
    end

    -- do signal stuff
end



return reserveController