--[[
    Solvix Hub - Handler
    Manages the loading screen and initializes the main GUI
]]

local SolvixHandler = {}

-- Create main GUI container
function SolvixHandler:CreateContainer()
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

    return screenGui
end

-- Show loading screen
function SolvixHandler:ShowLoadingScreen(container)
    -- Create loading screen frame
    local frame = Instance.new("Frame")
    frame.Name = "SolvixLoadingScreen"
    frame.Size = UDim2.new(0, 300, 0, 150)
    frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = container
    
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
    
    -- Version
    local version = Instance.new("TextLabel")
    version.Name = "Version"
    version.Size = UDim2.new(1, 0, 0, 20)
    version.Position = UDim2.new(0, 0, 0, 40)
    version.BackgroundTransparency = 1
    version.Text = "v1.0.0"
    version.TextColor3 = Color3.fromRGB(200, 200, 200)
    version.TextSize = 14
    version.Font = Enum.Font.Gotham
    version.Parent = frame
    
    -- Status text
    local status = Instance.new("TextLabel")
    status.Name = "Status"
    status.Size = UDim2.new(1, 0, 0, 20)
    status.Position = UDim2.new(0, 0, 0, 70)
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
    progressBg.Position = UDim2.new(0.1, 0, 0, 100)
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
    
    -- Create animated dot
    local dot = Instance.new("Frame")
    dot.Name = "AnimatedDot"
    dot.Size = UDim2.new(0, 8, 0, 8)
    dot.Position = UDim2.new(0.5, -4, 0, 125)
    dot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    dot.BorderSizePixel = 0
    dot.Parent = frame
    
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(1, 0)
    dotCorner.Parent = dot
    
    -- Animate the dot
    spawn(function()
        while frame and frame.Parent do
            for i = 0, 1, 0.02 do
                if not frame or not frame.Parent then break end
                dot.Position = UDim2.new(0.3 + 0.4 * i, -4, 0, 125)
                wait(0.02)
            end
        end
    end)
    
    return {
        frame = frame,
        status = status,
        progressFill = progressFill,
        updateProgress = function(progress, text)
            if not frame or not frame.Parent then return end
            
            -- Update progress bar
            progressFill:TweenSize(
                UDim2.new(progress, 0, 1, 0),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )
            
            -- Update status text if provided
            if text then
                status.Text = text
            end
        end,
        hide = function()
            if not frame or not frame.Parent then return end
            
            -- Fade out animation
            for i = 1, 0, -0.1 do
                frame.BackgroundTransparency = 1 - i
                for _, child in pairs(frame:GetChildren()) do
                    if child:IsA("TextLabel") then
                        child.TextTransparency = 1 - i
                    elseif child:IsA("Frame") and child.Name ~= "ProgressBackground" and child.Name ~= "AnimatedDot" then
                        child.BackgroundTransparency = 1 - i
                    end
                end
                dot.BackgroundTransparency = 1 - i
                progressFill.BackgroundTransparency = 1 - i
                wait(0.02)
            end
            
            -- Remove from parent
            frame:Destroy()
        end
    }
end

-- Start the handler
function SolvixHandler:Start(scripts)
    -- Create container
    local container = self:CreateContainer()
    
    -- Show loading screen
    local loadingScreen = self:ShowLoadingScreen(container)
    
    -- Simulate loading process
    spawn(function()
        local loadSteps = {
            { progress = 0.2, text = "Initializing..." },
            { progress = 0.4, text = "Loading UI components..." },
            { progress = 0.6, text = "Loading features..." },
            { progress = 0.8, text = "Finalizing..." },
            { progress = 1.0, text = "Complete!" }
        }
        
        for i, step in ipairs(loadSteps) do
            wait(0.5) -- Simulate loading time
            loadingScreen.updateProgress(step.progress, step.text)
        end
        
        wait(0.5) -- Wait a bit before hiding
        loadingScreen.hide()
        
        -- Initialize UI after loading screen is hidden
        if scripts.ui then
            self:InitializeUI(container, scripts)
        else
            warn("Failed to initialize UI - UI script not loaded")
        end
    end)
    
    return self
end

-- Initialize the main UI
function SolvixHandler:InitializeUI(container, scripts)
    -- This function will initialize the main UI using the ui script
    -- The implementation depends on how your ui.lua is structured
    
    if scripts.ui and scripts.ui.Initialize then
        scripts.ui:Initialize(container, scripts)
    elseif scripts.ui then
        -- If ui doesn't have an Initialize method, try to use it directly
        local success, result = pcall(function()
            return scripts.ui(container, scripts)
        end)
        
        if not success then
            warn("Failed to initialize UI: " .. tostring(result))
        end
    else
        warn("UI script not found or not properly structured")
    end
end

return SolvixHandler
