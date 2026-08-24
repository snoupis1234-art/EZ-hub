-- ==========================================
-- EZ HUB | PERFECT X BUTTON V20
-- ==========================================
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

if PlayerGui:FindFirstChild("EZHubProUI") then
    PlayerGui.EZHubProUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "EZHubProUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

-- ==========================================
-- 1. TOGGLE "EZ" SQUARE (Κρυφό στην αρχή)
-- ==========================================
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 50, 0, 50)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.Text = ""
ToggleButton.Visible = false 
ToggleButton.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 69, 0))
}
UIGradient.Rotation = 45
UIGradient.Parent = ToggleButton

local ToggleText = Instance.new("TextLabel")
ToggleText.Size = UDim2.new(1, 0, 1, 0)
ToggleText.BackgroundTransparency = 1
ToggleText.Text = "EZ"
ToggleText.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleText.TextSize = 18
ToggleText.Font = Enum.Font.GothamBold
ToggleText.Parent = ToggleButton

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 2
UIStroke.Transparency = 0.3
UIStroke.Parent = ToggleButton

-- ==========================================
-- 2. KEY SYSTEM POPUP WINDOW
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 320, 0, 190)
KeyFrame.Position = UDim2.new(0.5, -160, 0.5, -95)
KeyFrame.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
KeyFrame.BorderSizePixel = 0
KeyFrame.Visible = true
KeyFrame.Parent = ScreenGui

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 10)
KeyCorner.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "⚡ EZ HUB - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 170, 0)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame

-- Κουμπί X φτιαγμένο με γραμμές (Frames) για να φαίνεται πάντα τέλειο
local KeyCloseBtn = Instance.new("TextButton")
KeyCloseBtn.Size = UDim2.new(0, 30, 0, 30)
KeyCloseBtn.Position = UDim2.new(1, -38, 0, 8)
KeyCloseBtn.BackgroundColor3 = Color3.fromRGB(235, 69, 95)
KeyCloseBtn.BorderSizePixel = 0
KeyCloseBtn.Text = ""
KeyCloseBtn.Parent = KeyFrame

local KeyCloseCorner = Instance.new("UICorner")
KeyCloseCorner.CornerRadius = UDim.new(0, 6)
KeyCloseCorner.Parent = KeyCloseBtn

-- Γραμμή 1 του X
local XLine1 = Instance.new("Frame")
XLine1.Size = UDim2.new(0, 16, 0, 2)
XLine1.Position = UDim2.new(0.5, -8, 0.5, -1)
XLine1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
XLine1.BorderSizePixel = 0
XLine1.Rotation = 45
XLine1.Parent = KeyCloseBtn

-- Γραμμή 2 του X
local XLine2 = Instance.new("Frame")
XLine2.Size = UDim2.new(0, 16, 0, 2)
XLine2.Position = UDim2.new(0.5, -8, 0.5, -1)
XLine2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
XLine2.BorderSizePixel = 0
XLine2.Rotation = -45
XLine2.Parent = KeyCloseBtn

KeyCloseBtn.MouseButton1Click:Connect(function()
    KeyFrame.Visible = false
    ToggleButton.Visible = true
end)

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.85, 0, 0, 40)
TextBox.Position = UDim2.new(0.075, 0, 0.38, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(30, 33, 42)
TextBox.BorderSizePixel = 0
TextBox.PlaceholderText = "Enter site code..."
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
TextBox.TextSize = 14
TextBox.Font = Enum.Font.Gotham
TextBox.Parent = KeyFrame

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = TextBox

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 38)
SubmitBtn.Position = UDim2.new(0.075, 0, 0.72, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
SubmitBtn.BorderSizePixel = 0
SubmitBtn.Text = "UNLOCK HUB"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 15
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Parent = KeyFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 6)
BtnCorner.Parent = SubmitBtn

-- ==========================================
-- 3. MAIN PRO GUI
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 320, 0, 360)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 24, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 45)
TopBar.BackgroundColor3 = Color3.fromRGB(28, 31, 38)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 10)
TopCorner.Parent = TopBar

local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(0.7, 0, 1, 0)
MainTitle.Position = UDim2.new(0.05, 0, 0, 0)
MainTitle.BackgroundTransparency = 1
MainTitle.Text = "⚡ EZ HUB - CONTROL PANEL"
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 15
MainTitle.Font = Enum.Font.GothamBold
MainTitle.TextXAlignment = Enum.TextXAlignment.Left
MainTitle.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -38, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(235, 69, 95)
CloseBtn.BorderSizePixel = 0
CloseBtn.Text = "-"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 18
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

local function createProButton(name, yPos, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.88, 0, 0, 42)
    btn.Position = UDim2.new(0.06, 0, 0, yPos)
    btn.BackgroundColor3 = color or Color3.fromRGB(30, 33, 42)
    btn.BorderSizePixel = 0
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = MainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    return btn
end

local autoBuyBtn = createProButton("Auto Buy (500k+): OFF", 58, Color3.fromRGB(30, 33, 42))
local speedBtn   = createProButton("Speed Boost: OFF", 108, Color3.fromRGB(30, 33, 42))
local jumpBtn    = createProButton("Jump Boost: OFF", 158, Color3.fromRGB(30, 33, 42))
local serverHop  = createProButton("Server Hop", 215, Color3.fromRGB(33, 150, 243))
local leaveBtn   = createProButton("Leave", 270, Color3.fromRGB(33, 150, 243))

-- ==========================================
-- 4. LOGIC & FUNCTIONALITY
-- ==========================================
local correctCode = "928ee7"
local isUnlocked = false

SubmitBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == correctCode then
        isUnlocked = true
        KeyFrame:Destroy()
        MainFrame.Visible = true
        ToggleButton.Visible = true
        
        task.spawn(function()
            pcall(function()
                Player.Idled:Connect(function()
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end)
            end)
        end)
    else
        TextBox.Text = ""
        TextBox.PlaceholderText = "WRONG CODE! TRY AGAIN"
    end
end)

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleButton.Visible = true
end)

local dragging, dragStart, startPos
local totalMoved = 0

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position
        totalMoved = 0
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        totalMoved = math.abs(delta.X) + math.abs(delta.Y)
        ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragging = false
        if totalMoved < 6 then
            if not isUnlocked then
                KeyFrame.Visible = not KeyFrame.Visible
            else
                MainFrame.Visible = not MainFrame.Visible
            end
        end
    end
end)

-- Auto Buy (500k+)
local autoBuyActive = false
autoBuyBtn.MouseButton1Click:Connect(function()
    autoBuyActive = not autoBuyActive
    autoBuyBtn.Text = "Auto Buy (500k+): " .. (autoBuyActive and "ON" or "OFF")
    autoBuyBtn.BackgroundColor3 = autoBuyActive and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(30, 33, 42)
    
    task.spawn(function()
        while autoBuyActive do
            pcall(function()
                local char = Player.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    for _, prompt in pairs(Workspace:GetDescendants()) do
                        if not autoBuyActive then break end
                        if prompt:IsA("ProximityPrompt") then
                            local actionText = string.upper(prompt.ActionText or "")
                            local objectText = string.upper(prompt.ObjectText or "")
                            local fullPromptText = actionText .. " " .. objectText
                            
                            if string.find(fullPromptText, "BUY") then
                                local part = prompt.Parent
                                if part and part:IsA("BasePart") then
                                    local dist = (char.HumanoidRootPart.Position - part.Position).Magnitude
                                    if dist <= 18 then
                                        local shouldBuy = false
                                        local isBelowLimit = false
                                        
                                        local mVal = tonumber(string.match(fullPromptText, "(%d+%.?%d*)%s*M"))
                                        if mVal then
                                            if (mVal * 1000000) >= 500000 then shouldBuy = true else isBelowLimit = true end
                                        end
                                        
                                        local kVal = tonumber(string.match(fullPromptText, "(%d+%.?%d*)%s*K"))
                                        if kVal then
                                            if (kVal * 1000) >= 500000 then shouldBuy = true else isBelowLimit = true end
                                        end
                                        
                                        if not string.find(fullPromptText, "K") and not string.find(fullPromptText, "M") then
                                            isBelowLimit = true
                                        end
                                        
                                        if shouldBuy and not isBelowLimit then
                                            fireproximityprompt(prompt)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end)
            task.wait(0.3)
        end
    end)
end)

-- Speed Boost
local speedActive = false
speedBtn.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    speedBtn.Text = "Speed Boost: " .. (speedActive and "ON" or "OFF")
    speedBtn.BackgroundColor3 = speedActive and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(30, 33, 42)
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.WalkSpeed = speedActive and 50 or 16
    end
end)

-- Jump Boost
local jumpActive = false
jumpBtn.MouseButton1Click:Connect(function()
    jumpActive = not jumpActive
    jumpBtn.Text = "Jump Boost: " .. (jumpActive and "ON" or "OFF")
    jumpBtn.BackgroundColor3 = jumpActive and Color3.fromRGB(46, 204, 113) or Color3.fromRGB(30, 33, 42)
    if Player.Character and Player.Character:FindFirstChild("Humanoid") then
        Player.Character.Humanoid.JumpPower = jumpActive and 120 or 50
    end
end)

-- Server Hop
serverHop.MouseButton1Click:Connect(function()
    local ts = game:GetService("TeleportService")
    local hs = game:GetService("HttpService")
    local success, result = pcall(function()
        return hs:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)
    if success and result and result.data then
        for _, s in pairs(result.data) do
            if s.playing < s.maxPlayers then
                ts:TeleportToPlaceInstance(game.PlaceId, s.id, Player)
                break
            end
        end
    end
end)

leaveBtn.MouseButton1Click:Connect(function()
    game:Shutdown()
end)
