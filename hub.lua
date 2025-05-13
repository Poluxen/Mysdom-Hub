-- Mysdom Hub Main Script - Key + Game Auto Detection


-- SETTINGS
local correctKey = "OSimãoÉUmGandaPaneleiro" -- Change this to your preferred key
local ariseScriptURL = "https://raw.githubusercontent.com/poluxen/Mysdom-Hub/main/scripts/arise.lua"

-- Create Key Window
local keyWindow = Rayfield:CreateWindow({
    Name = "🔐 Mysdom Hub - Key System",
    LoadingTitle = "Checking key...",
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

local keyTab = keyWindow:CreateTab("Enter Key", 4483362458)

keyTab:CreateInput({
    Name = "Insert your key",
    PlaceholderText = "Enter your access key here...",
    RemoveTextAfterFocusLost = false,
    Callback = function(userInput)
        if userInput == correctKey then
            Rayfield:Notify({
                Title = "✅ Access Granted",
                Content = "Welcome to Mysdom Hub!",
                Duration = 3
            })

            wait(2)
            game:GetService("CoreGui"):FindFirstChild("Rayfield"):Destroy()

            -- Game Detection
            if game.PlaceId == 87039211657390 then
                loadstring(game:HttpGet(ariseScriptURL))()
            else
                warn("[Mysdom Hub] Unsupported game or not added yet.")
            end
        else
            Rayfield:Notify({
                Title = "❌ Invalid Key",
                Content = "Please enter a valid key.",
                Duration = 3
            })
        end
    end
})
