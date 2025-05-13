-- Carregar o Vape UI
local Vape = loadstring(game:HttpGet("https://pastebin.com/raw/ZhqYgXPC"))()

-- Chave correta
local correctKey = "OSimãoÉUmPaneleiro"  -- Altere para sua chave real

-- Criar a janela de interface gráfica usando o Vape UI
local Window = Vape:CreateWindow({
    Name = "🔐 Mysdom Hub - Key Validation",
    LoadingTitle = "Verifying key...",
    LoadingSubtitle = "Powered by Mysdom",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "MysdomHub",
        FileName = "KeyConfig"
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false
})

-- Criar uma aba para a entrada de chave
local keyTab = Window:CreateTab("Enter Key", 4483362458)

-- Criar campo de entrada para a chave
keyTab:CreateInput({
    Name = "Insert your key",
    PlaceholderText = "Enter your access key here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(userInput)
        -- Verifica se a chave inserida é a correta
        if userInput == correctKey then
            Vape:Notify({
                Title = "✅ Access Granted",
                Content = "Welcome to Mysdom Hub!",
                Duration = 3
            })

            -- Espera 2 segundos para fechar a interface
            wait(2)
            game:GetService("CoreGui"):FindFirstChild("Vape"):Destroy()

            -- Aqui você pode adicionar a lógica para carregar o script específico para o jogo
            -- Exemplo de carregar o script para Arise Crossover (ID do jogo: 87039211657390)
            if game.PlaceId == 87039211657390 then
                local ariseScriptURL = "https://raw.githubusercontent.com/poluxen/Mysdom-Hub/main/scripts/arise.lua"
                loadstring(game:HttpGet(ariseScriptURL))()
            else
                warn("[Mysdom Hub] Unsupported game or not added yet.")
            end
        else
            Vape:Notify({
                Title = "❌ Invalid Key",
                Content = "Please enter a valid key.",
                Duration = 3
            })
        end
    end
})
