local terminalView = {}

function terminalView.defaultTerminal()
    while true do
        write(">")
        local input = read(nil)

        if input == "help" then
            print("Type in stuff and stuff will happen. I swear")
        elseif input == "exit" then
            break
        end
    end
end


return terminalView