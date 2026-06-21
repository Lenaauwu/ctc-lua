local modem = peripheral.find("modem",rednet.open)
local gfm1 = "Right"
local gfm2 = "Left"
local serverID = settings.get(client_ServerID)
local computerSides = redstone.getSides()

local connectedSensors = {
    ["Right"] = {
        block = "302",
        isEntry = false 
    },
    ["Left"] = {
        block = "302",
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
    repeat
    id, message = rednet.receive()
    until id == serverID
    if message[1] == "getBLockOccupancy" then
            rednet.send(serverID, getBlockOccupancy(message[2]))
    end
    return true
end

function waitForRedstone(side)
    os.pullEvent("Redstone")
    for i in #computerSides do
        if redstone.getInput(computerSides[i]) then
            detectedSensor = connectedSensors[i]
            detectedBlock = detectedSensor[block]
            if connectedBlocks[detectedBlock] == nil then
                detectedSensor[isEntry] = true
                connectedBlocks.insert(detectedBlock = 1)
            elseif detectedSensor[isEntry] then
                connectedBlocks[detectedBlock]

end

while true do
    parallel.waitForAny(waitForRedstone,waitForRednet)
end