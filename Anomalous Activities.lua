local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()
local ESP_Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/I2345/ExternalESP-Libaray/main/Library.lua"))()

local MainUI = UILibrary.Load("Astolfo Hub")

local ExploitSet = {
    ["ESP"] = {
        ["Anomoly"] = {
            ["bool"] = false;
            ["color"] = Color3.fromRGB(255, 0, 0)
        };
        ["MERC"] = {
            ["bool"] = false;
            ["color"] = Color3.fromRGB(255, 0, 0)
        };
    }
}

local VisualsPage = MainUI.AddPage("Visuals", false)

VisualsPage.AddLabel("Anomoly Visuals")
VisualsPage.AddToggle("Turn on Anomoly ESP", ExploitSet["ESP"]["Anomoly"]["bool"], function(x)
    ExploitSet["ESP"]["Anomoly"]["bool"] = x
    while true do
        ESP_Lib.Disable("players")
        if ExploitSet["ESP"]["Anomoly"]["bool"] == false then return end

        local DIR = game.Workspace.mainGame.active_anomaly

        local Anomoly = DIR:FindFirstChildWhichIsA("Model")
        if not Anomoly then return end

        if Anomoly.Name == "demon" then
            Anomoly = DIR:GetChildren()[2]
        end

        for i,v in pairs(Anomoly:GetChildren()) do
            if v:IsA("BasePart") then

                ESP_Lib.APIEnabled("Players", v)

            end
        end

        wait(0.1)

    end
end)

VisualsPage.AddLabel("MERC Visuals")
VisualsPage.AddToggle("Turn on MERC ESP", ExploitSet["ESP"]["MERC"]["bool"], function(x)
    ExploitSet["ESP"]["MERC"]["bool"] = x
    while true do
        if ExploitSet["ESP"]["MERC"]["bool"] == false then return end

        local DIR = game.Workspace.mainGame.active_humans

        for e,Anomoly in pairs(DIR:GetChildren()) do

            for i,v in pairs(Anomoly:GetChildren()) do
                if v:IsA("BasePart") then
    
                    ESP_Lib.APIEnabled("Players", v)
    
                end
            end

        end

        wait(0.1)

    end
end)
