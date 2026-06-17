local signalController = require("controller/signalController")
local pathController = require("controller/pathController")
local reserveController = require("controller/reserveController")
local terminalView = {}

local function reservePath(startSignalID,endBlock)
    local pathToSet = pathController.getPath("" .. startSignalID .. endBlock)
    
    for i in #pathToSet.segments do
        -- todo: get occupancy of affected blocks 
    end

    for i in #pathToSet.switches do
        xpcall(switchController.changeSwitch(pathToSet.switches[i][switchID],pathToSet.switches[i][state]), errorHandler)
    end
    
    for i, #pathToSet.signals do
        --todo: signalController
    end

end

function errorHandler(errorMessage)
    --todo: like all of this
end

--todo: rewrite this to fit the new params
local function unlockBlock(input) 
    local startSignalID = string.sub(input, 1, 2)
    local targetSignalID = string.sub(input, 3, 4)

    if signalController.isSignal(startSignalID) then
        if signalController.isSignal(targetSignalID) then

            local pathName = "" .. startSignalID .. targetSignalID

            if pathController.isPath(pathName) then
                -- set path
                reserveController.setPath(pathName,false)
                print("Path " .. pathName .. " is no longer reserved.")
            elseí
                print("Not a valid Path")
            end
        else
            print("Target Signal " .. targetSignalID .. " is not a valid Signal")
        end
    else
        print("Start Signal " .. startSignalID .. " is not a valid Signal")
    end
end

function terminalView.defaultTerminal()
    while true do
        write(">")
        local input = read(nil)
        local inputTable = {}
        local temp
        for i = 1, #input do
            local c = input:sub(i,i)
            if c == " " then
                inputTable.insert(temp)
            else
                temp .. c
            end
        end
        local operation = temp[1]
        local param1 = temp[2]
        local param2 = temp[3]


        if operation == "help" then
            print("Type in stuff and stuff will happen. I swear")
        elseif operation == "exit" or operation == "quit" then
            break
        elseif operation == "RAFA" or operation == "ZUFA" then
            xpcall(reservePath(param1, param2),errorHandler)
        elseif operation == "BAT" then
            unlockBlock(param1)
        end
    end
end


return terminalView