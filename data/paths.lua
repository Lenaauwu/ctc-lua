local paths = {}
--todo: add the rest of the segments for all blocks
function paths.data()
    return {
        ["ZA3 302"] = {
            segments = {
                "A3",
                "301",
                "302"
            },
            switches = {
                {switchID = "W102", state = 1},
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0},
            },
            signals = {
                "ZA3",
                "D301A",
                "X302"
            }
        },
        ["ZA2 302"] = {
            segments = {
                "A2",
                "301",
                "302"
            },
            switches = {
                {switchID = "W102", state = 0},
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0}
            },
            signals = {
                "ZA2",
                "D301A",
                "X302"
            }
        },
        ["ZA1 302"] = {
            segments = {
                "A1",
                "301",
                "302"
            },
            switches = {
                {switchID = "W101", state = 2},
                {switchID = "W103", state = 2},
            },
            signals = {
                "ZA1",
                "D301A",
                "X302"
            }
        },
        ["ZA3 301"] = {
            switches = {
                {switchID = "W102", state = 1},
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0}
            },
            signals = {
                "ZA3",
                "D301A"
            }
        },
        ["ZA2 301"] = {
            switches = {
                {switchID = "W102", state = 0},
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0}
            },
            signals = {
                "ZA2",
                "D301A"
            }
        },
        ["ZA1 301"] = {
            switches = {
                {switchID = "W101", state = 2},
                {switchID = "W103", state = 2}
            },
            signals = {
                "ZA1",
                "D301A"
            }
        },
        ["ZA1 A81"] = {
            switches = {
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0}
            },
            signals = {
                "ZA1",
                "XA81"
            }
        },
        ["D301A 302"] = {
            switches = {
            },
            signals = {
                "D301A",
                "X302"
            }
        },
        ["E301A A3"] = {
            switches = {
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0},
                {switchID = "W102", state = 1}
            },
            signals = {
                "E301A",
                "XA3"
            }
        },
        ["E301A A2"] = {
            switches = {
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0},
                {switchID = "W102", state = 0}
            },
            signals = {
                "E301A",
                "XA2"
            }
        },
        ["E301A A1"] = {
            switches = {
                {switchID = "W101", state = 2},
                {switchID = "W103", state = 2}
            },
            signals = {
                "E301A",
                "XA1"
            }
        },
        ["ZA81 A1"] = {
            switches = {
                {switchID = "W101", state = 0},
                {switchID = "W103", state = 0}
            },
            signals = {

                "ZA81",
                "XA1"
            }
        }
    }
end

return paths