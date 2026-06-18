local trains = {}

function trains.data()
    return {
        ["46011"] = {
            identifierItem = "minecraft:dirt",
            entryPath = "302 ZA2"
            exitPath = "ZA2 302"
        }
        ["43029"] = {
            identifierItem = "pneumaticcraft:green_plastic"
            entryPath = "302 ZA1"
            exitPath = "ZA1 302"
        }
    }
end

function trains.getItem(trainNumber)
    return trains.data()[trainNumber][identifierItem]
end

return trains