local paths = require("data/paths")

local pathController = {}

function pathController.isPath(pathID)
    return paths[pathID] ~= nil
end

return pathController