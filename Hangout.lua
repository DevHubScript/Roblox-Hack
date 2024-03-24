local library = loadstring(game:HttpGet"https://raw.githubusercontent.com/DevHubScript/CustomUi/main/Simple%20Ui%20Custom%20without%20Kick.lua")()
local window = library:AddWindow("")
local MainTab = window:AddTab("Main")

local Main1 = MainTab:AddPage()
local Main2 = MainTab:AddPage()

local Username = game.Players.LocalPlayer.Name

Main1:AddLine()
local w = Main1:AddLabel("Username : "..tostring(Username))

local timelabel = Main1:AddLabel("Server Time")
spawn(function()
    while Wait() do 
        pcall(function()
            local GameTime = math.floor(workspace.DistributedGameTime+0.5)
            local Hour = math.floor(GameTime/(60^2))%24
            local Minute = math.floor(GameTime/(60^1))%60
            local Second = math.floor(GameTime/(60^0))%60
            timelabel:Set("Server Time : "..Hour.."h "..Minute.."m "..Second.."s")
        end)
    end
end)

Main1:AddButton("Unlock Vip ",function()
    game:GetService("Workspace").Special.VIP.VIPFrontDoor.CanCollide = false
    game:GetService("Workspace").Special.VIP.VIPFrontDoor.SurfaceGui.Text1.Visible = false
    game:GetService("Workspace").Special.VIP.VIPFrontDoor.SurfaceGui.Text2.Visible = false
end)

Main1:AddSlider("WalkSpeed",0,30,16,function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
playername = {}
for i,v in pairs(game.Players:GetChildren()) do  
	table.insert(playername ,v.Name)
end
local Playerlist = Main2:AddDropdown("Players",playername,function(value)
    playerlist = value
    
    print(value)
end)
Main2:AddButton("Refresh ",function()
    Playerlist:Clear()
    for i,v in pairs(game.Players:GetChildren()) do  
		Playerlist:Add(v.Name)
	end
end)
function TW(Pos)
    Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    Speed = 55
    game:GetService("TweenService"):Create(
        game.Players.LocalPlayer.Character.HumanoidRootPart,
        TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
        {CFrame = Pos}
    ):Play()
end
Main2:AddToggle("Teleport",_G.Goto2,function(value2)
    _G.Goto2 = value2
    if _G.Goto2 == false then
        TW(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
    end
end)
Main2:AddToggle("Wall Hack",NoClip1,function(value2)
    NoClip1 = value2
    if NoClip1 then
        Noclip = true
    else
        Noclip = false
    end
end)
Main2:AddToggle("Spectate",Spectate,function(spectate1)
    Spectate = spectate1
    local myself = game.Players.LocalPlayer.Character.Humanoid
    local spectateplayer = game.Players:FindFirstChild(playerlist)
    repeat wait (0.1)
        game.Workspace.Camera.CameraSubject = spectateplayer.Character.Humanoid
    until Spectate == false
    game.Workspace.Camera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
end)
spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.Goto2 or Noclip then
            if not game:GetService("Workspace"):FindFirstChild("SLASH") then
                local SLASH = Instance.new("Part")
                SLASH.Name = "SLASH"
                SLASH.Parent = game.Workspace
                SLASH.Anchored = true
                SLASH.Transparency = 1
                SLASH.Size = Vector3.new(5,-1,5)
            elseif game:GetService("Workspace"):FindFirstChild("SLASH") then
                game.Workspace["SLASH"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.75689, 0)
            end
        else
            if game:GetService("Workspace"):FindFirstChild("SLASH") then
                game:GetService("Workspace"):FindFirstChild("SLASH"):Destroy()
            end
        end
    end)
end)
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if _G.Goto2 or Noclip then 
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end)
end)
spawn(function()
    while wait() do
        if _G.Goto2 and game.Workspace:FindFirstChild(playerlist) and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            TW(game.Workspace:FindFirstChild(playerlist).HumanoidRootPart.CFrame)
        end
    end
end)
