-- Definindo a chave correta
local correctKey = "MysdomKey123"  -- Altere para sua chave desejada

-- Criando a GUI simples para a entrada de chave
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.Position = UDim2.new(0, 0, 0, 0)
title.Text = "Enter Access Key"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.BackgroundTransparency = 1
title.Parent = frame

local keyInput = Instance.new("TextBox")
keyInput.Size = UDim2.new(0, 300, 0, 50)
keyInput.Position = UDim2.new(0.5, -150, 0, 60)
keyInput.PlaceholderText = "Enter your key"
keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
keyInput.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyInput.ClearTextOnFocus = false
keyInput.Parent = frame

local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 150, 0, 50)
submitButton.Position = UDim2.new(0.5, -75, 0, 130)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
submitButton.Parent = frame

-- Função para verificar a chave
local function verifyKey()
    local userInput = keyInput.Text
    if userInput == correctKey then
        -- Key is correct
        local successMessage = Instance.new("TextLabel")
        successMessage.Size = UDim2.new(0, 300, 0, 50)
        successMessage.Position = UDim2.new(0.5, -150, 0, 60)
        successMessage.Text = "✅ Access Granted!"
        successMessage.TextColor3 = Color3.fromRGB(0, 255, 0)
        successMessage.TextScaled = true
        successMessage.BackgroundTransparency = 1
        successMessage.Parent = frame

        -- Espera 2 segundos e fecha a GUI
        wait(2)
        screenGui:Destroy()

        -- Aqui você pode colocar a lógica para carregar outros scripts, se necessário
        -- Por exemplo, loadstring(game:HttpGet("URL_DO_SCRIPT_AQUI"))()
    else
        -- Key is incorrect
        local errorMessage = Instance.new("TextLabel")
        errorMessage.Size = UDim2.new(0, 300, 0, 50)
        errorMessage.Position = UDim2.new(0.5, -150, 0, 60)
        errorMessage.Text = "❌ Invalid Key! Try again."
        errorMessage.TextColor3 = Color3.fromRGB(255, 0, 0)
        errorMessage.TextScaled = true
        errorMessage.BackgroundTransparency = 1
        errorMessage.Parent = frame
    end
end

-- Conectar o botão à função de verificação da chave
submitButton.MouseButton1Click:Connect(verifyKey)
