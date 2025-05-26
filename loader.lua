--[[
    Solvix Hub - Direct Loader
    Loads all scripts directly without relying on module returns
]]

-- Configuration
local config = {
    githubUser = "bllaer", -- Your GitHub username
    repository = "GAG-Script", -- Your repository name
    branch = "main", -- Branch to pull from
    debug = true -- Set to true to show detailed debug information
}

-- Generate the base URL for raw GitHub content
local baseUrl = string.format(
    "https://raw.githubusercontent.com/%s/%s/%s/", 
    config.githubUser, 
    config.repository, 
    config.branch
)

-- Print debug info
print("=== Solvix Hub Loader ===")
print("Loading from: " .. baseUrl)

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

-- Simple loading screen
local function createLoadingScreen()
    local frame = Instance.new("Frame")
    frame.Name = "SolvixLoadingScreen"
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    -- Add corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "SOLVIX HUB"
    title.TextColor3 = Color3.fromRGB(0, 255, 0)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.Parent = frame
    
    -- Status text
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0, 60)
    status.BackgroundTransparency = 1
    status.Text = "Loading..."
    status.TextColor3 = Color3.fromRGB(200, 200, 200)
    status.TextSize = 14
    status.Font = Enum.Font.Gotham
    status.Parent = frame
    
    -- Progress bar background
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBackground"
    progressBg.Size = UDim2.new(0.8, 0, 0, 10)
    progressBg.Position = UDim2.new(0.1, 0, 0, 90)
    progressBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = frame
    
    local progressBgCorner = Instance.new("UICorner")
    progressBgCorner.CornerRadius = UDim.new(0, 5)
    progressBgCorner.Parent = progressBg
    
    -- Progress bar fill
    local progressFill = Instance.new("Frame")
    progressFill.Name = "ProgressFill"
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    progressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    progressFill.BorderSizePixel = 0
    progressFill.Parent = progressBg
    
    local progressFillCorner = Instance.new("UICorner")
    progressFillCorner.CornerRadius = UDim.new(0, 5)
    progressFillCorner.Parent = progressFill
    
    return {
        frame = frame,
        status = status,
        progressFill = progressFill,
        updateProgress = function(progress, text)
            if text then status.Text = text end
            progressFill:TweenSize(
                UDim2.new(progress, 0, 1, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )
        end,
        hide = function()
            frame:Destroy()
        end
    }
end

-- Function to load a script from GitHub
local function loadScript(scriptName)
    local url = baseUrl .. scriptName .. ".lua"
    local success, result = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success then
        print("✓ Successfully loaded: " .. scriptName)
        return result
    else
        warn("✗ Failed to load: " .. scriptName .. " | Error: " .. tostring(result))
        return nil
    end
end

-- Create the loading screen
local loadingScreen = createLoadingScreen()

-- Load and execute all scripts
spawn(function()
    -- Load UI script
    loadingScreen.updateProgress(0.2, "Loading UI...")
    local uiScript = loadScript("ui")
    if not uiScript then
        loadingScreen.updateProgress(1, "Error loading UI!")
        wait(2)
        loadingScreen.hide()
        return
    end
    
    -- Load features script
    loadingScreen.updateProgress(0.4, "Loading features...")
    local featuresScript = loadScript("features")
    if not featuresScript then
        loadingScreen.updateProgress(1, "Error loading features!")
        wait(2)
        loadingScreen.hide()
        return
    end
    
    -- Load test button script
    loadingScreen.updateProgress(0.6, "Loading components...")
    local testButtonScript = loadScript("test_button")
    if not testButtonScript then
        loadingScreen.updateProgress(1, "Error loading components!")
        wait(2)
        loadingScreen.hide()
        return
    end
    
    -- Execute UI script
    loadingScreen.updateProgress(0.8, "Initializing UI...")
    local success, uiModule = pcall(function()
        return loadstring(uiScript)()
    end)
    
    if not success or not uiModule then
        warn("Failed to initialize UI: " .. tostring(uiModule))
        loadingScreen.updateProgress(1, "Error initializing UI!")
        wait(2)
        loadingScreen.hide()
        return
    end
    
    -- Execute features script
    local success2, featuresModule = pcall(function()
        return loadstring(featuresScript)()
    end)
    
    if not success2 or not featuresModule then
        warn("Failed to initialize features: " .. tostring(featuresModule))
    end
    
    -- Execute test button script
    local success3, testButtonModule = pcall(function()
        return loadstring(testButtonScript)()
    end)
    
    if not success3 or not testButtonModule then
        warn("Failed to initialize test button: " .. tostring(testButtonModule))
    end
    
    -- Complete loading
    loadingScreen.updateProgress(1, "Loading complete!")
    wait(1)
    loadingScreen.hide()
    
    -- Initialize UI
    if uiModule and uiModule.Initialize then
        local ui = uiModule:Initialize(screenGui, {
            features = featuresModule,
            testButton = testButtonModule
        })
        
        print("Solvix Hub loaded successfully!")
    else
        warn("UI module doesn't have an Initialize method!")
    end
end)

-- Return success
return true
