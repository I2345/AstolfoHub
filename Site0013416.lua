local UILibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/twink"))()

local MainUI = UILibrary.Load("Astolfo Hub")

local ExploitSet = {
    ["AntiAFK"] = false;
    ["Hiphieght"] = {
        ["Bool"] = false;
        ["Value1"] = 2;
    };
    ["TeleportationSpawn"] = {
        ["Bool"] = false;
        ["Spawn"] = "Test Subject";
    };
}

local SetSpawns = {
    "Site Overwatch";
    "Department of Operations";
    "Innovation Department";
    "Regulations Department";
    "Security Corps";
    "Test Subject";
    "The Nova Dominion";
    "The Red Wolves";
    "Nothing To See Here";
    "Class-X Overwatch";
    "The Crazies";
    "[REDACTED]";
    "Iron Fist";
    "The Armed Gentlemen";
}

local AutofarmPage = MainUI.AddPage("Autofarm")

AutofarmPage.AddToggle("Anti-AFK", ExploitSet["AntiAFK"], function(x)
    ExploitSet["AntiAFK"] = x
end)

local PlayerPage = MainUI.AddPage("Local Player")

PlayerPage.AddSlider("Hiphieght Value", {Min = 2, Max = 20, Def = ExploitSet["Hiphieght"]["Value1"]}, function(x)
    ExploitSet["Hiphieght"]["Value1"] = x
end)

PlayerPage.AddToggle("Change Hiphieght", ExploitSet["Hiphieght"]["Bool"], function(x)
    ExploitSet["Hiphieght"]["Bool"] = x

    while true do
        if not ExploitSet["Hiphieght"]["Bool"] then return end

        local FindCharacter = workspace:FindFirstChild(game.Players.LocalPlayer.Name)
        FindCharacter:FindFirstChild("Humanoid").HipHeight = ExploitSet["Hiphieght"]["Value1"]

        wait(0.1)

    end

end)

PlayerPage.AddDropdown("Spawn", SetSpawns, function(Value)
    ExploitSet["TeleportationSpawn"]["Spawn"] = Value
end)

PlayerPage.AddToggle("TeleportationSpawn", ExploitSet["TeleportationSpawn"]["Bool"], function(x)
    ExploitSet["TeleportationSpawn"]["Bool"] = x


end)

local WorldPage = MainUI.AddPage("World")

WorldPage.AddButton("Phase through doors", function()

    local GetDoors = game.Workspace:FindFirstChild("Interactions")

    for i,v in pairs(GetDoors:GetChildren()) do
        if v.Name ~= "Data" then
            if v.Name ~= "Elevator" then
                if v.Name ~= "Vendor" then
                    if v.Name ~= "C4" then
                        if v.Name ~= "Bollards" then
                            v:Destroy()
                        end
                    end
                end
            end
        end
    end

end)

game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid.Died:Connect(function()
    
    if not ExploitSet["TeleportationSpawn"]["Bool"] then return end

    wait(10)

    game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name).HumanoidRootPart.CFrame = game.Workspace.Spawns:FindFirstChild(ExploitSet["TeleportationSpawn"]["Spawn"]).Spawn.CFrame + Vector3.new(0,2,0)

    
end)

game.Players.LocalPlayer.Idled:Connect(function()
    if ExploitSet["AntiAFK"] == false then return end

    keypress(0x57)
    keypress(0x57)
    keypress(0x57)
    keypress(0x57)
    keypress(0x57)
    keypress(0x57)

end)
