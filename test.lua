function TW(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    Speed = 150
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end

_G.Goto2 = true
workspace:FindFirstChild("Really blueZone").VoteLaunchRE:FireServer()
spawn(function()
    while wait() do
        if _G.Goto2 then
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                
                if game.Players.LocalPlayer.PlayerGui.RiverMapGui.Enabled == true then
                    if not game.Workspace:FindFirstChild("Ready") then
                        TW(game:GetService("Workspace").BoatStages.NormalStages.CaveStage1.DarknessPart.CFrame)
                        if (game:GetService("Workspace").BoatStages.NormalStages.CaveStage1.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                            local SLASH = Instance.new("Part")
                            SLASH.Name = "Ready"
                            SLASH.Parent = game.Workspace
                        end
                    else 
                        if (game:GetService("Workspace").BoatStages.NormalStages.CaveStage1.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                            local SLASH = Instance.new("Part")
                            SLASH.Name = "Checkpoint1"
                            SLASH.Parent = game.Workspace
                            TW(game:GetService("Workspace").BoatStages.NormalStages.CaveStage2.DarknessPart.CFrame)
                            if (game:GetService("Workspace").BoatStages.NormalStages.CaveStage2.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                local SLASH = Instance.new("Part")
                                SLASH.Name = "Checkpoint2"
                                SLASH.Parent = game.Workspace
                                TW(game:GetService("Workspace").BoatStages.NormalStages.CaveStage3.DarknessPart.CFrame)
                                if (game:GetService("Workspace").BoatStages.NormalStages.CaveStage3.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                    local SLASH = Instance.new("Part")
                                    SLASH.Name = "Checkpoint3"
                                    SLASH.Parent = game.Workspace
                                    TW(game:GetService("Workspace").BoatStages.NormalStages.CaveStage4.DarknessPart.CFrame)
                                    if (game:GetService("Workspace").BoatStages.NormalStages.CaveStage4.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                        local SLASH = Instance.new("Part")
                                        SLASH.Name = "Checkpoint4"
                                        SLASH.Parent = game.Workspace
                                        TW(game:GetService("Workspace").BoatStages.NormalStages.CaveStage5.DarknessPart.CFrame)
                                        if (game:GetService("Workspace").BoatStages.NormalStages.CaveStage5.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end            
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Goto2 then
            print("2จ้า"..tostring((game:GetService("Workspace").BoatStages.NormalStages.CaveStage2.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude))
            wait(3)
            print("3จ้า"..tostring((game:GetService("Workspace").BoatStages.NormalStages.CaveStage3.DarknessPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude))
            wait(3)
        end
    end
end)
spawn(function()
    while wait() do
        if _G.Goto2 then
            game.Workspace.Gravity = 0
        else
            game.Workspace.Gravity = 196.2
        end
    end
end)
