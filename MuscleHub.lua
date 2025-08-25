-- ⚡ Muscle Legends Hub (by dixser, 2025) ⚡
-- Скрипт запускается через loadstring (GitHub/Pastebin)

-- 📦 Подключаем библиотеку GUI
local Library = loadstring(game:HttpGet("https://pastebin.com/raw/zXYkLZKk"))()
local Window = Library:CreateWindow("Muscle Legends Hub")

------------------------------------------------------------
-- ❌ GodMode
Window:Toggle("GodMode", {flag = "god"})
game:GetService("RunService").Stepped:Connect(function()
    if Library.flags.god then
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.Health = math.huge
        end
    end
end)

------------------------------------------------------------
-- 🛡️ Anti Knockback
Window:Toggle("Anti Knockback", {flag = "antikb"})
game:GetService("RunService").Stepped:Connect(function()
    if Library.flags.antikb then
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CustomPhysicalProperties = PhysicalProperties.new(1000, 0, 1000)
        end
    end
end)

------------------------------------------------------------
-- 💤 Anti AFK
Window:Toggle("Anti AFK", {flag = "antiafk"})
spawn(function()
    local vu = game:GetService("VirtualUser")
    while task.wait(60) do
        if Library.flags.antiafk then
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end
    end
end)

------------------------------------------------------------
-- 🔄 AutoSave + Rejoin
Window:Button("Rejoin (Save)", function()
    local ts = game:GetService("TeleportService")
    local p = game.Players.LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)

------------------------------------------------------------
-- 📏 Всегда маленький
Window:Toggle("Always Small", {flag = "smol"})
game:GetService("RunService").Stepped:Connect(function()
    if Library.flags.smol then
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Size = Vector3.new(2,2,1)
        end
    end
end)

------------------------------------------------------------
-- 🚀 Снова большой
Window:Button("Big Size", function()
    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if hrp then
        hrp.Size = Vector3.new(10,10,10)
    end
end)

------------------------------------------------------------
-- 💪 Авто-кач силы
Window:Toggle("Auto Train", {flag = "autotrain"})
spawn(function()
    while task.wait(1) do
        if Library.flags.autotrain then
            print("🏋️ Качаем силу!") 
            -- пример: RemoteEvent для кача силы
            -- game:GetService("ReplicatedStorage").RemoteEvent:FireServer("GainMuscle")
        end
    end
end)

------------------------------------------------------------
-- 💎 Авто-сбор гемов
Window:Toggle("Auto Gems", {flag = "autogems"})
spawn(function()
    while task.wait(2) do
        if Library.flags.autogems then
            for _,v in pairs(workspace:GetChildren()) do
                if v.Name == "Gem" and v:IsA("Part") then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                    task.wait(0.1)
                end
            end
        end
    end
end)

------------------------------------------------------------
-- 🔁 Авто-ребёрт
Window:Toggle("Auto Rebirth", {flag = "autorebirth"})
spawn(function()
    local player = game.Players.LocalPlayer
    local rebirths = 0
    while task.wait(3) do
        if Library.flags.autorebirth then
            local strength = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Strength")
            if strength and strength.Value >= 1000 then
                strength.Value = 0
                rebirths += 1
                print("♻️ Ребёрт сделан! Всего: "..rebirths)
            end
        end
    end
end)
