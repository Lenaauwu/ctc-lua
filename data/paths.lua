local paths = {}

function paths.data()
    return {
        A1B1 = {
            switches = {
                {switchID = "A01", state = 2},
                {switchID = "A02", state = 0}
            },
            signals = {
                "B01X"
            }
        }
    }
end

return paths