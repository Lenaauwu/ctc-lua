local modem = peripheral.find("modem",rednet.open)
local computerSides = redstone.getSides()
local blockEntry = "Right"
local blockExit = "Left"
local blockName = "302"

while true do
    repeat 
        detectEntry = redstone.getInput(blockEntry)
        detectExit = redstone.getInput(blockExit)
        sleep(1)
    until detectEntry or detectExit
end