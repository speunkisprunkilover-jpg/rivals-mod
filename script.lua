-- Rivals Heavy Pixel Font Enforcer
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- Function to make text heavily pixelated and styled
local function pixelateText(textObj)
    textObj.Font = Enum.Font.Arcade
    -- Disabling text scaling forces a raw, un-antialiased pixel appearance on many devices
    textObj.TextScaled = false
    if textObj.TextSize > 10 then
        -- Keep proportional sizing but lock to blocky layout
    end
end

local function scanAndModify(parent)
    for _, descendant in ipairs(parent:GetDescendants()) do
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            pixelateText(descendant)
        end
    end
end

if PlayerGui then
    scanAndModify(PlayerGui)
    PlayerGui.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            task.wait(0.05)
            pixelateText(descendant)
        end
    end
end

print("Heavy Pixel Font Enforcer Loaded!")
    
