local setupDrive = peripheral.find("drive") --returns wrapped peripheral

function wipeData()
    local files = fs.list("./")
    for i=1, #files do
        if files[i] ~= "rom" then
            if files[i] ~= "disk" then
                fs.delete(files[i])
            end
        end
    end
    fs.delete("./startup")
end

function setup()
    settings.set("motd.enable",false)
    fs.makeDir("./startup") --fucken grrr cant write to /rom/autorun
    fs.copy("./disk/receiver.lua","./startup/receiver.lua")
    settings.save()
end

function consoleLog(message)
    local time = textutils.formatTime(os.time("utc"), true)
    print(("%s >> %s "):format(time,message))
end



if xpcall(wipeData,consoleLog) then
    consoleLog("Computer data cleared")
    os.sleep(2)
    if xpcall(setup,consoleLog) then
        consoleLog("Setup completed successfully, rebooting computer.")
        disk.eject(peripheral.getName(setupDrive))   
        sleep(5)
        os.reboot()
    end
end


