local masterID = 1
local rsDecode = { --poor mans switch statement
    [0] = "Back",
    [1] = "Left",
    [2] = "Right"
}

function consoleLog(logMessage)
    local time = textutils.formatTime(os.time("utc"), true)
    print(("%s >> %s "):format(time,logMessage))
end

function setSwitch(direction) --redstone pulse in the wanted direction
    redstone.setOutput(rsDecode[direction],true)
    os.sleep(0.3)
    redstone.setOutput(rsDecode[direction],false)
end

function main()
    while true do
        repeat
            id, message = rednet.receive()
        until id == masterID
        consoleLog(message)
        setSwitch(message)
    end
end

-- init
local modem = peripheral.find("modem", rednet.open)

xpcall(function()
    if rednet.isOpen() then
        consoleLog("Receiver (re)booted successfully")
        main()
    else
        error("Error: Rednet port not open, missing a modem?")
    end
end,
consoleLog
)

