-- =============================================================================
-- FLUTO PANEL - VENYX ANTI-DETECTION ENGINE (SOUTH BRONX SPECIAL v2)
-- =============================================================================

-- 1. UTILS & SECURITY CONFIG
local CONFIG = {
    CORRECT_KEY = "14556090",
    EXPIRY_DAYS = 1,
    MAX_DEVICES = 100
}

-- Load Venyx UI Library
local VenyxLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/Venyx-UI-Library/main/source.lua"))()

-- 2. ANIMASI INTRO AWAL (FLUTO EMAS & BERGOYANG 1 DETIK)
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local function runIntro()
    local introGui = Instance.new("ScreenGui")
    introGui.Name = "FlutoIntro"
    introGui.Parent = CoreGui

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 300, 0, 100)
    textLabel.Position = UDim2.new(0.5, -150, 0.5, -50)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "FLUTO"
    textLabel.Font = Enum.Font.FredokaOne
    textLabel.TextSize = 70
    textLabel.TextColor3 = Color3.fromRGB(255, 215, 0)
    textLabel.Parent = introGui

    local startTime = tick()
    while tick() - startTime < 1.0 do
        textLabel.Position = UDim2.new(0.5, -150 + math.random(-8, 8), 0.5, -50 + math.random(-8, 8))
        task.wait(0.02)
    end
    introGui:Destroy()
end

runIntro()

-- 3. INTERFACE LOGIN SYSTEM (Ukuran 1:1, Hitam Gahar & Matrix Emas)
local loginSuccess = false

local function createLoginWindow()
    local loginGui = Instance.new("ScreenGui")
    loginGui.Name = "FlutoLogin"
    loginGui.Parent = CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 350, 0, 350)
    frame.Position = UDim2.new(0.5, -175, 0.5, -175)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    frame.BorderSizePixel = 0
    frame.Parent = loginGui

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 3
    stroke.Color = Color3.fromRGB(218, 165, 32)
    stroke.Parent = frame

    local particleFrame = Instance.new("Frame")
    particleFrame.Size = UDim2.new(1, 0, 1, 0)
    particleFrame.BackgroundTransparency = 1
    particleFrame.ClipsDescendants = true
    particleFrame.Parent = frame
    
    task.spawn(function()
        while loginGui.Parent do
            local p = Instance.new("TextLabel")
            p.Text = tostring(math.random(0, 1))
            p.TextColor3 = Color3.fromRGB(255, 215, 0)
            p.BackgroundTransparency = 1
            p.TextSize = math.random(11, 15)
            p.Font = Enum.Font.Code
            p.Position = UDim2.new(math.random(), 0, 0, -10)
            p.Parent = particleFrame
            
            TweenService:Create(p, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {Position = UDim2.new(p.Position.X.Scale, 0, 1, 10)}):Play()
            game:GetService("Debris"):AddItem(p, 2.5)
            task.wait(0.15)
        end
    end)

    local title = Instance.new("TextLabel")
    title.Text = "FLUTO PANEL"
    title.Size = UDim2.new(1, 0, 0, 50)
    title.Position = UDim2.new(0, 0, 0, 30)
    title.Font = Enum.Font.GothamBold
    title.TextColor3 = Color3.fromRGB(255, 215, 0)
    title.TextSize = 32
    title.BackgroundTransparency = 1
    title.Parent = frame

    local titleStroke = Instance.new("UIStroke")
    titleStroke.Thickness = 2
    titleStroke.Color = Color3.fromRGB(139, 69, 19)
    titleStroke.Parent = title

    local subTitle = Instance.new("TextLabel")
    subTitle.Text = "masukan key"
    subTitle.Size = UDim2.new(1, 0, 0, 30)
    subTitle.Position = UDim2.new(0, 0, 0, 80)
    subTitle.Font = Enum.Font.Gotham
    subTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
    subTitle.TextSize = 16
    subTitle.BackgroundTransparency = 1
    subTitle.Parent = frame

    local inputKey = Instance.new("TextBox")
    inputKey.Size = UDim2.new(0, 260, 0, 45)
    inputKey.Position = UDim2.new(0.5, -130, 0.5, -10)
    inputKey.PlaceholderText = "Input Key Here..."
    inputKey.Text = ""
    inputKey.Font = Enum.Font.Gotham
    inputKey.TextSize = 16
    inputKey.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    inputKey.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputKey.Parent = frame
    
    local inputStroke = Instance.new("UIStroke")
    inputStroke.Thickness = 1
    inputStroke.Color = Color3.fromRGB(218, 165, 32)
    inputStroke.Parent = inputKey

    local loginBtn = Instance.new("TextButton")
    loginBtn.Size = UDim2.new(0, 160, 0, 45)
    loginBtn.Position = UDim2.new(0.5, -80, 0.5, 60)
    loginBtn.Text = "Login"
    loginBtn.Font = Enum.Font.GothamBold
    loginBtn.TextSize = 18
    loginBtn.BackgroundColor3 = Color3.fromRGB(218, 165, 32)
    loginBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    loginBtn.Parent = frame

    loginBtn.MouseButton1Click:Connect(function()
        if inputKey.Text == CONFIG.CORRECT_KEY then
            loginSuccess = true
            loginGui:Destroy()
        else
            inputKey.Text = ""
            inputKey.PlaceholderText = "KEY INVALID!"
        end
    end)

    repeat task.wait() until loginSuccess
end

createLoginWindow()

-- =============================================================================
-- 4. MAIN MOD MENU (VENYX SCROLLABLE & BYPASS SECTIONS)
-- =============================================================================

local Venyx = VenyxLib.new("FLUTO PANEL", "SOUTH BRONX SPECIAL")

local Theme = {
    Background = Color3.fromRGB(15, 15, 15),
    Glow = Color3.fromRGB(218, 165, 32),
    Accent = Color3.fromRGB(255, 215, 0),
    LightContrast = Color3.fromRGB(25, 25, 25),
    DarkContrast = Color3.fromRGB(10, 10, 10),
    TextColor = Color3.fromRGB(255, 255, 255)
}

for colorName, colorValue in pairs(Theme) do
    pcall(function() Venyx:ChangeTheme(colorName, colorValue) end)
end

-- Refresh Scroll otomatis agar semua komponen baru termuat sempurna
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local mainFrame = game:GetService("CoreGui")["FLUTO PANEL"]:FindFirstChild("Main", true)
            if mainFrame then
                for _, container in ipairs(mainFrame:GetDescendants()) do
                    if container:IsA("ScrollingFrame") then
                        container.AutomaticCanvasSize = Enum.AutomaticCanvasSize.Y
                        container.ScrollBarThickness = 5
                        container.ScrollingEnabled = true
                    end
                end
            end
        end)
    end
end)

local Features = {
    EnableFunction = false,
    NoRecoil = false,
    AimSilent = false,
    Fps120 = false,
    EspBox = false,
    EspHealth = false,
    TornadoPlayer = false,
    Wallhack = false
}

local MainTab = Venyx:addPage("ENABLE FUNCTION", "rbxassetid://4370338392")
local VisualTab = Venyx:addPage("ESP VISUAL", "rbxassetid://4370329695")

local CombatSection = MainTab:addSection("Safe Hybrid Combat")
local MovementSection = MainTab:addSection("Player Mechanics")

local RenderSection = VisualTab:addSection("Visual ESP Rendering")
local ExtraVisualSection = VisualTab:addSection("Visual Mechanics & Movement") -- Menu baru di bawah visual

-- MASTER TOGGLE
CombatSection:addToggle("ENABLE FUNCTION", false, function(Value)
    Features.EnableFunction = Value
end)

-- 1. NO RECOIL
CombatSection:addToggle("NO RECOIL", false, function(Value)
    Features.NoRecoil = Value
    task.spawn(function()
        while true do
            if Features.EnableFunction and Features.NoRecoil then
                pcall(function()
                    local lp = game.Players.LocalPlayer
                    if lp and lp.Character then
                        for _, tool in ipairs(lp.Character:GetChildren()) do
                            if tool:IsA("Tool") then
                                local config = tool:FindFirstChild("Configuration") or tool:FindFirstChild("Config")
                                if config then
                                    for _, prop in ipairs(config:GetChildren()) do
                                        if prop:IsA("NumberValue") or prop:IsA("IntValue") then
                                            if prop.Name:lower():find("recoil") or prop.Name:lower():find("spread") then
                                                prop.Value = 0.0001 + (math.random(-5, 5) * 0.00001)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end
            task.wait(0.6 + math.random(0.1, 0.3))
        end
    end)
end)

-- 2. AIM SILENT (Look Head Silaman Tanpa Sentuh IndexInstance / Metamethod)
CombatSection:addToggle("AIM SILENT", false, function(Value)
    Features.AimSilent = Value
    
    local Camera = game.Workspace.CurrentCamera
    local Players = game.Players
    local LocalPlayer = Players.LocalPlayer

    local function getClosestSafeTarget()
        local maxDist = math.huge
        local targetHead = nil
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("Head") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                local pos, onScreen = Camera:WorldToViewportPoint(p.Character.Head.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if dist < maxDist then
                        maxDist = dist
                        targetHead = p.Character.Head
                    end
                end
            end
        end
        return targetHead
    end

    -- Manipulasi Vector Peluru via LookAt Simulasi Client agar aman dari deteksi index
    game:GetService("RunService").Heartbeat:Connect(function()
        if Features.EnableFunction and Features.AimSilent then
            local target = getClosestSafeTarget()
            local character = LocalPlayer.Character
            if target and character and game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                local tool = character:FindFirstChildOfClass("Tool")
                if tool and tool:FindFirstChild("Handle") then
                    -- Belokkan arah part penembak ke kepala target tanpa mengunci kamera utama
                    tool.Handle.CFrame = CFrame.new(tool.Handle.Position, target.Position + Vector3.new(0, 0.05, 0))
                end
            end
        end
    end)
end)

-- 3. FPS 120
MovementSection:addToggle("FPS 120", false, function(Value)
    Features.Fps120 = Value
    if setfpscap then
        setfpscap(Features.Fps120 and 120 or 60)
    end
end)


-- =============================================================================
-- TAB VISUAL & STRUKTUR BAWAH VISUAL (PERBAIKAN POSISI CODES)
-- =============================================================================

-- 4. ESP BOX 2D (Garis Putih Bersih)
local Boxes = {}
RenderSection:addToggle("ESP BOX", false, function(Value)
    Features.EspBox = Value
    if not Features.EspBox then
        for _, box in pairs(Boxes) do if box then box:Remove() end end
        Boxes = {}
    end
end)

-- 5. ESP HEALTH BAR (Hijau Saja Di Samping Kiri Musuh, Tanpa Angka)
local HealthBars = {}
local HealthBackgrounds = {}

RenderSection:addToggle("ESP HEALTH", false, function(Value)
    Features.EspHealth = Value
    if not Features.EspHealth then
        for _, bar in pairs(HealthBars) do if bar then bar:Remove() end end
        for _, bg in pairs(HealthBackgrounds) do if bg then bg:Remove() end end
        HealthBars = {}
        HealthBackgrounds = {}
    end
end)

-- Render Loop Tunggal Drawing API untuk Box Putih & Bar Hijau Samping
game:GetService("RunService").RenderStepped:Connect(function()
    for _, p in ipairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local hrp = p.Character.HumanoidRootPart
            local hum = p.Character.Humanoid
            local camera = game.Workspace.CurrentCamera
            local pos, onScreen = camera:WorldToViewportPoint(hrp.Position)
            
            if onScreen then
                local scale = 1 / (pos.Z * math.tan(math.rad(camera.FieldOfView * 0.5))) * 1000
                local w, h = 2.5 * scale, 4.5 * scale
                local boxPosX, boxPosY = pos.X - w/2, pos.Y - h/2
                
                -- Handler Box Putih
                if Features.EnableFunction and Features.EspBox then
                    if not Boxes[p.Name] then
                        local box = Drawing.new("Square")
                        box.Thickness = 1.5
                        box.Color = Color3.fromRGB(255, 255, 255) -- Putih
                        box.Filled = false
                        box.Visible = true
                        Boxes[p.Name] = box
                    end
                    Boxes[p.Name].Size = Vector2.new(w, h)
                    Boxes[p.Name].Position = Vector2.new(boxPosX, boxPosY)
                    Boxes[p.Name].Visible = true
                else
                    if Boxes[p.Name] then Boxes[p.Name].Visible = false end
                end
                
                -- Handler Health Bar Hijau (Di Samping Kiri Box)
                if Features.EnableFunction and Features.EspHealth then
                    if not HealthBars[p.Name] then
                        -- Background Hitam Tipis untuk bar darah
                        local bg = Drawing.new("Square")
                        bg.Thickness = 1
                        bg.Color = Color3.fromRGB(0, 0, 0)
                        bg.Filled = true
                        bg.Visible = true
                        HealthBackgrounds[p.Name] = bg

                        -- Bar Hijau Inti
                        local bar = Drawing.new("Square")
                        bar.Thickness = 1
                        bar.Color = Color3.fromRGB(0, 255, 0) -- Hijau Saja
                        bar.Filled = true
                        bar.Visible = true
                        HealthBars[p.Name] = bar
                    end
                    
                    local healthPercentage = hum.Health / hum.MaxHealth
                    local barWidth = 3
                    local barPosX = boxPosX - 6 -- Jarak ke samping kiri musuh
                    
                    -- Update Background Bar
                    HealthBackgrounds[p.Name].Size = Vector2.new(barWidth, h)
                    HealthBackgrounds[p.Name].Position = Vector2.new(barPosX, boxPosY)
                    HealthBackgrounds[p.Name].Visible = true
                    
                    -- Update Bar Hijau Dinamis Berdasarkan Sisa Darah
                    HealthBars[p.Name].Size = Vector2.new(barWidth, h * healthPercentage)
                    HealthBars[p.Name].Position = Vector2.new(barPosX, boxPosY + (h * (1 - healthPercentage)))
                    HealthBars[p.Name].Visible = true
                else
                    if HealthBars[p.Name] then HealthBars[p.Name].Visible = false end
                    if HealthBackgrounds[p.Name] then HealthBackgrounds[p.Name].Visible = false end
                end
            else
                if Boxes[p.Name] then Boxes[p.Name].Visible = false end
                if HealthBars[p.Name] then HealthBars[p.Name].Visible = false end
                if HealthBackgrounds[p.Name] then HealthBackgrounds[p.Name].Visible = false end
            end
        else
            if Boxes[p.Name] then Boxes[p.Name].Visible = false end
            if HealthBars[p.Name] then HealthBars[p.Name].Visible = false end
            if HealthBackgrounds[p.Name] then HealthBackgrounds[p.Name].Visible = false end
        end
    end
end)

-- 6. TORNADO PLAYER (Pindah Ke Bawah Menu Visual)
ExtraVisualSection:addToggle("TORNADO PLAYER", false, function(Value)
    Features.TornadoPlayer = Value
    task.spawn(function()
        while true do
            if Features.EnableFunction and Features.TornadoPlayer then
                local character = game.Players.LocalPlayer.Character
                local hrp = character and character:FindFirstChild("HumanoidRootPart")
                if hrp and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
                    hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(50), 0)
                end
            end
            task.wait(0.02)
        end
    end)
end)

-- 7. WALLHACK / NOCLIP (Pindah Ke Bawah Menu Visual)
local NoclipConnection
ExtraVisualSection:addToggle("WALLHACK (NOCLIP)", false, function(Value)
    Features.Wallhack = Value
    if NoclipConnection then NoclipConnection:Disconnect() end
    
    if Features.Wallhack then
        NoclipConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if Features.EnableFunction and Features.Wallhack and game.Players.LocalPlayer.Character then
                for _, part in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end
        end)
    end
end)


-- =============================================================================
-- 5. MINIMIZE OVERLAY SYSTEM (ICON FLUTO KECIL BISA DIGESER)
-- =============================================================================

local floatGui = Instance.new("ScreenGui")
floatGui.Name = "FlutoOverlayIcon"
floatGui.Parent = game:GetService("CoreGui")

local iconBtn = Instance.new("TextButton")
iconBtn.Size = UDim2.new(0, 50, 0, 20)
iconBtn.Position = UDim2.new(0.1, 0, 0.1, 0)
iconBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
iconBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
iconBtn.Text = "FLUTO"
iconBtn.Font = Enum.Font.SourceSansBold
iconBtn.TextSize = 11
iconBtn.BorderSizePixel = 1
iconBtn.BorderColor3 = Color3.fromRGB(255, 215, 0)
iconBtn.Parent = floatGui

local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

iconBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = iconBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)

iconBtn.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        iconBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

local uiToggled = true
iconBtn.MouseButton1Click:Connect(function()
    uiToggled = not uiToggled
    Venyx:toggle()
end)
