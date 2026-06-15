local signalController = require("controller/signalController")
local pathController = require("controller/pathController")
local reserveController = require("controller/reserveController")
local terminalView = {}

function terminalView.defaultTerminal()
    while true do
        write(">")
        local input = read(nil)

        if input == "help" then
            print("Type in stuff and stuff will happen. I swear")
        elseif input == "exit" then
            break
        elseif #input == 4 then
            local startSignalID = string.sub(input, 1, 2)
            local targetSignalID = string.sub(input, 3, 4)

            if signalController.isSignal(startSignalID) then
                if signalController.isSignal(targetSignalID) then

                    local pathName = "" .. startSignalID .. targetSignalID

                    if pathController.isPath(pathName) then
                        -- set path
                        if reserveController.isPathFree(pathName) then
                            reserveController.reservePath(pathName)
                            print("Set new path")
                        else
                            print("Path is already blocked")
                        end
                    else
                        print("Not a valid Path")
                    end
                else
                    print("Target Signal " .. targetSignalID .. " is not a valid Signal")
                end
            else
                print("Start Signal " .. startSignalID .. " is not a valid Signal")
            end
        end
    end
end


return terminalView