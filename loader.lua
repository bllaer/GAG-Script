--[[
    Solvix Hub - Simplified Loader
    Automatically loads all scripts from the GitHub repository
]]

local SolvixLoader = {}

-- Configuration
local config = {
    githubUser = "bllaer", -- Your GitHub username
    repository = "GAG-Script", -- Your repository name
    branch = "main", -- Branch to pull from
    scripts = {
        "handler", -- Will handle the loading screen and main GUI initialization
        "ui", -- Main UI components
        "features", -- Features and functionality
        "test_button", -- Example button
    }
}

-- Generate the base URL for raw GitHub content
local baseUrl = string.format(
    "https://raw.githubusercontent.com/%s/%s/%s/", 
    config.githubUser, 
    config.repository, 
    config.branch
)

-- Function to get a script from GitHub
function SolvixLoader:GetScript(scriptName)
    local url = baseUrl .. scriptName .. ".lua"
    local success, result = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    
    if success then
        print("Successfully loaded: " .. scriptName)
        return result
    else
        warn("Failed to load: " .. scriptName .. " | Error: " .. tostring(result))
        return nil
    end
end

-- Function to load all scripts
function SolvixLoader:LoadAllScripts()
    local loadedScripts = {}
    
    for _, scriptName in ipairs(config.scripts) do
        loadedScripts[scriptName] = self:GetScript(scriptName)
    end
    
    return loadedScripts
end

-- Initialize the loader
function SolvixLoader:Initialize()
    local scripts = self:LoadAllScripts()
    
    -- Start with the handler script which manages the loading screen and main GUI
    if scripts.handler then
        return scripts.handler:Start(scripts)
    else
        warn("Failed to initialize Solvix Hub - Handler script could not be loaded")
        return nil
    end
end

-- Return the loader or immediately initialize based on preference
return SolvixLoader
