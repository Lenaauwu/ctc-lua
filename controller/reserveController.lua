local systemState = {} -- this holds all the information
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
        -- check if block is in Systemstate
        -- if true then return false
    end

    -- check signals and switches?

    return true
end

function reserveController.reservePath(pathName)
    -- add blocks, switches and signals to systemState
    for _, data in pairs(paths.data()[pathName].switches) do
        switchController.changeSwitch(data.switchID, data.state) 
    end

    -- do signal stuff
end


return reserveController