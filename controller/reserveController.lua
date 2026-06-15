local systemState = {} -- this holds all the information
local switchController = require("controller/switchController")
local signalController = require("controller/signalController")

local reserveController = {}


function reserveController.isPathFree(path)

    local blocks = {}
    for signal in path.signals do
        for block in signalController.getSignalBlocks(signal.blocks) do
            blocks[#blocks+1] = block
        end
    end

    for block in blocks do
        -- check if block is in Systemstate
        -- if true then return false
    end

    -- check signals and switches?

    return true
end

function reserveController.reservePath(path)
    -- add blocks, switches and signals to systemState
    for switch in path.switches do
        switchController.changeSwitch(switch.switchID, switch.state) 
    end

    -- do signal stuff
end


return reserveController