local modem = peripheral.find("modem",rednet.open)
local serverID = settings.get("client_ServerID")
local computerSides = redstone.getSides()

local connectedSensors = {
    ["Right"] = { --detectedSensor
        block = "302", --detectedBlock
        isEntry = false 
    },
    ["Left"] = {
        block = "302",
        isEntry = false 
    }
    ["Back"] = {
        block = "301",
        isEntry = false 
    },
    ["Top"] = {
        block = "301",
        isEntry = false 
    }
}

local connectedBlocks = {
    --["302"] = 0
}

function getBlockOccupancy(blockName)
    if connectedBlocks[blockname] > 0 then
        return true
    else
        return false
    end
end

function waitForRednet()    
    while true do
        id, message = rednet.receive()
        if id == serverID then
            if message[1] == "getBlockOccupancy" then
                    rednet.send(serverID, getBlockOccupancy(message[2]))
            end
            if message[1] == "clearBlock" then

        end
    end
    return 1
end

parallel.waitForAll(waitForRednet, function(spawn))
    while true do
        os.pullEvent("Redstone")    
        for i in #computerSides do
            if redstone.getInput(computerSides[i]) then
                local detectedSensor = connectedSensors[i]
                detectedBlock = detectedSensor[block]

                if getBlockOccupancy(detectedBlock) == false then
                    detectedSensor[isEntry] = true
                    connectedBlocks.insert(detectedBlock = 1)
                    rednet.send(serverID,{detectedBlock = true})

                elseif detectedSensor[isEntry] then
                    connectedBlocks[detectedBlock] = connectedBlocks[detectedBlock] + 1

                elseif getBlockOccupancy(detectedBlock) and detectedSensor[isEntry] == false then --signal high on exit sensor
                    spawn function(waitBlock = detectedBlock)
                        os.pullEvent("Redstone")
                        if redstone.getInput(i) == false then --wait for low in parallel
                            if connectedBlocks[waitBlock] == 1 then
                                connectedBlocks.remove(waitBlock)
                                rednet.send(serverID,{waitBlock = false})
                            else 
                                connectedBlocks[detectedBlock] = connectedBlocks[detectedBlock] - 1
                            end
                        end
                    end
                    
                end
            end
        end
    end
end