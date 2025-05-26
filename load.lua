--[[
    Solvix Hub - Main Loader
    This script loads all components from GitHub repository
]]

local SolvixHub = {}
SolvixHub.Version = "1.0.0"
SolvixHub.Name = "Solvix Hub"

-- Configuration
local config = {
    githubRaw = "https://raw.githubusercontent.com/YourUsername/SolvixHub/main/", -- Replace with your actual GitHub repo
    modules = {
        "loadingScreen",
        "mainGUI"
        -- Add more modules as needed
    }
}

-- Create main GUI container
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SolvixHubContainer"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Handle protection/hiding from game detection
if syn then
    syn.protect_gui(screenGui)
    screenGui.Parent = game:GetService("CoreGui")
elseif gethui then
    screenGui.Parent = gethui()
else
    screenGui.Parent = game:GetService("CoreGui")
end

SolvixHub.ScreenGui = screenGui

-- Function to load a module from GitHub
function SolvixHub:LoadModule(moduleName)
    local success, result = pcall(function()
        local moduleUrl = config.githubRaw .. moduleName .. ".lua"
        local moduleCode = game:HttpGet(moduleUrl)
        return loadstring(moduleCode)()
    end)
    
    if success then
        print("Successfully loaded module: " .. moduleName)
        return result
    else
        warn("Failed to load module: " .. moduleName .. " | Error: " .. tostring(result))
        return nil
    end
end

-- Initialize the hub
function SolvixHub:Initialize()
    -- Load the loading screen first
    local loadingScreen = self:LoadModule("loadingScreen")
    if loadingScreen then
        loadingScreen:Show(self.ScreenGui)
        
        -- Simulate loading time (can be removed in production)
        task.wait(2)
        
        -- Load all other modules
        local loadedModules = {}
        for i, moduleName in ipairs(config.modules) do
            if moduleName ~= "loadingScreen" then -- Skip loading screen as it's already loaded
                task.wait(0.5) -- Add small delay between module loads for visual effect
                loadingScreen:UpdateProgress(i / #config.modules)
                loadedModules[moduleName] = self:LoadModule(moduleName)
            end
        end
        
        -- Hide loading screen and show main GUI
        task.wait(0.5)
        loadingScreen:UpdateProgress(1)
        task.wait(1)
        loadingScreen:Hide()
        
        -- Initialize main GUI
        if loadedModules.mainGUI then
            loadedModules.mainGUI:Show(self.ScreenGui)
        end
        
        return loadedModules
    else
        warn("Failed to initialize Solvix Hub - Loading screen could not be loaded")
        return nil
    end
end

-- Return the module
return SolvixHub
