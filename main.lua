--// xAI ULTIMATE CHAOS MENU v6 - FLY GUI V3 + INFINITE YIELD + FULL CONTROL \\--
-- 100% CLEAN | Synapse X / Krnl / Fluxus | 2025

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("xAI Chaos Pro v6", "Synapse")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local lp = Players.LocalPlayer
local character = lp.Character or lp.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

--// VARIABLES (All tracked for cleanup)
local flyGui = nil
local infJumpConn = nil
local jerkLoop = nil
local jerkAnim = nil
local jerkTrack = nil
local espBoxes = {}
local espConn = nil
local trollingGui = nil
local chatBypass = nil
local infiniteYield = nil
local walkSpeed = 16
local jumpPower = 50

--// NEW FLY: FlyGuiV3 (Button, not toggle)
local function openFlyGui()
    if flyGui then
        game.StarterGui:SetCore("SendNotification", {Title="Fly GUI", Text="Already open!", Duration=3})
        return
    end
    flyGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    game.StarterGui:SetCore("SendNotification", {Title="Fly GUI v3 Loaded", Text="Use GUI to fly | Close to disable", Duration=5})
end

--// INFINITE JUMP + FULL TERMINATION
local function toggleInfJump(state)
    if state then
        if infJumpConn then infJumpConn:Disconnect() end
        _G.JumpHeight = 100
        infJumpConn = UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Space then
                local hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
                local hrp = hum and hum.Parent:FindFirstChild("HumanoidRootPart")
                if hum and hrp and (hum:GetState() == Enum.HumanoidStateType.Jumping or hum:GetState() == Enum.HumanoidStateType.Freefall) then
                    hrp.Velocity = Vector3.new(hrp.Velocity.X, _G.JumpHeight, hrp.Velocity.Z)
                end
            end
        end)
    else
        if infJumpConn then infJumpConn:Disconnect() infJumpConn = nil end
    end
end

--// JERK OFF LOOP + FULL TERMINATION
local function startJerkLoop()
    if jerkLoop then return end
    local char = lp.Character or lp.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")

    jerkAnim = Instance.new("Animation")
    jerkAnim.AnimationId = "rbxassetid://55816634"
    jerkTrack = hum:LoadAnimation(jerkAnim)
    jerkTrack.Looped = true
    jerkTrack:Play(0.1, 1, 1)

    local messages = {"ꜰᴜᴄᴋ ʏᴇꜱ!", "Ɪᴛ ꜰᴇᴇʟꜱ ꜱᴏ ɢᴏᴏᴅ...", "ᴏʜ ʏᴇᴀʜ...", "ʙᴏᴜᴜᴛᴀ ʙᴜꜱꜱ!", "ᴀʜʜ ꜱʜlᴛ!!!!!", "ʙᴏᴜᴛᴛᴀ ʙᴜꜱᴛ ᴍʏ ꜰᴀᴛᴀꜱꜱ ᴄᴏᴄᴋ!", "* ᴄᴜᴍꜱ ᴀʟᴏᴛ *"}
    local speeds = {1, 1.1, 1.3, 1.5, 1.8, 2.0, 2.5}

    jerkLoop = spawn(function()
        while jerkLoop do
            for i, msg in ipairs(messages) do
                if not jerkLoop then break end
                pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All") end)
                jerkTrack:AdjustSpeed(speeds[i] or 1)
                wait(4)
            end
            wait(2)
        end
    end)
end

local function stopJerkLoop()
    if jerkLoop then coroutine.close(jerkLoop) jerkLoop = nil end
    if jerkTrack then jerkTrack:Stop() jerkTrack = nil end
    if jerkAnim then jerkAnim:Destroy() jerkAnim = nil end
end

--// ESP + FULL TERMINATION
local function toggleESP(state)
    if state then
        espConn = Players.PlayerAdded:Connect(function(plr)
            if plr == lp then return end
            plr.CharacterAdded:Wait()
            local box = Instance.new("BoxHandleAdornment")
            box.Adornee = plr.Character
            box.Size = plr.Character:GetExtentsSize() + Vector3.new(0.5,0.5,0.5)
            box.Color3 = Color3.fromRGB(255,0,0)
            box.Transparency = 0.7
            box.AlwaysOnTop = true
            box.Parent = plr.Character
            table.insert(espBoxes, box)
        end)
        for _, plr in pairs(Players:GetPlayers()) do
            if plr ~= lp and plr.Character then
                local box = Instance.new("BoxHandleAdornment")
                box.Adornee = plr.Character
                box.Size = plr.Character:GetExtentsSize() + Vector3.new(0.5,0.5,0.5)
                box.Color3 = Color3.fromRGB(255,0,0)
                box.Transparency = 0.7
                box.AlwaysOnTop = true
                box.Parent = plr.Character
                table.insert(espBoxes, box)
            end
        end
    else
        for _, box in pairs(espBoxes) do
            if box and box.Parent then box:Destroy() end
        end
        espBoxes = {}
        if espConn then espConn:Disconnect() espConn = nil end
    end
end

--// FE TROLLING GUI + CREDITS
local function loadTrollingGUI()
    if trollingGui then return end
    trollingGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
    wait(1)
    spawn(function()
        repeat wait() until trollingGui and trollingGui.Main and trollingGui.Main.ThreeDots
        local creditLabel = Instance.new("TextLabel")
        creditLabel.Name = "TrollCredits"
        creditLabel.Text = "Credits: yofriendfromschool1 (ScriptBlox)"
        creditLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        creditLabel.BackgroundTransparency = 1
        creditLabel.Size = UDim2.new(1, 0, 0, 20)
        creditLabel.Font = Enum.Font.SourceSansBold
        creditLabel.TextSize = 14
        creditLabel.Parent = trollingGui.Main.ThreeDots
    end)
end

--// CHAT TAGS BYPASS
local function loadChatBypass()
    if chatBypass then return end
    chatBypass = loadstring(game:HttpGet("https://raw.githubusercontent.com/XE3Scripts/Axur/refs/heads/main/AxurBypassV2",true))()
    game.StarterGui:SetCore("SendNotification", {Title="Chat Bypass ON", Text="Say anything!", Duration=4})
end

--// INFINITE YIELD + CREDITS
local function loadInfiniteYield()
    if infiniteYield then return end
    infiniteYield = loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
    wait(1)
    spawn(function()
        repeat wait() until infiniteYield and infiniteYield.Main and infiniteYield.Main.ThreeDots
        local creditLabel = Instance.new("TextLabel")
        creditLabel.Text = "Credits: DarkNetworks and Moon"
        creditLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
        creditLabel.BackgroundTransparency = 1
        creditLabel.Size = UDim2.new(1, 0, 0, 20)
        creditLabel.Font = Enum.Font.SourceSansBold
        creditLabel.TextSize = 14
        creditLabel.Parent = infiniteYield.Main.ThreeDots
    end)
    game.StarterGui:SetCore("SendNotification", {Title="Infinite Yield Loaded", Text="Credits in 3 dots!", Duration=5})
end

--// PLAYER STATS
local function updateWalkSpeed(val)
    walkSpeed = val
    if humanoid then humanoid.WalkSpeed = val end
end

local function updateJumpPower(val)
    jumpPower = val
    if humanoid then humanoid.JumpPower = val end
end

--// GUI TABS
local MainTab = Window:NewTab("Main")
local MainSection = MainTab:NewSection("Movement")

MainSection:NewButton("Open Fly GUI v3", "Advanced Fly GUI (XNEOFF)", function()
    openFlyGui()
end)

MainSection:NewSlider("Inf Jump Height", 500, 50, 100, function(v) _G.JumpHeight = v end)
MainSection:NewToggle("Infinite Jump", false, function(s) toggleInfJump(s) end)

local VisualTab = Window:NewTab("Visuals & NSFW")
local VisualSection = VisualTab:NewSection("✦ Chaos Zone ✦")

VisualSection:NewToggle("Jerk Off LOOP 💦", false, function(s)
    if s then startJerkLoop() else stopJerkLoop() end
end)
VisualSection:NewToggle("Player ESP", false, function(s) toggleESP(s) end)

local GUITab = Window:NewTab("GUIs")
local GUISection = GUITab:NewSection("External GUIs")

GUISection:NewButton("Open Fly GUI v3", "Advanced Fly GUI (XNEOFF)", function()
    openFlyGui()
end)

GUISection:NewButton("FE Trolling GUI", "Sky Hub Trolling\nCredits in 3 dots", function()
    loadTrollingGUI()
end)

GUISection:NewButton("Chat Tags Bypass", "Say anything (Axur V2)", function()
    loadChatBypass()
end)

GUISection:NewButton("Infinite Yield", "Admin Commands\nCredits in 3 dots", function()
    loadInfiniteYield()
end)

local PlayerTab = Window:NewTab("Player")
local PlayerSection = PlayerTab:NewSection("Stats")

PlayerSection:NewSlider("WalkSpeed", 1000, 0, 16, function(v) updateWalkSpeed(v) end)
PlayerSection:NewSlider("JumpPower", 1000, 0, 50, function(v) updateJumpPower(v) end)

--// KEYBINDS
UserInputService.InputBegan:Connect(function(k)
    if k.KeyCode == Enum.KeyCode.F then Library:ToggleUI() end
end)

--// RESPAWN HANDLER
lp.CharacterAdded:Connect(function(c)
    character = c
    humanoid = c:WaitForChild("Humanoid")
    rootPart = c:WaitForChild("HumanoidRootPart")
    humanoid.WalkSpeed = walkSpeed
    humanoid.JumpPower = jumpPower
end)

--// FULL CLEANUP ON LEAVE
game.Players.PlayerRemoving:Connect(function(plr)
    if plr == lp then
        toggleInfJump(false)
        stopJerkLoop()
        toggleESP(false)
    end
end)

--// LOADED
game.StarterGui:SetCore("SendNotification", {
    Title = "xAI Chaos Pro v6 LOADED",
    Text = "Fly GUI v3 | Infinite Yield | Press F",
    Duration = 8
})
