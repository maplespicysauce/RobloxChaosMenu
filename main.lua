--// xAI ULTIMATE CHAOS MENU v7 - KEY SYSTEM + FREE MODE + ORCA HUB \\--
-- ONE FILE: https://raw.githubusercontent.com/maplespicysauce/RobloxChaosMenu/main/main.lua

--// HARD-CODED KEY (PRO ONLY)
local OFFICIAL_KEY = "03c3328c-d9d0-4ecd-9fe1-6ff00c54df1a"

--// FREE MODE FLAG
local IS_PRO = false

--// KEY SYSTEM UI WITH "STAY ON FREE" BUTTON
local function ShowKeySystem(onPro, onFree)
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local KeyBox = Instance.new("TextBox")
    local VerifyBtn = Instance.new("TextButton")
    local FreeBtn = Instance.new("TextButton")
    local Status = Instance.new("TextLabel")

    ScreenGui.Name = "xAI_KeySystem"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, -175, 0.5, -130)
    Frame.Size = UDim2.new(0, 350, 0, 260)
    Frame.Active = true
    Frame.Draggable = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = Frame

    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "v7 Pro Key System"
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.TextSize = 22

    KeyBox.Parent = Frame
    KeyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
    KeyBox.Position = UDim2.new(0.1, 0, 0.25, 0)
    KeyBox.Size = UDim2.new(0.8, 0, 0, 38)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.PlaceholderText = "Enter Pro Key..."
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.TextSize = 16
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 8)
    keyCorner.Parent = KeyBox

    VerifyBtn.Parent = Frame
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    VerifyBtn.Position = UDim2.new(0.1, 0, 0.45, 0)
    VerifyBtn.Size = UDim2.new(0.8, 0, 0, 42)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.Text = "Unlock Pro"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.TextSize = 18
    local vCorner = Instance.new("UICorner")
    vCorner.CornerRadius = UDim.new(0, 8)
    vCorner.Parent = VerifyBtn

    FreeBtn.Parent = Frame
    FreeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
    FreeBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
    FreeBtn.Size = UDim2.new(0.8, 0, 0, 42)
    FreeBtn.Font = Enum.Font.GothamBold
    FreeBtn.Text = "Stay on Free"
    FreeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    FreeBtn.TextSize = 16
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 8)
    fCorner.Parent = FreeBtn

    Status.Parent = Frame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 0, 0.85, 0)
    Status.Size = UDim2.new(1, 0, 0, 25)
    Status.Font = Enum.Font.Gotham
    Status.Text = "Pro: All features | Free: Limited"
    Status.TextColor3 = Color3.fromRGB(150, 150, 150)
    Status.TextSize = 13

    -- Hover effects
    VerifyBtn.MouseEnter:Connect(function() VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255) end)
    VerifyBtn.MouseLeave:Connect(function() VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215) end)
    FreeBtn.MouseEnter:Connect(function() FreeBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 110) end)
    FreeBtn.MouseLeave:Connect(function() FreeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 90) end)

    -- Unlock Pro
    VerifyBtn.MouseButton1Click:Connect(function()
        local input = KeyBox.Text:gsub("%s", "")
        if input == "" then
            Status.Text = "Enter a key!"
            Status.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        Status.Text = "Verifying..."
        Status.TextColor3 = Color3.fromRGB(255, 255, 0)
        wait(1)
        if input == OFFICIAL_KEY then
            Status.Text = "Pro Unlocked!"
            Status.TextColor3 = Color3.fromRGB(100, 255, 100)
            IS_PRO = true
            wait(1.2)
            ScreenGui:Destroy()
            onPro()
        else
            Status.Text = "Invalid Key!"
            Status.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)

    -- Stay on Free
    FreeBtn.MouseButton1Click:Connect(function()
        Status.Text = "Free Mode Activated"
        Status.TextColor3 = Color3.fromRGB(255, 200, 100)
        wait(1)
        ScreenGui:Destroy()
        onFree()
    end)

    KeyBox.FocusLost:Connect(function(enter)
        if enter then VerifyBtn.MouseButton1Click:Fire() end
    end)
end

--// LAUNCH KEY SYSTEM
ShowKeySystem(
    function() -- PRO MODE
        LoadFullMenu(true)
    end,
    function() -- FREE MODE
        LoadFullMenu(false)
    end
)

--// FULL MENU FUNCTION
function LoadFullMenu(isPro)
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    local Window = Library.CreateLib("xAI Chaos v7" .. (isPro and " Pro 🔑" or " Free 🆓"), "Ocean")

    local Players = game:GetService("Players")
    local UserInputService = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local lp = Players.LocalPlayer
    local character = lp.Character or lp.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local flyGui, infJumpConn, jerkLoop, jerkAnim, jerkTrack = nil, nil, nil, nil, nil
    local espBoxes, espConn = {}, nil
    local trollingGui, chatBypass, infiniteYield, ndsHub, orcaHub = nil, nil, nil, nil, nil
    local walkSpeed, jumpPower = 16, 50

    --// FLY
    local function openFlyGui()
        if flyGui then return game.StarterGui:SetCore("SendNotification", {Title="Fly", Text="Already open!", Duration=3}) end
        flyGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
        game.StarterGui:SetCore("SendNotification", {Title="Fly GUI v3", Text="Use GUI to fly", Duration=5})
    end

    --// INFINITE JUMP
    local function toggleInfJump(state)
        if state then
            if infJumpConn then infJumpConn:Disconnect() end
            _G.JumpHeight = 100
            infJumpConn = UserInputService.InputBegan:Connect(function(i)
                if i.KeyCode == Enum.KeyCode.Space then
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

    --// JERK OFF LOOP (PRO ONLY)
    local function startJerkLoop()
        if jerkLoop then return end
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hum = char:WaitForChild("Humanoid")
        jerkAnim = Instance.new("Animation")
        jerkAnim.AnimationId = "rbxassetid://55816634"
        jerkTrack = hum:LoadAnimation(jerkAnim)
        jerkTrack.Looped = true
        jerkTrack:Play(0.1, 1, 1)
        local msgs = {"ꜰᴜᴄᴋ ʏᴇꜱ!", "Ɪᴛ ꜰᴇᴇʟꜱ ꜱᴏ ɢᴏᴏᴅ...", "ᴏʜ ʏᴇᴀʜ...", "ʙᴏᴜᴜᴛᴀ ʙᴜꜱꜱ!", "ᴀʜʜ ꜱʜlᴛ!!!!!", "ʙᴏᴜᴛᴛᴀ ʙᴜꜱᴛ ᴍʏ ꜰᴀᴛᴀꜱꜱ ᴄᴏᴄᴋ!", "* ᴄᴜᴍꜱ ᴀʟᴏᴛ *"}
        local speeds = {1, 1.1, 1.3, 1.5, 1.8, 2.0, 2.5}
        jerkLoop = spawn(function()
            while jerkLoop do
                for i, msg in ipairs(msgs) do
                    if not jerkLoop then break end
                    pcall(function() ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All") end)
                    jerkTrack:AdjustSpeed(speeds[i] or 1)
                    wait(4)
                end wait(2)
            end
        end)
    end
    local function stopJerkLoop()
        if jerkLoop then coroutine.close(jerkLoop) jerkLoop = nil end
        if jerkTrack then jerkTrack:Stop() jerkTrack = nil end
        if jerkAnim then jerkAnim:Destroy() jerkAnim = nil end
    end

    --// ESP
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
            for _, plr in Players:GetPlayers() do
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
            for _, b in espBoxes do if b and b.Parent then b:Destroy() end end
            espBoxes = {}
            if espConn then espConn:Disconnect() espConn = nil end
        end
    end

    --// EXTERNAL GUIs
    local function loadTrollingGUI()
        if trollingGui then return end
        trollingGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
        wait(1); spawn(function()
            repeat wait() until trollingGui and trollingGui.Main and trollingGui.Main.ThreeDots
            local c = Instance.new("TextLabel")
            c.Text = "Credits: yofriendfromschool1 (ScriptBlox)"
            c.TextColor3 = Color3.fromRGB(0,255,0)
            c.BackgroundTransparency = 1
            c.Size = UDim2.new(1,0,0,20)
            c.Font = Enum.Font.SourceSansBold
            c.TextSize = 14
            c.Parent = trollingGui.Main.ThreeDots
        end)
    end

    local function loadChatBypass()
        if chatBypass then return end
        chatBypass = loadstring(game:HttpGet("https://raw.githubusercontent.com/XE3Scripts/Axur/refs/heads/main/AxurBypassV2",true))()
        game.StarterGui:SetCore("SendNotification", {Title="Bypass ON", Text="Say anything!", Duration=4})
    end

    local function loadInfiniteYield()
        if infiniteYield then return end
        infiniteYield = loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
        wait(1); spawn(function()
            repeat wait() until infiniteYield and infiniteYield.Main and infiniteYield.Main.ThreeDots
            local c = Instance.new("TextLabel")
            c.Text = "Credits: DarkNetworks and Moon"
            c.TextColor3 = Color3.fromRGB(255,215,0)
            c.BackgroundTransparency = 1
            c.Size = UDim2.new(1,0,0,20)
            c.Font = Enum.Font.SourceSansBold
            c.TextSize = 14
            c.Parent = infiniteYield.Main.ThreeDots
        end)
        game.StarterGui:SetCore("SendNotification", {Title="IY Loaded", Text="Credits in 3 dots!", Duration=5})
    end

    local function loadNDSHub()
        if ndsHub then return game.StarterGui:SetCore("SendNotification", {Title="NDS", Text="Already loaded!", Duration=3}) end
        ndsHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua"))()
        game.StarterGui:SetCore("SendNotification", {Title="NDS Hub", Text="Loaded!", Duration=5})
    end

    local function loadOrcaHub()
        if orcaHub then return end
        orcaHub = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()
        game.StarterGui:SetCore("SendNotification", {Title="Orca Hub", Text="Loaded!", Duration=5})
    end

    --// STATS
    local function updateWalkSpeed(v) walkSpeed = v; if humanoid then humanoid.WalkSpeed = v end end
    local function updateJumpPower(v) jumpPower = v; if humanoid then humanoid.JumpPower = v end end

    --// TABS
    local MainTab = Window:NewTab("Main")
    local MainSec = MainTab:NewSection("Movement")
    MainSec:NewButton("Open Fly GUI v3", "Advanced Fly (XNEOFF)", openFlyGui)
    MainSec:NewSlider("Inf Jump Height", 500, 50, 100, function(v) _G.JumpHeight = v end)
    MainSec:NewToggle("Infinite Jump", false, toggleInfJump)

    local VisualTab = Window:NewTab("Visuals & NSFW")
    local VisualSec = VisualTab:NewSection("✦ Chaos Zone ✦")
    if isPro then
        VisualSec:NewToggle("Jerk Off LOOP 💦", false, function(s) if s then startJerkLoop() else stopJerkLoop() end end)
    else
        VisualSec:NewLabel("Jerk Off LOOP 💦 - Pro Only")
    end
    VisualSec:NewToggle("Player ESP", false, toggleESP)

    local GUITab = Window:NewTab("GUIs")
    local ExtSec = GUITab:NewSection("External GUIs")
    ExtSec:NewButton("Open Fly GUI v3", "Advanced Fly (XNEOFF)", openFlyGui)
    ExtSec:NewButton("FE Trolling GUI", "Sky Hub\nCredits in 3 dots", loadTrollingGUI)
    ExtSec:NewButton("Chat Tags Bypass", "Say anything (Axur V2)", loadChatBypass)
    if isPro then
        ExtSec:NewButton("Infinite Yield", "Admin Commands\nCredits in 3 dots", loadInfiniteYield)
    else
        ExtSec:NewLabel("Infinite Yield - Pro Only")
    end
    ExtSec:NewButton("Orca Hub", "Universal Hub", loadOrcaHub)

    local SpecSec = GUITab:NewSection("Specific Games")
    local NDSSec = GUITab:NewSection("Natural Disaster Survival")
    NDSSec:NewButton("NDS Hub", "Credits to w2pr on ScriptBlox", loadNDSHub)

    local PlayerTab = Window:NewTab("Player")
    local PlayerSec = PlayerTab:NewSection("Stats")
    PlayerSec:NewSlider("WalkSpeed", 1000, 0, 16, updateWalkSpeed)
    PlayerSec:NewSlider("JumpPower", 1000, 0, 50, updateJumpPower)

    --// KEYBINDS & CLEANUP
    UserInputService.InputBegan:Connect(function(k) if k.KeyCode == Enum.KeyCode.F then Library:ToggleUI() end end)
    lp.CharacterAdded:Connect(function(c)
        character = c; humanoid = c:WaitForChild("Humanoid"); rootPart = c:WaitForChild("HumanoidRootPart")
        humanoid.WalkSpeed = walkSpeed; humanoid.JumpPower = jumpPower
    end)
    game.Players.PlayerRemoving:Connect(function(p) if p == lp then toggleInfJump(false) stopJerkLoop() toggleESP(false) end end)

    --// LOADED
    game.StarterGui:SetCore("SendNotification", {
        Title = "xAI Chaos v7 " .. (isPro and "Pro" or "Free"),
        Text = (isPro and "All features unlocked!" or "Limited mode") .. " | Press F",
        Duration = 8
    })
end
