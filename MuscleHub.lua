-- ⚡ Muscle Legends Hub (by dixser, 2025) ⚡
-- Скрипт запускается через loadstring (GitHub)

-- 📦 Подключаем библиотеку GUI
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = Library:MakeWindow({Name = "Muscle Legends Hub", HidePremium = false})

------------------------------------------------------------
-- ❌ GodMode
Window:MakeTab({Name="Main"}):AddToggle({
    Name = "GodMode",
    Default = false,
    Callback = function(Value)
        if Value then
            game:GetService("RunService").Stepped:Connect(function()
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.Health = math.huge
                end
            end)
        end
    end
})

------------------------------------------------------------
-- 🛡️ Anti Knockback
Window:MakeTab({Name="Main"}):AddToggle({
    Name = "Anti Knockback",
    Default = false,
    Callback = function(Value)
        if Value then
            game:GetService("RunService").Stepped:Connect(function()
                local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CustomPhysicalProperties = PhysicalProperties.new(1000, 0, 1000)
                end
            end)
        end
    end
})

------------------------------------------------------------
-- 💤 Anti AFK
Window:MakeTab({Name="Main"}):AddToggle({
    Name = "Anti AFK",
    Default = false,
    Callback = function(Value)
        if Value then
            spawn(function()
                local vu = game:GetService("VirtualUser")
                while task.wait(60) do
                    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                end
            end)
        end
    end
})

------------------------------------------------------------
-- 🔄 AutoSave + Rejoin
Window:MakeTab({Name="Main"}):AddButton({
    Name = "Rejoin (Save)",
    Callback = function()
        local ts = game:GetService("TeleportService")
        ts:Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})

------------------------------------------------------------
-- 📏 Всегда маленький
Window:MakeTab({Name="Main"}):AddToggle({
    Name = "Always Small",
    Default = false,
    Callback = function(Value)
        if Value then
            game:GetService("RunService").Stepped:Connect(function()
                local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(2,2,1)
                end
            end)
        end
    end
})

------------------------------------------------------------
-- 🚀 Снова большой
Window:MakeTab({Name="Main"}):AddButton({
    Name = "Big Size",
    Callback = function()
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Size = Vector3.new(10,10,10)
        end
    end
})

------------------------------------------------------------
-- 💪 Авто-кач силы
Window:MakeTab({Name="Farm"}):AddToggle({
    Name = "Auto Train",
    Default = false,
    Callback = function(Value)
        spawn(function()
            while Value and task.wait(1) do
                print("🏋️ Качаем силу!")
                -- сюда вставь RemoteEvent если найдешь
            end
        end)
    end
})

------------------------------------------------------------
-- 💎 Авто-сбор гемов
Window:MakeTab({Name="Farm"}):AddToggle({
    Name = "Auto Gems",
    Default = false,
    Callback = function(Value)
        spawn(function()
            while Value and task.wait(2) do
                for _,v in pairs(workspace:GetChildren()) do
                    if v.Name == "Gem" and v:IsA("Part") then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                        task.wait(0.1)
                    end
                end
            end
        end)
    end
})

------------------------------------------------------------
-- 🔁 Авто-ребёрт
Window:MakeTab({Name="Farm"}):AddToggle({
    Name = "Auto Rebirth",
    Default = false,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        spawn(function()
            local rebirths = 0
            while Value and task.wait(3) do
                local strength = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Strength")
                if strength and strength.Value >= 1000 then
                    strength.Value = 0
                    rebirths += 1
                    print("♻️ Ребёрт сделан! Всего: "..rebirths)
                end
            end
        end)
    end
})

Library:Init()
