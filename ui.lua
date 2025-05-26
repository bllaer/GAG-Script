--[[
    Solvix Hub - UI
    Main user interface for Solvix Hub
]]

local SolvixUI = {}

-- Colors
local COLORS = {
    background = Color3.fromRGB(20, 20, 20),       -- Dark background
    sidebar = Color3.fromRGB(15, 15, 15),          -- Darker sidebar
    header = Color3.fromRGB(15, 15, 15),           -- Dark header
    accent = Color3.fromRGB(0, 255, 0),            -- Green accent
    accentDark = Color3.fromRGB(0, 200, 0),        -- Darker green for hover
    text = Color3.fromRGB(255, 255, 255),          -- White text
    subText = Color3.fromRGB(180, 180, 180),       -- Light gray text
    disabled = Color3.fromRGB(100, 100, 100),      -- Disabled text
    button = Color3.fromRGB(30, 30, 30),           -- Button background
    buttonHover = Color3.fromRGB(40, 40, 40),      -- Button hover
    divider = Color3.fromRGB(40, 40, 40),          -- Divider lines
    success = Color3.fromRGB(0, 255, 0),           -- Success color
    warning = Color3.fromRGB(255, 255, 0),         -- Warning color
    error = Color3.fromRGB(255, 0, 0)              -- Error color
}

-- Initialize the UI
function SolvixUI:Initialize(container, scripts)
    -- Create main frame
    self.Frame = Instance.new("Frame")
    self.Frame.Name = "SolvixHubMain"
    self.Frame.Size = UDim2.new(0, 650, 0, 400) -- Larger size for better UI
    self.Frame.Position = UDim2.new(0.5, -325, 0.5, -200)
    self.Frame.BackgroundColor3 = COLORS.background
    self.Frame.BorderSizePixel = 0
    self.Frame.Visible = true
    self.Frame.Parent = container
    
    -- Add corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = self.Frame
    
    -- Add drop shadow
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Size = UDim2.new(1, 30, 1, 30)
    shadow.Position = UDim2.new(0, -15, 0, -15)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.ZIndex = -1
    shadow.Parent = self.Frame
    
    -- Create header with logo and title
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 40)
    header.BackgroundColor3 = COLORS.header
    header.BorderSizePixel = 0
    header.Parent = self.Frame
    
    local headerCorner = Instance.new("UICorner")
    headerCorner.CornerRadius = UDim.new(0, 8)
    headerCorner.Parent = header
    
    -- Only round the top corners
    local headerFix = Instance.new("Frame")
    headerFix.Name = "HeaderFix"
    headerFix.Size = UDim2.new(1, 0, 0.5, 0)
    headerFix.Position = UDim2.new(0, 0, 0.5, 0)
    headerFix.BackgroundColor3 = COLORS.header
    headerFix.BorderSizePixel = 0
    headerFix.ZIndex = 0
    headerFix.Parent = header
    
    -- Logo container
    local logoContainer = Instance.new("Frame")
    logoContainer.Name = "LogoContainer"
    logoContainer.Size = UDim2.new(0, 30, 0, 30)
    logoContainer.Position = UDim2.new(0, 10, 0, 5)
    logoContainer.BackgroundTransparency = 1
    logoContainer.Parent = header
    
    -- Logo image (script icon)
    local logoImage = Instance.new("ImageLabel")
    logoImage.Name = "LogoImage"
    logoImage.Size = UDim2.new(1, 0, 1, 0)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = "rbxassetid://6022668898" -- Script icon
    logoImage.Parent = logoContainer
    
    -- Title with colored text
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0, 200, 1, 0)
    title.Position = UDim2.new(0, 50, 0, 0)
    title.BackgroundTransparency = 1
    title.RichText = true
    title.Text = "<font color='#00FF00'>Scripts</font> | <font color='#FF0000'>Mobile Support</font>"
    title.TextColor3 = COLORS.text
    title.TextSize = 18
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    
    -- Window controls
    local controlsContainer = Instance.new("Frame")
    controlsContainer.Name = "WindowControls"
    controlsContainer.Size = UDim2.new(0, 90, 0, 30)
    controlsContainer.Position = UDim2.new(1, -100, 0, 5)
    controlsContainer.BackgroundTransparency = 1
    controlsContainer.Parent = header
    
    -- Minimize button
    local minimizeBtn = Instance.new("TextButton")
    minimizeBtn.Name = "MinimizeButton"
    minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
    minimizeBtn.Position = UDim2.new(0, 0, 0, 0)
    minimizeBtn.BackgroundColor3 = COLORS.button
    minimizeBtn.Text = "-"
    minimizeBtn.TextColor3 = COLORS.text
    minimizeBtn.TextSize = 16
    minimizeBtn.Font = Enum.Font.GothamBold
    minimizeBtn.Parent = controlsContainer
    
    local minimizeBtnCorner = Instance.new("UICorner")
    minimizeBtnCorner.CornerRadius = UDim.new(0, 4)
    minimizeBtnCorner.Parent = minimizeBtn
    
    -- Fullscreen button
    local fullscreenBtn = Instance.new("TextButton")
    fullscreenBtn.Name = "FullscreenButton"
    fullscreenBtn.Size = UDim2.new(0, 25, 0, 25)
    fullscreenBtn.Position = UDim2.new(0, 30, 0, 0)
    fullscreenBtn.BackgroundColor3 = COLORS.button
    fullscreenBtn.Text = "□"
    fullscreenBtn.TextColor3 = COLORS.text
    fullscreenBtn.TextSize = 16
    fullscreenBtn.Font = Enum.Font.GothamBold
    fullscreenBtn.Parent = controlsContainer
    
    local fullscreenBtnCorner = Instance.new("UICorner")
    fullscreenBtnCorner.CornerRadius = UDim.new(0, 4)
    fullscreenBtnCorner.Parent = fullscreenBtn
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 25, 0, 25)
    closeBtn.Position = UDim2.new(0, 60, 0, 0)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeBtn.Text = "×"
    closeBtn.TextColor3 = COLORS.text
    closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = controlsContainer
    
    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 4)
    closeBtnCorner.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        self:Hide()
    end)
    
    -- Create sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 60, 1, -40)
    sidebar.Position = UDim2.new(0, 0, 0, 40)
    sidebar.BackgroundColor3 = COLORS.sidebar
    sidebar.BorderSizePixel = 0
    sidebar.Parent = self.Frame
    
    local sidebarCorner = Instance.new("UICorner")
    sidebarCorner.CornerRadius = UDim.new(0, 8)
    sidebarCorner.Parent = sidebar
    
    -- Only round the bottom-left corner
    local sidebarFix1 = Instance.new("Frame")
    sidebarFix1.Name = "SidebarFix1"
    sidebarFix1.Size = UDim2.new(0.5, 0, 0, 10)
    sidebarFix1.Position = UDim2.new(0.5, 0, 0, 0)
    sidebarFix1.BackgroundColor3 = COLORS.sidebar
    sidebarFix1.BorderSizePixel = 0
    sidebarFix1.ZIndex = 0
    sidebarFix1.Parent = sidebar
    
    local sidebarFix2 = Instance.new("Frame")
    sidebarFix2.Name = "SidebarFix2"
    sidebarFix2.Size = UDim2.new(1, 0, 1, -10)
    sidebarFix2.Position = UDim2.new(0, 0, 0, 0)
    sidebarFix2.BackgroundColor3 = COLORS.sidebar
    sidebarFix2.BorderSizePixel = 0
    sidebarFix2.ZIndex = 0
    sidebarFix2.Parent = sidebar
    
    -- Create navigation panel (second sidebar)
    local navPanel = Instance.new("Frame")
    navPanel.Name = "NavigationPanel"
    navPanel.Size = UDim2.new(0, 160, 1, -40)
    navPanel.Position = UDim2.new(0, 60, 0, 40)
    navPanel.BackgroundColor3 = COLORS.background
    navPanel.BorderSizePixel = 0
    navPanel.Parent = self.Frame
    
    -- Create content area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -220, 1, -40)
    contentArea.Position = UDim2.new(0, 220, 0, 40)
    contentArea.BackgroundTransparency = 0
    contentArea.BackgroundColor3 = COLORS.background
    contentArea.BorderSizePixel = 0
    contentArea.Parent = self.Frame
    
    -- Create tabs in sidebar with icons
    self.TabButtons = {}
    self.Tabs = {}
    local tabIcons = {
        {name = "News", icon = "rbxassetid://6026568213", color = COLORS.text},
        {name = "Update Log", icon = "rbxassetid://6031763426", color = COLORS.text},
        {name = "Main", icon = "rbxassetid://6034509993", color = COLORS.text},
        {name = "Auto Collect Fruits", icon = "rbxassetid://6031225816", color = COLORS.text},
        {name = "Auto Plant Fruits", icon = "rbxassetid://6034767621", color = COLORS.accent},
        {name = "Auto Sell Fruits", icon = "rbxassetid://6031225816", color = COLORS.text},
        {name = "Auto Buy Seeds", icon = "rbxassetid://6031225816", color = COLORS.text}
    }
    
    for i, tabInfo in ipairs(tabIcons) do
        -- Create tab button with icon
        local tabBtn = Instance.new("ImageButton")
        tabBtn.Name = tabInfo.name .. "Tab"
        tabBtn.Size = UDim2.new(0, 40, 0, 40)
        tabBtn.Position = UDim2.new(0, 10, 0, 10 + (i-1) * 50)
        tabBtn.BackgroundTransparency = 1
        tabBtn.Image = tabInfo.icon
        tabBtn.ImageColor3 = tabInfo.color
        tabBtn.Parent = sidebar
        
        -- Create tab label in nav panel
        local tabLabel = Instance.new("TextLabel")
        tabLabel.Name = tabInfo.name .. "Label"
        tabLabel.Size = UDim2.new(1, -20, 0, 40)
        tabLabel.Position = UDim2.new(0, 10, 0, 10 + (i-1) * 50)
        tabLabel.BackgroundTransparency = 1
        tabLabel.Text = tabInfo.name
        tabLabel.TextColor3 = tabInfo.color
        tabLabel.TextSize = 16
        tabLabel.Font = Enum.Font.Gotham
        tabLabel.TextXAlignment = Enum.TextXAlignment.Left
        tabLabel.Parent = navPanel
        
        -- Create tab content
        local tabContent = Instance.new("Frame")
        tabContent.Name = tabInfo.name .. "Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = tabInfo.name == "Auto Plant Fruits" -- Set Auto Plant Fruits as default
        tabContent.Parent = contentArea
        
        -- Store references
        self.TabButtons[tabInfo.name] = {button = tabBtn, label = tabLabel}
        self.Tabs[tabInfo.name] = tabContent
        
        -- Tab button click handler
        tabBtn.MouseButton1Click:Connect(function()
            self:SwitchTab(tabInfo.name)
        end)
    end
    
    -- Create user info panel at bottom of sidebar
    local userPanel = Instance.new("Frame")
    userPanel.Name = "UserPanel"
    userPanel.Size = UDim2.new(0, 220, 0, 60)
    userPanel.Position = UDim2.new(0, 0, 1, -60)
    userPanel.BackgroundColor3 = COLORS.sidebar
    userPanel.BorderSizePixel = 0
    userPanel.Parent = self.Frame
    
    -- User avatar
    local userAvatar = Instance.new("ImageLabel")
    userAvatar.Name = "UserAvatar"
    userAvatar.Size = UDim2.new(0, 40, 0, 40)
    userAvatar.Position = UDim2.new(0, 10, 0, 10)
    userAvatar.BackgroundColor3 = COLORS.background
    userAvatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png" -- Placeholder
    userAvatar.Parent = userPanel
    
    local userAvatarCorner = Instance.new("UICorner")
    userAvatarCorner.CornerRadius = UDim.new(1, 0) -- Circle
    userAvatarCorner.Parent = userAvatar
    
    -- Username
    local username = Instance.new("TextLabel")
    username.Name = "Username"
    username.Size = UDim2.new(0, 150, 0, 20)
    username.Position = UDim2.new(0, 60, 0, 10)
    username.BackgroundTransparency = 1
    username.Text = "Anonymous"
    username.TextColor3 = COLORS.text
    username.TextSize = 16
    username.Font = Enum.Font.GothamBold
    username.TextXAlignment = Enum.TextXAlignment.Left
    username.Parent = userPanel
    
    -- User ID
    local userId = Instance.new("TextLabel")
    userId.Name = "UserId"
    userId.Size = UDim2.new(0, 150, 0, 20)
    userId.Position = UDim2.new(0, 60, 0, 30)
    userId.BackgroundTransparency = 1
    userId.Text = "@anonymous"
    userId.TextColor3 = COLORS.subText
    userId.TextSize = 14
    userId.Font = Enum.Font.Gotham
    userId.TextXAlignment = Enum.TextXAlignment.Left
    userId.Parent = userPanel
    
    -- Try to load player's avatar and username
    spawn(function()
        local player = game.Players.LocalPlayer
        if player then
            -- Set username
            username.Text = player.Name
            userId.Text = "@" .. string.lower(player.Name)
            
            -- Set avatar
            local userId = player.UserId
            local thumbType = Enum.ThumbnailType.HeadShot
            local thumbSize = Enum.ThumbnailSize.Size420x420
            local content = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
            userAvatar.Image = content
        end
    end)
    
    -- Make the GUI draggable
    self:MakeDraggable(header)
    
    -- Add fade-in animation
    self:FadeIn()
    
    -- Initialize features if available
    if scripts.features then
        self:InitializeFeatures(scripts.features)
    end
    
    return self
end

-- Switch between tabs
function SolvixUI:SwitchTab(tabName)
    -- Hide all tabs
    for name, tab in pairs(self.Tabs) do
        tab.Visible = false
    end
    
    -- Reset all button colors and labels
    for name, elements in pairs(self.TabButtons) do
        elements.button.ImageColor3 = COLORS.text
        elements.label.TextColor3 = COLORS.text
    end
    
    -- Show selected tab and highlight button and label
    self.Tabs[tabName].Visible = true
    self.TabButtons[tabName].button.ImageColor3 = COLORS.accent
    self.TabButtons[tabName].label.TextColor3 = COLORS.accent
    
    -- If this is the Auto Plant Fruits tab, make sure it's properly initialized
    if tabName == "Auto Plant Fruits" and not self.autoPlantInitialized then
        self:InitializeAutoPlantTab()
        self.autoPlantInitialized = true
    end
end

-- Initialize the Auto Plant Seed tab
function SolvixUI:InitializeAutoPlantTab()
    local tab = self.Tabs["Auto Plant Fruits"]
    
    -- Clear any existing content
    for _, child in pairs(tab:GetChildren()) do
        child:Destroy()
    end
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Auto Plant Seed"
    title.TextColor3 = Color3.fromRGB(100, 100, 255) -- Purple/blue color
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Create seed selection section
    local selectionSection = Instance.new("Frame")
    selectionSection.Name = "SelectionSection"
    selectionSection.Size = UDim2.new(1, -40, 0, 120)
    selectionSection.Position = UDim2.new(0, 20, 0, 70)
    selectionSection.BackgroundColor3 = COLORS.background
    selectionSection.BorderSizePixel = 0
    selectionSection.Parent = tab
    
    -- Add corner radius
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = selectionSection
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 10)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = "Select Seeds To Plant"
    sectionTitle.TextColor3 = COLORS.text
    sectionTitle.TextSize = 18
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = selectionSection
    
    -- Section subtitle
    local sectionSubtitle = Instance.new("TextLabel")
    sectionSubtitle.Name = "SectionSubtitle"
    sectionSubtitle.Size = UDim2.new(1, -20, 0, 30)
    sectionSubtitle.Position = UDim2.new(0, 10, 0, 40)
    sectionSubtitle.BackgroundTransparency = 1
    sectionSubtitle.Text = "Select multiple Seeds to plant"
    sectionSubtitle.TextColor3 = COLORS.subText
    sectionSubtitle.TextSize = 16
    sectionSubtitle.Font = Enum.Font.Gotham
    sectionSubtitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionSubtitle.Parent = selectionSection
    
    -- Create dropdown
    local dropdown = Instance.new("Frame")
    dropdown.Name = "Dropdown"
    dropdown.Size = UDim2.new(0, 200, 0, 30)
    dropdown.Position = UDim2.new(1, -220, 0, 35)
    dropdown.BackgroundColor3 = COLORS.button
    dropdown.BorderSizePixel = 0
    dropdown.Parent = selectionSection
    
    local dropdownCorner = Instance.new("UICorner")
    dropdownCorner.CornerRadius = UDim.new(0, 6)
    dropdownCorner.Parent = dropdown
    
    local dropdownText = Instance.new("TextLabel")
    dropdownText.Name = "DropdownText"
    dropdownText.Size = UDim2.new(1, -30, 1, 0)
    dropdownText.Position = UDim2.new(0, 10, 0, 0)
    dropdownText.BackgroundTransparency = 1
    dropdownText.Text = "--"
    dropdownText.TextColor3 = COLORS.text
    dropdownText.TextSize = 16
    dropdownText.Font = Enum.Font.Gotham
    dropdownText.TextXAlignment = Enum.TextXAlignment.Left
    dropdownText.Parent = dropdown
    
    local dropdownArrow = Instance.new("TextLabel")
    dropdownArrow.Name = "DropdownArrow"
    dropdownArrow.Size = UDim2.new(0, 20, 1, 0)
    dropdownArrow.Position = UDim2.new(1, -25, 0, 0)
    dropdownArrow.BackgroundTransparency = 1
    dropdownArrow.Text = "▼"
    dropdownArrow.TextColor3 = COLORS.text
    dropdownArrow.TextSize = 14
    dropdownArrow.Font = Enum.Font.Gotham
    dropdownArrow.Parent = dropdown
    
    -- Create action buttons
    local autoPlantSelectedBtn = self:CreateToggleButton("Auto Plant Selected Seeds", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 210), tab)
    local autoPlantAllBtn = self:CreateToggleButton("Auto Plant All Seeds", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 280), tab)
end

-- Create a toggle button
function SolvixUI:CreateToggleButton(text, size, position, parent)
    local button = Instance.new("Frame")
    button.Name = text:gsub(" ", "") .. "Button"
    button.Size = size
    button.Position = position
    button.BackgroundColor3 = COLORS.background
    button.BorderSizePixel = 0
    button.Parent = parent
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button
    
    local buttonText = Instance.new("TextLabel")
    buttonText.Name = "ButtonText"
    buttonText.Size = UDim2.new(1, -60, 1, 0)
    buttonText.Position = UDim2.new(0, 10, 0, 0)
    buttonText.BackgroundTransparency = 1
    buttonText.Text = text
    buttonText.TextColor3 = COLORS.text
    buttonText.TextSize = 16
    buttonText.Font = Enum.Font.Gotham
    buttonText.TextXAlignment = Enum.TextXAlignment.Left
    buttonText.Parent = button
    
    local toggleBg = Instance.new("Frame")
    toggleBg.Name = "ToggleBackground"
    toggleBg.Size = UDim2.new(0, 40, 0, 24)
    toggleBg.Position = UDim2.new(1, -50, 0.5, -12)
    toggleBg.BackgroundColor3 = COLORS.button
    toggleBg.BorderSizePixel = 0
    toggleBg.Parent = button
    
    local toggleBgCorner = Instance.new("UICorner")
    toggleBgCorner.CornerRadius = UDim.new(1, 0)
    toggleBgCorner.Parent = toggleBg
    
    local toggleCircle = Instance.new("Frame")
    toggleCircle.Name = "ToggleCircle"
    toggleCircle.Size = UDim2.new(0, 20, 0, 20)
    toggleCircle.Position = UDim2.new(0, 2, 0.5, -10)
    toggleCircle.BackgroundColor3 = COLORS.text
    toggleCircle.BorderSizePixel = 0
    toggleCircle.Parent = toggleBg
    
    local toggleCircleCorner = Instance.new("UICorner")
    toggleCircleCorner.CornerRadius = UDim.new(1, 0)
    toggleCircleCorner.Parent = toggleCircle
    
    -- Toggle state
    local enabled = false
    
    -- Make the button clickable
    local buttonClick = Instance.new("TextButton")
    buttonClick.Name = "ButtonClick"
    buttonClick.Size = UDim2.new(1, 0, 1, 0)
    buttonClick.BackgroundTransparency = 1
    buttonClick.Text = ""
    buttonClick.Parent = button
    
    buttonClick.MouseButton1Click:Connect(function()
        enabled = not enabled
        
        if enabled then
            toggleBg.BackgroundColor3 = COLORS.accent
            toggleCircle:TweenPosition(
                UDim2.new(0, 18, 0.5, -10),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )
        else
            toggleBg.BackgroundColor3 = COLORS.button
            toggleCircle:TweenPosition(
                UDim2.new(0, 2, 0.5, -10),
                Enum.EasingDirection.Out,
                Enum.EasingStyle.Quad,
                0.2,
                true
            )
        end
    end)
    
    return {
        frame = button,
        toggle = function(value)
            if value ~= enabled then
                buttonClick.MouseButton1Click:Fire()
            end
        end,
        isEnabled = function()
            return enabled
        end
    }
end

-- Initialize features
function SolvixUI:InitializeFeatures(features)
    if features.SetupTabs then
        features:SetupTabs(self.Tabs, self)
    end
end

-- Make the frame draggable
function SolvixUI:MakeDraggable(dragObject)
    local dragging = false
    local dragInput, mousePos, framePos
    
    dragObject.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            mousePos = input.Position
            framePos = self.Frame.Position
        end
    end)
    
    dragObject.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    dragObject.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - mousePos
            self.Frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)
end

-- Fade in animation
function SolvixUI:FadeIn()
    self.Frame.BackgroundTransparency = 1
    for _, child in pairs(self.Frame:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            child.TextTransparency = 1
        end
        if child:IsA("Frame") or child:IsA("TextButton") then
            child.BackgroundTransparency = 1
        end
        if child:IsA("ImageLabel") then
            child.ImageTransparency = 1
        end
    end
    
    -- Fade in animation
    spawn(function()
        for i = 1, 0, -0.1 do
            if not self.Frame or not self.Frame.Parent then break end
            
            self.Frame.BackgroundTransparency = i
            
            for _, child in pairs(self.Frame:GetDescendants()) do
                if child:IsA("TextLabel") or child:IsA("TextButton") then
                    child.TextTransparency = i
                end
                if (child:IsA("Frame") or child:IsA("TextButton")) and child.Name ~= "Shadow" then
                    child.BackgroundTransparency = i
                end
                if child:IsA("ImageLabel") and child.Name ~= "Shadow" then
                    child.ImageTransparency = i
                end
            end
            
            wait(0.02)
        end
    end)
end

-- Hide the UI
function SolvixUI:Hide()
    -- Fade out animation
    spawn(function()
        for i = 0, 1, 0.1 do
            if not self.Frame or not self.Frame.Parent then break end
            
            self.Frame.BackgroundTransparency = i
            
            for _, child in pairs(self.Frame:GetDescendants()) do
                if child:IsA("TextLabel") or child:IsA("TextButton") then
                    child.TextTransparency = i
                end
                if (child:IsA("Frame") or child:IsA("TextButton")) and child.Name ~= "Shadow" then
                    child.BackgroundTransparency = i
                end
                if child:IsA("ImageLabel") then
                    child.ImageTransparency = 0.5 + i * 0.5
                end
            end
            
            wait(0.02)
        end
        
        if self.Frame and self.Frame.Parent then
            self.Frame:Destroy()
            self.Frame = nil
        end
    end)
end

-- Create a button in a specific tab
function SolvixUI:CreateButton(tabName, buttonText, position, callback)
    if not self.Tabs[tabName] then return nil end
    
    local button = Instance.new("TextButton")
    button.Name = buttonText .. "Button"
    button.Size = UDim2.new(0, 150, 0, 30)
    button.Position = position or UDim2.new(0.5, -75, 0.5, -15)
    button.BackgroundColor3 = COLORS.button
    button.Text = buttonText
    button.TextColor3 = COLORS.text
    button.TextSize = 14
    button.Font = Enum.Font.Gotham
    button.Parent = self.Tabs[tabName]
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 6)
    buttonCorner.Parent = button
    
    -- Hover effect
    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = COLORS.buttonHover
    end)
    
    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = COLORS.button
    end)
    
    -- Click callback
    if callback then
        button.MouseButton1Click:Connect(callback)
    end
    
    return button
end

return SolvixUI
