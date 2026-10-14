-- Minecraft Style: Pixel Font, Key Icon & Skybox
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- 1. Apply Ultra-Pixel Font (Monospace / Arcade) to all UI text
local function applyPixelFont(parent)
    for _, descendant in ipairs(parent:GetDescendants()) do
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            descendant.Font = Enum.Font.Arcade
            -- Remove anti-aliasing text effects if supported
            if descendant:IsA("TextLabel") then
                descendant.TextScaled = false
            end
        end
    end
end

if PlayerGui then
    applyPixelFont(PlayerGui)
    PlayerGui.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
            descendant.Font = Enum.Font.Arcade
        end
    end)
end

-- 2. Convert Key indicators to Minecraft-style key icons/text
local function replaceKeyIcons(parent)
    for _, descendant in ipairs(parent:GetDescendants()) do
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
            if descendant.Text:lower():find("key") then
                descendant.Text = descendant.Text:gsub("[Kk]ey", "🗝️ [MC Key]")
            end
        end
    end
end

if PlayerGui then
    replaceKeyIcons(PlayerGui)
    PlayerGui.DescendantAdded:Connect(function(descendant)
        if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
            if descendant.Text:lower():find("key") then
                descendant.Text = descendant.Text:gsub("[Kk]ey", "🗝️ [MC Key]")
            end
        end
    end)
end

-- 3. Apply Minecraft Skybox Textures
-- Clears existing skyboxes and applies classic Minecraft pixelated sky textures using Roblox asset IDs
for _, child in ipairs(Lighting:GetChildren()) do
    if child:IsA("Sky") then
        child:Destroy()
    end
end

local MinecraftSky = Instance.new("Sky")
MinecraftSky.Name = "MinecraftSkybox"
-- Classic retro skybox asset mappings (using clean blocky/pixel variants)
MinecraftSky.SkyboxBk = "rbxassetid://134637176"
MinecraftSky.SkyboxDn = "rbxassetid://134637189"
MinecraftSky.SkyboxFt = "rbxassetid://134637206"
MinecraftSky.SkyboxLf = "rbxassetid://134637218"
MinecraftSky.SkyboxRt = "rbxassetid://134637237"
MinecraftSky.SkyboxUp = "rbxassetid://134637257"
MinecraftSky.Parent = Lighting

print("Minecraft Pixel Font, Key Icon & Skybox Loaded!")
