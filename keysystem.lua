--// xAI ULTIMATE CHAOS MENU v7 PRO - HARD-CODED KEY + OCEAN THEME + NDS HUB \\--
-- 100% CLEAN | Synapse X / Krnl / Fluxus | 2025

--// YOUR OFFICIAL KEY (HARD-CODED)
local OFFICIAL_KEY = "03c3328c-d9d0-4ecd-9fe1-6ff00c54df1a"

--// KEY SYSTEM UI
local function ShowKeySystem()
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local KeyBox = Instance.new("TextBox")
    local VerifyBtn = Instance.new("TextButton")
    local Status = Instance.new("TextLabel")

    ScreenGui.Name = "xAI_KeySystem"
    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.ResetOnSpawn = false

    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 45)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.5, -175, 0.5, -100)
    Frame.Size = UDim2.new(0, 350, 0, 200)
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
    KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    KeyBox.Size = UDim2.new(0.8, 0, 0, 38)
    KeyBox.Font = Enum.Font.Gotham
    KeyBox.PlaceholderText = "Enter your key..."
    KeyBox.Text = ""
    KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyBox.TextSize = 16
    local keyCorner = Instance.new("UICorner")
    keyCorner.CornerRadius = UDim.new(0, 8)
    keyCorner.Parent = KeyBox

    VerifyBtn.Parent = Frame
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    VerifyBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
    VerifyBtn.Size = UDim2.new(0.8, 0, 0, 42)
    VerifyBtn.Font = Enum.Font.GothamBold
    VerifyBtn.Text = "Verify Key"
    VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    VerifyBtn.TextSize = 18
    local verifyCorner = Instance.new("UICorner")
    verifyCorner.CornerRadius = UDim.new(0, 8)
    verifyCorner.Parent = VerifyBtn

    Status.Parent = Frame
    Status.BackgroundTransparency = 1
    Status.Position = UDim2.new(0, 0, 0.78, 0)
    Status.Size = UDim2.new(1, 0, 0, 25)
    Status.Font = Enum.Font.Gotham
    Status.Text = "Status: Ready"
    Status.TextColor3 = Color3.fromRGB(180, 180, 180)
    Status.TextSize = 14

    -- Hover effect
    VerifyBtn.MouseEnter:Connect(function()
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    end)
    VerifyBtn.MouseLeave:Connect(function()
        VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    end)

    -- Verify button
    VerifyBtn.MouseButton1Click:Connect(function()
        local input = KeyBox.Text:gsub("%s", "")
        if input == "" then
            Status.Text = "Status: Enter a key!"
            Status.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end

        Status.Text = "Status: Checking..."
        Status.TextColor3 = Color3.fromRGB(255, 255, 0)

        wait(1)

        if input == OFFICIAL_KEY then
            Status.Text = "Status: ACCESS GRANTED!"
            Status.TextColor3 = Color3.fromRGB(100, 255, 100)
            wait(1.5)
            ScreenGui:Destroy()
            -- LOAD FULL MENU
            loadstring(game:HttpGet("https://raw.githubusercontent.com/maplespicysauce/RobloxChaosMenu/main/menu_core.lua"))()
        else
            Status.Text = "Status: Invalid Key!"
            Status.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)

    -- Press Enter to verify
    KeyBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then VerifyBtn.MouseButton1Click:Fire() end
    end)
end

--// SHOW KEY SYSTEM
ShowKeySystem()
