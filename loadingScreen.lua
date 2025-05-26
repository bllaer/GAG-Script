--[[
    Solvix Hub - Loading Screen Module
    Displays a loading screen while other components are being loaded
]]

local LoadingScreen = {}

function LoadingScreen:Show(parent)
    -- Create loading screen frame
    self.Frame = Instance.new("Frame")
    self.Frame.Name = "SolvixLoadingScreen"
    self.Frame.Size = UDim2.new(0, 300, 0, 150)
    self.Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
    self.Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    self.Frame.BorderSizePixel = 0
    self.Frame.Parent = parent
    
    -- Add corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = self.Frame
    
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
    title.Parent = self.Frame
    
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
    version.Parent = self.Frame
    
    -- Status text
    self.Status = Instance.new("TextLabel")
    self.Status.Name = "Status"
    self.Status.Size = UDim2.new(1, 0, 0, 20)
    self.Status.Position = UDim2.new(0, 0, 0, 70)
    self.Status.BackgroundTransparency = 1
    self.Status.Text = "Initializing..."
    self.Status.TextColor3 = Color3.fromRGB(200, 200, 200)
    self.Status.TextSize = 14
    self.Status.Font = Enum.Font.Gotham
    self.Status.Parent = self.Frame
    
    -- Progress bar background
    local progressBg = Instance.new("Frame")
    progressBg.Name = "ProgressBackground"
    progressBg.Size = UDim2.new(0.8, 0, 0, 10)
    progressBg.Position = UDim2.new(0.1, 0, 0, 100)
    progressBg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = self.Frame
    
    local progressBgCorner = Instance.new("UICorner")
    progressBgCorner.CornerRadius = UDim.new(0, 5)
    progressBgCorner.Parent = progressBg
    
    -- Progress bar fill
    self.ProgressFill = Instance.new("Frame")
    self.ProgressFill.Name = "ProgressFill"
    self.ProgressFill.Size = UDim2.new(0, 0, 1, 0)
    self.ProgressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    self.ProgressFill.BorderSizePixel = 0
    self.ProgressFill.Parent = progressBg
    
    local progressFillCorner = Instance.new("UICorner")
    progressFillCorner.CornerRadius = UDim.new(0, 5)
    progressFillCorner.Parent = self.ProgressFill
    
    -- Create loading animation
    self:CreateLoadingAnimation()
end

function LoadingScreen:CreateLoadingAnimation()
    -- Create a small animated dot at the bottom
    self.Dot = Instance.new("Frame")
    self.Dot.Name = "AnimatedDot"
    self.Dot.Size = UDim2.new(0, 8, 0, 8)
    self.Dot.Position = UDim2.new(0.5, -4, 0, 125)
    self.Dot.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    self.Dot.BorderSizePixel = 0
    self.Dot.Parent = self.Frame
    
    local dotCorner = Instance.new("UICorner")
    dotCorner.CornerRadius = UDim.new(1, 0)
    dotCorner.Parent = self.Dot
    
    -- Animate the dot
    spawn(function()
        while self.Frame and self.Frame.Parent do
            for i = 0, 1, 0.02 do
                if not self.Frame or not self.Frame.Parent then break end
                self.Dot.Position = UDim2.new(0.3 + 0.4 * i, -4, 0, 125)
                wait(0.02)
            end
        end
    end)
end

function LoadingScreen:UpdateProgress(progress, statusText)
    if not self.Frame or not self.Frame.Parent then return end
    
    -- Update progress bar
    self.ProgressFill:TweenSize(
        UDim2.new(progress, 0, 1, 0),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.2,
        true
    )
    
    -- Update status text if provided
    if statusText then
        self.Status.Text = statusText
    else
        local loadingTexts = {
            "Loading modules...",
            "Preparing interface...",
            "Initializing features...",
            "Almost ready..."
        }
        
        local textIndex = math.floor(progress * #loadingTexts) + 1
        if textIndex > #loadingTexts then textIndex = #loadingTexts end
        self.Status.Text = loadingTexts[textIndex]
    end
end

function LoadingScreen:Hide()
    if not self.Frame or not self.Frame.Parent then return end
    
    -- Fade out animation
    for i = 1, 0, -0.1 do
        self.Frame.BackgroundTransparency = 1 - i
        for _, child in pairs(self.Frame:GetChildren()) do
            if child:IsA("TextLabel") then
                child.TextTransparency = 1 - i
            elseif child:IsA("Frame") and child.Name ~= "ProgressBackground" and child.Name ~= "AnimatedDot" then
                child.BackgroundTransparency = 1 - i
            end
        end
        self.Dot.BackgroundTransparency = 1 - i
        self.ProgressFill.BackgroundTransparency = 1 - i
        wait(0.02)
    end
    
    -- Remove from parent
    self.Frame:Destroy()
    self.Frame = nil
end

return LoadingScreen
