local debugMode = true

local signalController = require("controller/signalController")
local pathController = require("controller/pathController")
local reserveController = require("controller/reserveController")
local switchController = require("controller/switchController")

local terminalView = {}
local blocksToCheck = 0

local function reservePath(operationType,startSignalID,endBlock)
    local pathToSet = pathController.getPath("" .. startSignalID .. endBlock)
    if operation == "rafa" then
        blocksToCheck = #pathToSet -1 --skips checking the destination block
    elseif operation == "zufa" then
        blocksToCheck = #pathToSet
    else
        error("Invalid Operation!")
    end
    
    for i=2, blocksToCheck, 1 do
        if not reserveController.isPathFree(pathToSet.segments(i)) then
            error("One or more parts of the path are reserved!")
        end
    end

    local switchesToSet = pathToSet[switches]
    for i = 0, #switchesToSet, 1 do
        xpcall(switchController.changeSwitch(switchesToSet[i]["switchID"],switchesToSet[i]["state"]), errorHandler)
    end

    local signalsToSet = pathToSet["signals"]
    for i = 0, #signalsToSet, 1 do
        --todo: signalController
    end

end

function errorHandler(errorMessage)
    printError(("An error occurred: "):format(errorMessage))
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

function terminalView.defaultTerminal()
    while true do
        write(">")
        local input = read(nil)
        local inputTable = {}
        local temp = ""
        for i = 1, input:len(), 1 do
            local c = input:sub(i,i)
            if c == " " then
                table.insert(inputTable,temp)
                temp = ""
            else
                temp = temp .. c
            end
        end
        table.insert(inputTable,temp)

        if debugMode then
            for i,v in pairs(inputTable) do
                print(v)
            end
        end

        local operation = inputTable[1]:lower()
        local param1 = inputTable[2]:upper()
        local param2 = inputTable[3]:upper()

        if operation == "help" then
            print("Type in stuff and stuff will happen. I swear")
        elseif operation == "exit" or operation == "quit" then
            break
        elseif operation == "rafa" or operation == "zufa" then
            xpcall(reservePath(operation, param1, param2),errorHandler)
        elseif operation == "bat" then
            unlockBlock(param1)
        end
    end
end


return terminalView