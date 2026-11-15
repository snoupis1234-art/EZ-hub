-- ==========================================
-- EZ HUB | MOBILE FISHING & SETTINGS (RAYFIELD UI)
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "EZ Hub | Fishing & Settings",
   LoadingTitle = "EZ Hub Loading...",
   LoadingSubtitle = "by You",
   ConfigurationSaving = {
      Enabled = false,
   },
   KeySystem = false,
})

-- Tabs
local FishingTab = Window:CreateTab("Fishing", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")

-- Anti-Idle (Κλειδωμένο στο On)
task.spawn(function()
    pcall(function()
        Player.Idled:Connect(function()
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end)
    while true do
        pcall(function()
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
        task.wait(60)
    end
end)

local fishingActive = false
local espActive = false
local singleBeamInstance = nil
local singlePartAbove = nil
local singleHighlight = nil
local att1, att2 = nil, nil

-- Mobile Touch Simulation
local function tapScreen(x, y)
    pcall(function()
        VirtualInputManager:SendTouchEvent(0, 0, x, y)
        task.wait(0.02)
        VirtualInputManager:SendTouchEvent(0, 2, x, y)
    end)
end

-- Συνάρτηση ανίχνευσης "waiting for a bite"
local function isWaitingForBite()
    local found = false
    pcall(function()
        for _, gui in ipairs(PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                if gui.Visible and string.find(string.lower(gui.Text), "waiting for a bite") then
                    found = true
                    break
                end
            end
        end
    end)
    return found
end

-- Συνάρτηση ανίχνευσης τερματισμού minigame (ψαριά)
local function isCatchPopupVisible()
    local found = false
    pcall(function()
        for _, gui in ipairs(PlayerGui:GetDescendants()) do
            if gui:IsA("TextLabel") or gui:IsA("TextButton") then
                if gui.Visible then
                    local txt = string.lower(gui.Text)
                    if string.find(txt, "caught") or string.find(txt, "kg") or string.find(txt, "you got") then
                        found = true
                        break
                    end
                end
            end
        end
    end)
    return found
end

-- --- ESP: MONO ENA FOS AKRIVOS STIS SINTETAGMENES POU EDWES ---
local targetPos = Vector3.new(-2698.9, 1.5, -11915.0)

local function updateSingleESP()
    if not espActive then
        if singleBeamInstance then singleBeamInstance:Destroy() end
        if singlePartAbove then singlePartAbove:Destroy() end
        if singleHighlight then singleHighlight:Destroy() end
        if att1 then att1:Destroy() end
        if att2 then att2:Destroy() end
        singleBeamInstance = nil
        singlePartAbove = nil
        singleHighlight = nil
        return
    end

    if not singleBeamInstance then
        pcall(function()
            local bestPart = nil
            local minDst = 9999
            for _, obj in ipairs(Workspace:GetDescendants()) do
                if obj:IsA("BasePart") then
                    local dst = (obj.Position - targetPos).Magnitude
                    if dst < minDst then
                        minDst = dst
                        bestPart = obj
                    end
                end
            end

            if bestPart then
                singleHighlight = Instance.new("Highlight")
                singleHighlight.Name = "EzHubSingleESP"
                singleHighlight.Adornee = bestPart
                singleHighlight.FillColor = Color3.fromRGB(255, 0, 0)
                singleHighlight.FillTransparency = 0.7
                singleHighlight.OutlineColor = Color3.fromRGB(255, 100, 100)
                singleHighlight.OutlineTransparency = 0.1
                singleHighlight.Parent = bestPart

                att1 = Instance.new("Attachment", bestPart)
                
                singlePartAbove = Instance.new("Part", bestPart)
                singlePartAbove.Size = Vector3.new(1, 1, 1)
                singlePartAbove.Transparency = 1
                singlePartAbove.Anchored = true
                singlePartAbove.CanCollide = false
                singlePartAbove.Position = targetPos + Vector3.new(0, 800, 0)
                
                att2 = Instance.new("Attachment", singlePartAbove)
                
                singleBeamInstance = Instance.new("Beam")
                singleBeamInstance.Attachment0 = att1
                singleBeamInstance.Attachment1 = att2
                singleBeamInstance.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
                singleBeamInstance.Width0 = 25
                singleBeamInstance.Width1 = 25
                singleBeamInstance.FaceCamera = true
                singleBeamInstance.Parent = bestPart
            end
        end)
    end
end

-- Loop για το ESP
task.spawn(function()
    while true do
        if espActive then
            updateSingleESP()
        end
        task.wait(2.0)
    end
end)


-- --- RAYFIELD UI TOGGLES & BUTTONS ---

FishingTab:CreateToggle({
   Name = "Auto Fishing",
   CurrentValue = false,
   Flag = "AutoFishToggle",
   Callback = function(Value)
      fishingActive = Value
   end,
})

FishingTab:CreateToggle({
   Name = "Show Fishing Area (World 6)",
   CurrentValue = false,
   Flag = "ESPSpotToggle",
   Callback = function(Value)
      espActive = Value
      if not espActive then
          updateSingleESP()
      end
   end,
})

-- SETTINGS TAB ITEMS
SettingsTab:CreateToggle({
   Name = "Anti-Idle (Always ON)",
   CurrentValue = true,
   Flag = "AntiIdleToggle",
   Callback = function(Value)
      if not Value then
          Rayfield:Notify({Title = "Anti-Idle", Content = "To Anti-Idle einai kleiodomeno sto ON!", Duration = 3})
      end
   end,
})

SettingsTab:CreateButton({
   Name = "Low Graphics (FPS Boost)",
   Callback = function()
      pcall(function()
          settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
          Lighting.GlobalShadows = false
          Lighting.FogEnd = 999999
          for _, v in pairs(Workspace:GetDescendants()) do
              if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
                  v.Material = Enum.Material.SmoothPlastic
                  v.Reflectance = 0
              elseif v:IsA("Decal") or v:IsA("Texture") then
                  v.Transparency = 1
              end
          end
      end)
      Rayfield:Notify({Title = "FPS Boost", Content = "Ta grafika xamilosan gia megista FPS!", Duration = 3})
   end,
})

SettingsTab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      pcall(function()
          Rayfield:Notify({Title = "Rejoin", Content = "Ginetai rejoin ston server...", Duration = 2})
          task.wait(1)
          TeleportService:Teleport(game.PlaceId, Player)
      end)
   end,
})

-- --- Αδιάσπαστος Κύκλος Ψαρέματος ---
task.spawn(function()
    while true do
        if fishingActive then
            pcall(function()
                local camSize = Workspace.CurrentCamera.ViewportSize
                local castX = camSize.X * 0.82
                local castY = camSize.Y * 0.55
                
                if not isWaitingForBite() then
                    tapScreen(castX, castY)
                end
                
                local confirmTimeout = tick()
                local castConfirmed = false
                while fishingActive and (tick() - confirmTimeout < 5.0) do
                    if isWaitingForBite() then
                        castConfirmed = true
                        break
                    end
                    task.wait(0.1)
                end
                
                if not castConfirmed or not fishingActive then 
                    task.wait(1.5)
                    return 
                end
                
                local biteTimeout = tick()
                while fishingActive do
                    if not isWaitingForBite() then
                        break
                    end
                    if tick() - biteTimeout > 35 then 
                        break 
                    end
                    task.wait(0.15)
                end
                
                if not fishingActive then return end
                
                task.wait(0.2)
                
                local spamX = camSize.X * 0.35
                local spamY = camSize.Y * 0.4
                
                local spamStart = tick()
                while fishingActive and (tick() - spamStart < 6.0) do
                    if isWaitingForBite() or isCatchPopupVisible() then
                        break
                    end
                    
                    tapScreen(spamX, spamY)
                    task.wait(0.04)
                end
                
                local restStart = tick()
                while fishingActive and (tick() - restStart < 2.8) do
                    task.wait(0.1)
                end
            end)
        end
        task.wait(0.2)
    end
end)

Rayfield:LoadConfiguration()
