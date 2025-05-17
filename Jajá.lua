-- Carregar Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

-- Criar a janela
local Window = Fluent:CreateWindow({
    Title = "Dead Rails Hub",
    SubTitle = "Feito por Paulo",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker"
})

-- Aba principal
local Tabs = {
    Scripts = Window:AddTab({ Title = "Scripts" })
}

-- Noclip
local noclip = false
game:GetService("RunService").Stepped:Connect(function()
    if noclip and game.Players.LocalPlayer.Character then
        for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

Tabs.Scripts:AddButton({
    Title = "Ativar Noclip",
    Callback = function()
        noclip = true
    end
})

Tabs.Scripts:AddButton({
    Title = "Desativar Noclip",
    Callback = function()
        noclip = false
    end
})

-- Pulo Infinito
local infiniteJumpEnabled = false
local UserInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

Tabs.Scripts:AddButton({
    Title = "Ativar Pulo Infinito",
    Callback = function()
        infiniteJumpEnabled = true
    end
})

Tabs.Scripts:AddButton({
    Title = "Desativar Pulo Infinito",
    Callback = function()
        infiniteJumpEnabled = false
    end
})

UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
