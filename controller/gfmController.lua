local trains = require("/data/trains")
local occupiedSegments = {}
local gfmController = {}

function main()
    while true do
        id, message = rednet.receive()
        occupiedSegments.insert(message)
    end
end
-- oh my god this is all wrong i gotta do axle counters
function gfmController.getState(segment)
    if occupiedSegments[segments] ~= nil then
        return true
    else 
        return false
    end
end

function autoRouting()
    --todo: like all of this lmao
end