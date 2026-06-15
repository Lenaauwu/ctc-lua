local paths = require("data/paths")

local pathController = {}

function pathController.isPath(pathID)
    return paths.data()[pathID] ~= nil
end

function pathController.getPath(pathID)
    return paths.data()[pathID]
end

return pathController