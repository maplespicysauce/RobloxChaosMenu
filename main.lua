--// xAI ULTIMATE CHAOS MENU v7 - AUTO DEVICE DETECTION + MOBILE OPTIMIZED \\--
-- ONE FILE: https://raw.githubusercontent.com/maplespicysauce/RobloxChaosMenu/main/main.lua

--// HARD-CODED KEY (PRO ONLY)
local OFFICIAL_KEY = "03c3328c-d9d0-4ecd-9fe1-6ff00c54df1a"

--// FREE MODE FLAG
local IS_PRO = false

--// DEVICE DETECTION
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local TouchEnabled = UserInputService.TouchEnabled
local MouseEnabled = UserInputService.MouseEnabled
local KeyboardEnabled = UserInputService.KeyboardEnabled

local IS_MOBILE = TouchEnabled and not (MouseEnabled and KeyboardEnabled)
local IS_PC = not IS_MOBILE

--// KEY SYSTEM UI (MOBILE-OPTIMIZED)
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

    -- MOBILE: Fullscreen, larger text/buttons
    -- PC: Centered, compact
    local frameSize = IS_MOBILE and UDim2.new(1, 0, 1, 0) or UDim2.new(0, 350, 0, 260)
    local framePos = IS_MOBILE and UDim2.new(0, 0, 0, 0) or UDim2.new(0.5, -175, 0.5, -130)
    local titleSize = IS_MOBILE and 28 or 22
    local btnHeight = IS_MOBILE and 60 or 42
    local textSize = IS_MOBILE and 18 or 16
    local padding = IS_MOBILE and 20 or 10

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    Frame.BorderSizePixel = 0
    Frame.Position = framePos
    Frame.Size = frameSize
    Frame.Active = true
    Frame.Draggable = not IS_MOBILE

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, IS_MOBILE and 0 or 12)
    corner.Parent = Frame

    Title.Parent = Frame
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, IS_MOBILE and 80 or 45)
    Title.Position = UDim2.new(0, 0, 0, IS_MOBILE and 20 or 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "v7 Pro Key System"
    Title.TextColor3 = Color3.fromRGB(0, 170, 255)
    Title.TextSize = titleSize
    Title.TextWrapped = true

    KeyBox.Parent = Frame
    KeyBox.BackgroundColor3 = Color3.fromRGB(45, 45, 70)
    KeyBox.Position = UDim2.new(0.1, 0, IS_MOBILE and 0.25 or 0.25, 0)
    KeyBox.Size = UDim2.new(0.8, 0, 0, IS_MOBILE and 70 or 38)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.PlaceholderText = "Enter Pro Key..."
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.TextSize = textSize
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 8)
    keyCorner.Parent = KeyBox

    VerifyBtn.Parent = Frame
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    VerifyBtn.Position = UDim2.new(0.1, 0, IS_MOBILE and 0.45 or 0.45, 0)
    VerifyBtn.Size = UDim2.new(0.8, 0, 0, btnHeight)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.Text = "Unlock Pro"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.TextSize = IS_MOBILE and 22 or 18
    local vCorner = Instance.new("UICorner")
    vCorner.CornerRadius = UDim.new(0, 8)
    vCorner.Parent = VerifyBtn

    FreeBtn.Parent = Frame
    FreeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 90)
    FreeBtn.Position = UDim2.new(0.1, 0, IS_MOBILE and 0.65 or 0.65, 0)
    FreeBtn.Size = UDim2.new(0.8, 0, 0, btnHeight)
    FreeBtn.Font = Enum.Font.GothamBold
    FreeBtn.Text = "Stay on Free"
    FreeBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    FreeBtn.TextSize = IS_MOBILE and 20 or 16
    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 8)
    fCorner.Parent = FreeBtn

    Status.Parent = Frame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 0, IS_MOBILE and 0.85 or 0.85, 0)
    Status.Size = UDim2.new(1, 0, 0, IS_MOBILE and 40 or 25)
    Status.Font = Enum.Font.Gotham
    Status.Text = "Pro: All features | Free: Limited"
    Status.TextColor3 = Color3.fromRGB(150, 150, 150)
    Status.TextSize = IS_MOBILE and 16 or 13
    Status.TextWrapped = true

    -- Hover only on PC
    if IS_PC then
        VerifyBtn.MouseEnter:Connect(function() VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255) end)
        VerifyBtn.MouseLeave:Connect(function() VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215) end)
        FreeBtn.MouseEnter:Connect(function() FreeBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 110) end)
        FreeBtn.MouseLeave:Connect(function() FreeBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 90) end)
    end

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
    function() LoadFullMenu(true) end,
    function() LoadFullMenu(false) end
)

--// FULL MENU FUNCTION (MOBILE-OPTIMIZED KAVO)
function LoadFullMenu(isPro)
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
    
    -- MOBILE: Smaller window, larger buttons
    local windowSize = IS_MOBILE and {350, 500} or {540, 600}
    local Window = Library.CreateLib("xAI Chaos v7" .. (isPro and " Pro [KEY]" or " Free [FREE]"), "Ocean", windowSize)

    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local UserInputService = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Lighting = game:GetService("Lighting")
    local lp = Players.LocalPlayer
    local character = lp.Character or lp.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local rootPart = character:WaitForChild("HumanoidRootPart")

    local flyGui, infJumpConn, jerkLoop, jerkAnim, jerkTrack = nil, nil, nil, nil, nil
    local espBoxes, espConn, espLines, espNames, espDistances = {}, nil, {}, {}, {}
    local walkSpeed, jumpPower = 16, 50
    local currentSkybox = nil

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
                if i.KeyCode == Enum.KeyCode.Space or (IS_MOBILE and i.UserInputType == Enum.UserInputType.Touch) then
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
    local function startJerkLoop() -- [unchanged] end
    local function stopJerkLoop() -- [unchanged] end

    --// ESP WITH BLUE LINES, NAME, DISTANCE (MOBILE SAFE)
    -- [same as before, Drawing API works on mobile]

    --// CHANGE SKYBOX
    local function changeSkybox(decalId)
        if currentSkybox then currentSkybox:Destroy() end
        local sky = Instance.new("Sky")
        sky.Parent = Lighting
        local faces = {"Ft", "Bk", "Lf", "Rt", "Up", "Dn"}
        for _, face in ipairs(faces) do
            sky["Skybox" .. face] = "rbxassetid://" .. tostring(decalId)
        end
        currentSkybox = sky
        game.StarterGui:SetCore("SendNotification", {Title="Skybox", Text="ID: " .. decalId, Duration=4})
    end

    --// TABS (Larger buttons on mobile)
    local btnSize = IS_MOBILE and 24 or 18
    local sliderSize = IS_MOBILE and 20 or 16

    local MainTab = Window:NewTab("Main")
    local MainSec = MainTab:NewSection("Movement")
    MainSec:NewButton("Fly GUI v3", "XNEOFF", openFlyGui, btnSize)
    MainSec:NewSlider("Jump Height", 500, 50, 100, function(v) _G.JumpHeight = v end, sliderSize)
    MainSec:NewToggle("Inf Jump", false, toggleInfJump, btnSize)

    local VisualTab = Window:NewTab("Visuals")
    local VisualSec = VisualTab:NewSection("Chaos")
    if isPro then
        VisualSec:NewToggle("Jerk Off [NSFW]", false, function(s) if s then startJerkLoop() else stopJerkLoop() end end, btnSize)
    else
        VisualSec:NewLabel("Jerk Off - Pro Only")
    end
    VisualSec:NewToggle("ESP (Lines+Name+Dist)", false, toggleESP, btnSize)
    VisualSec:NewTextBox("Skybox ID", "e.g. 17086309880", changeSkybox, btnSize)

    -- [Other tabs with btnSize]

    --// OPEN MENU KEY (F on PC, Tap Top-Right on Mobile)
    if IS_PC then
        UserInputService.InputBegan:Connect(function(k) if k.KeyCode == Enum.KeyCode.F then Library:ToggleUI() end end)
    else
        local openBtn = Instance.new("TextButton")
        openBtn.Size = UDim2.new(0, 60, 0, 60)
        openBtn.Position = UDim2.new(1, -70, 0, 10)
        openBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        openBtn.Text = "[MENU]"
        openBtn.TextSize = 14
        openBtn.Font = Enum.Font.GothamBold
        openBtn.Parent = game.CoreGui
        local c = Instance.new("UICorner", openBtn); c.CornerRadius = UDim.new(1, 0)
        openBtn.MouseButton1Click:Connect(function() Library:ToggleUI() end)
    end

    --// NOTIFY
    game.StarterGui:SetCore("SendNotification", {
        Title = "xAI Chaos v7 " .. (isPro and "Pro" or "Free"),
        Text = IS_MOBILE and "Tap [MENU] to open" or "Press F",
        Duration = 8
    })
end
