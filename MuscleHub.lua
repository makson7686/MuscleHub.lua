-- Simple Muscle Hub (Studio-safe)
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MuscleHub"
gui.ResetOnSpawn = false
gui.Parent = lp:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(260, 280)
frame.Position = UDim2.fromOffset(30, 120)
frame.BackgroundTransparency = 0.15
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -12, 0, 28)
title.Position = UDim2.fromOffset(6, 6)
title.BackgroundTransparency = 1
title.Text = "Muscle Legends Hub (demo)"
title.TextScaled = true
title.Parent = frame

local list = Instance.new("UIListLayout")
list.Padding = UDim.new(0, 6)
list.HorizontalAlignment = Enum.HorizontalAlignment.Center
list.SortOrder = Enum.SortOrder.LayoutOrder
list.Parent = frame

local function makeToggle(text, onChange)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -12, 0, 34)
    btn.BackgroundTransparency = 0.1
    btn.TextScaled = true
    btn.Text = "OFF — "..text
    btn.LayoutOrder = 10
    btn.Parent = frame

    local on = false
    btn.Activated:Connect(function()
        on = not on
        btn.Text = (on and "ON  — " or "OFF — ")..text
        onChange(on, btn)
    end)
    return btn
end

-- Anti-AFK (демо: «шевелим» камеру)
local afkConn
makeToggle("Anti-AFK (demo)", function(on)
    if on then
        local t = 0
        afkConn = RunService.RenderStepped:Connect(function(dt)
            t += dt
            if workspace.CurrentCamera then
                workspace.CurrentCamera.CFrame *= CFrame.Angles(0, math.sin(t/2)*0.0005, 0)
            end
        end)
    else
        if afkConn then afkConn:Disconnect() afkConn = nil end
    end
end)

-- Маленький/обычный размер (работает на R15 в своей игре)
local function setScale(hum, value)
    local names = {
        "BodyDepthScale", "BodyHeightScale", "BodyWidthScale",
        "HeadScale"
    }
    for _,n in ipairs(names) do
        local s = hum:FindFirstChild(n)
        if s and s:IsA("NumberValue") then
            s.Value = value
        end
    end
end

makeToggle("Всегда маленький (demo)", function(on)
    local char = lp.Character or lp.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        if on then
            setScale(hum, 0.6)
        else
            setScale(hum, 1)
        end
    end
end)

-- «Тренировка» (демо: просто выводим в Output)
makeToggle("Auto Train (demo)", function(on)
    if on then
        print("🏋️ Начали автотренировку (демо)")
    else
        print("⛔ Остановили автотренировку (демо)")
    end
end)
