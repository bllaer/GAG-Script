--[[
    Solvix Hub - Main GUI Module
    The primary interface for the Solvix Hub
]]

local MainGUI = {}

-- Colors
local COLORS = {
    background = Color3.fromRGB(30, 30, 30),
    header = Color3.fromRGB(25, 25, 25),
    accent = Color3.fromRGB(0, 255, 0),
    text = Color3.fromRGB(255, 255, 255),
    subText = Color3.fromRGB(200, 200, 200),
    button = Color3.fromRGB(40, 40, 40),
    buttonHover = Color3.fromRGB(50, 50, 50)
}

function MainGUI:Show(parent)
    -- Create main frame
    self.Frame = Instance.new("Frame")
    self.Frame.Name = "SolvixHubMain"
    self.Frame.Size = UDim2.new(0, 500, 0, 350)
    self.Frame.Position = UDim2.new(0.5, -250, 0.5, -175)
    self.Frame.BackgroundColor3 = COLORS.background
    self.Frame.BorderSizePixel = 0
    self.Frame.Visible = true
    self.Frame.Parent = parent
    
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
    
    -- Create header
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
    
    -- Title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(0, 200, 1, 0)
    title.Position = UDim2.new(0, 15, 0, 0)
    title.BackgroundTransparency = 1
    title.Text = "SOLVIX HUB"
    title.TextColor3 = COLORS.accent
    title.TextSize = 22
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header
    
    -- Close button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Name = "CloseButton"
    closeBtn.Size = UDim2.new(0, 30, 0, 30)
    closeBtn.Position = UDim2.new(1, -40, 0, 5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize = 16
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.Parent = header
    
    local closeBtnCorner = Instance.new("UICorner")
    closeBtnCorner.CornerRadius = UDim.new(0, 6)
    closeBtnCorner.Parent = closeBtn
    
    closeBtn.MouseButton1Click:Connect(function()
        self:Hide()
    end)
    
    -- Create sidebar
    local sidebar = Instance.new("Frame")
    sidebar.Name = "Sidebar"
    sidebar.Size = UDim2.new(0, 120, 1, -40)
    sidebar.Position = UDim2.new(0, 0, 0, 40)
    sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
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
    sidebarFix1.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    sidebarFix1.BorderSizePixel = 0
    sidebarFix1.ZIndex = 0
    sidebarFix1.Parent = sidebar
    
    local sidebarFix2 = Instance.new("Frame")
    sidebarFix2.Name = "SidebarFix2"
    sidebarFix2.Size = UDim2.new(1, 0, 1, -10)
    sidebarFix2.Position = UDim2.new(0, 0, 0, 0)
    sidebarFix2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    sidebarFix2.BorderSizePixel = 0
    sidebarFix2.ZIndex = 0
    sidebarFix2.Parent = sidebar
    
    -- Create content area
    local contentArea = Instance.new("Frame")
    contentArea.Name = "ContentArea"
    contentArea.Size = UDim2.new(1, -130, 1, -50)
    contentArea.Position = UDim2.new(0, 125, 0, 45)
    contentArea.BackgroundTransparency = 1
    contentArea.Parent = self.Frame
    
    -- Create tabs in sidebar
    local tabButtons = {}
    local tabs = {}
    local tabNames = {"Main", "Auto Farm", "Teleport", "Settings"}
    
    for i, tabName in ipairs(tabNames) do
        -- Create tab button
        local tabBtn = Instance.new("TextButton")
        tabBtn.Name = tabName .. "Tab"
        tabBtn.Size = UDim2.new(1, -20, 0, 30)
        tabBtn.Position = UDim2.new(0, 10, 0, 10 + (i-1) * 40)
        tabBtn.BackgroundColor3 = COLORS.button
        tabBtn.Text = tabName
        tabBtn.TextColor3 = COLORS.text
        tabBtn.TextSize = 14
        tabBtn.Font = Enum.Font.Gotham
        tabBtn.Parent = sidebar
        
        local tabBtnCorner = Instance.new("UICorner")
        tabBtnCorner.CornerRadius = UDim.new(0, 6)
        tabBtnCorner.Parent = tabBtn
        
        -- Create tab content
        local tabContent = Instance.new("Frame")
        tabContent.Name = tabName .. "Content"
        tabContent.Size = UDim2.new(1, 0, 1, 0)
        tabContent.BackgroundTransparency = 1
        tabContent.Visible = i == 1 -- Only first tab visible by default
        tabContent.Parent = contentArea
        
        -- Add placeholder text
        local placeholderText = Instance.new("TextLabel")
        placeholderText.Name = "PlaceholderText"
        placeholderText.Size = UDim2.new(1, 0, 0, 30)
        placeholderText.Position = UDim2.new(0, 0, 0.5, -15)
        placeholderText.BackgroundTransparency = 1
        placeholderText.Text = tabName .. " tab content will go here"
        placeholderText.TextColor3 = COLORS.subText
        placeholderText.TextSize = 16
        placeholderText.Font = Enum.Font.Gotham
        placeholderText.Parent = tabContent
        
        -- Store references
        tabButtons[tabName] = tabBtn
        tabs[tabName] = tabContent
        
        -- Tab button click handler
        tabBtn.MouseButton1Click:Connect(function()
            -- Hide all tabs
            for _, tab in pairs(tabs) do
                tab.Visible = false
            end
            
            -- Reset all button colors
            for _, btn in pairs(tabButtons) do
                btn.BackgroundColor3 = COLORS.button
            end
            
            -- Show selected tab and highlight button
            tabs[tabName].Visible = true
            tabBtn.BackgroundColor3 = COLORS.accent
        end)
        
        -- Set first tab as active by default
        if i == 1 then
            tabBtn.BackgroundColor3 = COLORS.accent
        end
    end
    
    -- Add version text at bottom of sidebar
    local versionText = Instance.new("TextLabel")
    versionText.Name = "VersionText"
    versionText.Size = UDim2.new(1, 0, 0, 20)
    versionText.Position = UDim2.new(0, 0, 1, -25)
    versionText.BackgroundTransparency = 1
    versionText.Text = "v1.0.0"
    versionText.TextColor3 = COLORS.subText
    versionText.TextSize = 12
    versionText.Font = Enum.Font.Gotham
    versionText.Parent = sidebar
    
    -- Make the GUI draggable
    self:MakeDraggable(header)
    
    -- Add fade-in animation
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
            self.Frame.BackgroundTransparency = i
            shadow.ImageTransparency = 0.5 + i * 0.5
            
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

function MainGUI:MakeDraggable(dragObject)
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

function MainGUI:Hide()
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

return MainGUI
