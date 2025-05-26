--[[
    Solvix Hub - Features
    Contains all the functionality for Solvix Hub
]]

local SolvixFeatures = {}

-- Setup tabs with features
function SolvixFeatures:SetupTabs(tabs, ui)
    -- Check if tabs exist before setting them up
    if tabs["News"] then self:SetupNewsTab(tabs["News"], ui) end
    if tabs["Update Log"] then self:SetupUpdateLogTab(tabs["Update Log"], ui) end
    if tabs["Main"] then self:SetupMainTab(tabs["Main"], ui) end
    if tabs["Auto Collect Fruits"] then self:SetupAutoCollectTab(tabs["Auto Collect Fruits"], ui) end
    if tabs["Auto Plant Fruits"] then self:SetupAutoPlantTab(tabs["Auto Plant Fruits"], ui) end
    if tabs["Auto Sell Fruits"] then self:SetupAutoSellTab(tabs["Auto Sell Fruits"], ui) end
    if tabs["Auto Buy Seeds"] then self:SetupAutoBuyTab(tabs["Auto Buy Seeds"], ui) end
end

-- Setup News tab
function SolvixFeatures:SetupNewsTab(tab, ui)
    -- Add a title
    local title = Instance.new("TextLabel")
    title.Name = "NewsTitle"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "News & Announcements"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Add news content
    local newsFrame = Instance.new("Frame")
    newsFrame.Name = "NewsContent"
    newsFrame.Size = UDim2.new(1, -40, 1, -80)
    newsFrame.Position = UDim2.new(0, 20, 0, 70)
    newsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    newsFrame.BorderSizePixel = 0
    newsFrame.Parent = tab
    
    local newsCorner = Instance.new("UICorner")
    newsCorner.CornerRadius = UDim.new(0, 8)
    newsCorner.Parent = newsFrame
    
    local newsText = Instance.new("TextLabel")
    newsText.Name = "NewsText"
    newsText.Size = UDim2.new(1, -20, 1, -20)
    newsText.Position = UDim2.new(0, 10, 0, 10)
    newsText.BackgroundTransparency = 1
    newsText.Text = "Welcome to Solvix Hub v1.0.0!\n\nRecent Updates:\n• Added Auto Plant feature\n• Added Auto Collect feature\n• Fixed various bugs\n• Improved performance\n\nComing Soon:\n• More automation features\n• Custom themes\n• Teleport options"
    newsText.TextColor3 = Color3.fromRGB(200, 200, 200)
    newsText.TextSize = 16
    newsText.Font = Enum.Font.Gotham
    newsText.TextXAlignment = Enum.TextXAlignment.Left
    newsText.TextYAlignment = Enum.TextYAlignment.Top
    newsText.TextWrapped = true
    newsText.Parent = newsFrame
end

-- Setup Update Log tab
function SolvixFeatures:SetupUpdateLogTab(tab, ui)
    -- Add a title
    local title = Instance.new("TextLabel")
    title.Name = "UpdateLogTitle"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Update Log"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Add update log content
    local logFrame = Instance.new("Frame")
    logFrame.Name = "LogContent"
    logFrame.Size = UDim2.new(1, -40, 1, -80)
    logFrame.Position = UDim2.new(0, 20, 0, 70)
    logFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    logFrame.BorderSizePixel = 0
    logFrame.Parent = tab
    
    local logCorner = Instance.new("UICorner")
    logCorner.CornerRadius = UDim.new(0, 8)
    logCorner.Parent = logFrame
    
    local logText = Instance.new("TextLabel")
    logText.Name = "LogText"
    logText.Size = UDim2.new(1, -20, 1, -20)
    logText.Position = UDim2.new(0, 10, 0, 10)
    logText.BackgroundTransparency = 1
    logText.Text = "v1.0.0 (Current)\n• Initial release\n• Added Auto Plant feature\n• Added Auto Collect feature\n• Added Auto Sell feature\n• Added Auto Buy Seeds feature\n\nv0.9.0 (Beta)\n• Testing phase\n• Fixed UI bugs\n• Improved performance\n\nv0.8.0 (Alpha)\n• Internal testing\n• Basic functionality"
    logText.TextColor3 = Color3.fromRGB(200, 200, 200)
    logText.TextSize = 16
    logText.Font = Enum.Font.Gotham
    logText.TextXAlignment = Enum.TextXAlignment.Left
    logText.TextYAlignment = Enum.TextYAlignment.Top
    logText.TextWrapped = true
    logText.Parent = logFrame
end

-- Setup Main tab
function SolvixFeatures:SetupMainTab(tab, ui)
    -- Add a title
    local title = Instance.new("TextLabel")
    title.Name = "MainTitle"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Main Dashboard"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Add main dashboard content
    local statsFrame = Instance.new("Frame")
    statsFrame.Name = "StatsFrame"
    statsFrame.Size = UDim2.new(1, -40, 0, 100)
    statsFrame.Position = UDim2.new(0, 20, 0, 70)
    statsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    statsFrame.BorderSizePixel = 0
    statsFrame.Parent = tab
    
    local statsCorner = Instance.new("UICorner")
    statsCorner.CornerRadius = UDim.new(0, 8)
    statsCorner.Parent = statsFrame
    
    -- Stats title
    local statsTitle = Instance.new("TextLabel")
    statsTitle.Name = "StatsTitle"
    statsTitle.Size = UDim2.new(1, -20, 0, 30)
    statsTitle.Position = UDim2.new(0, 10, 0, 10)
    statsTitle.BackgroundTransparency = 1
    statsTitle.Text = "Your Stats"
    statsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    statsTitle.TextSize = 18
    statsTitle.Font = Enum.Font.GothamBold
    statsTitle.TextXAlignment = Enum.TextXAlignment.Left
    statsTitle.Parent = statsFrame
    
    -- Stats content
    local statsContent = Instance.new("TextLabel")
    statsContent.Name = "StatsContent"
    statsContent.Size = UDim2.new(1, -20, 0, 50)
    statsContent.Position = UDim2.new(0, 10, 0, 40)
    statsContent.BackgroundTransparency = 1
    statsContent.Text = "Fruits Collected: 0\nSeeds Planted: 0\nFruits Sold: 0\nTotal Earnings: 0"
    statsContent.TextColor3 = Color3.fromRGB(200, 200, 200)
    statsContent.TextSize = 14
    statsContent.Font = Enum.Font.Gotham
    statsContent.TextXAlignment = Enum.TextXAlignment.Left
    statsContent.Parent = statsFrame
    
    -- Quick actions
    local actionsFrame = Instance.new("Frame")
    actionsFrame.Name = "ActionsFrame"
    actionsFrame.Size = UDim2.new(1, -40, 0, 150)
    actionsFrame.Position = UDim2.new(0, 20, 0, 190)
    actionsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    actionsFrame.BorderSizePixel = 0
    actionsFrame.Parent = tab
    
    local actionsCorner = Instance.new("UICorner")
    actionsCorner.CornerRadius = UDim.new(0, 8)
    actionsCorner.Parent = actionsFrame
    
    -- Actions title
    local actionsTitle = Instance.new("TextLabel")
    actionsTitle.Name = "ActionsTitle"
    actionsTitle.Size = UDim2.new(1, -20, 0, 30)
    actionsTitle.Position = UDim2.new(0, 10, 0, 10)
    actionsTitle.BackgroundTransparency = 1
    actionsTitle.Text = "Quick Actions"
    actionsTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    actionsTitle.TextSize = 18
    actionsTitle.Font = Enum.Font.GothamBold
    actionsTitle.TextXAlignment = Enum.TextXAlignment.Left
    actionsTitle.Parent = actionsFrame
    
    -- Create quick action buttons
    local buttonTexts = {"Collect All Fruits", "Plant All Seeds", "Sell All Fruits"}
    
    for i, text in ipairs(buttonTexts) do
        local button = Instance.new("TextButton")
        button.Name = text:gsub(" ", "") .. "Button"
        button.Size = UDim2.new(0, 150, 0, 30)
        button.Position = UDim2.new(0, 10, 0, 40 + (i-1) * 35)
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        button.Text = text
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.TextSize = 14
        button.Font = Enum.Font.Gotham
        button.Parent = actionsFrame
        
        local buttonCorner = Instance.new("UICorner")
        buttonCorner.CornerRadius = UDim.new(0, 6)
        buttonCorner.Parent = button
    end
end

-- Setup Auto Collect tab
function SolvixFeatures:SetupAutoCollectTab(tab, ui)
    -- Add a title
    local title = Instance.new("TextLabel")
    title.Name = "AutoCollectTitle"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Auto Collect Fruits"
    title.TextColor3 = Color3.fromRGB(255, 150, 0) -- Orange color
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Create fruit selection section
    local selectionSection = Instance.new("Frame")
    selectionSection.Name = "SelectionSection"
    selectionSection.Size = UDim2.new(1, -40, 0, 120)
    selectionSection.Position = UDim2.new(0, 20, 0, 70)
    selectionSection.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    selectionSection.BorderSizePixel = 0
    selectionSection.Parent = tab
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = selectionSection
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 10)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = "Select Fruits To Collect"
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.TextSize = 18
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = selectionSection
    
    -- Create action buttons
    local autoCollectSelectedBtn = ui:CreateToggleButton("Auto Collect Selected Fruits", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 210), tab)
    local autoCollectAllBtn = ui:CreateToggleButton("Auto Collect All Fruits", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 280), tab)
end

-- Setup Auto Plant tab (handled by UI module)
function SolvixFeatures:SetupAutoPlantTab(tab, ui)
    -- This tab is already set up in the UI module
end

-- Setup Auto Sell tab
function SolvixFeatures:SetupAutoSellTab(tab, ui)
    -- Add a title
    local title = Instance.new("TextLabel")
    title.Name = "AutoSellTitle"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Auto Sell Fruits"
    title.TextColor3 = Color3.fromRGB(255, 215, 0) -- Gold color
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Create fruit selection section
    local selectionSection = Instance.new("Frame")
    selectionSection.Name = "SelectionSection"
    selectionSection.Size = UDim2.new(1, -40, 0, 120)
    selectionSection.Position = UDim2.new(0, 20, 0, 70)
    selectionSection.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    selectionSection.BorderSizePixel = 0
    selectionSection.Parent = tab
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = selectionSection
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 10)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = "Select Fruits To Sell"
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.TextSize = 18
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = selectionSection
    
    -- Create action buttons
    local autoSellSelectedBtn = ui:CreateToggleButton("Auto Sell Selected Fruits", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 210), tab)
    local autoSellAllBtn = ui:CreateToggleButton("Auto Sell All Fruits", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 280), tab)
end

-- Setup Auto Buy Seeds tab
function SolvixFeatures:SetupAutoBuyTab(tab, ui)
    -- Add a title
    local title = Instance.new("TextLabel")
    title.Name = "AutoBuyTitle"
    title.Size = UDim2.new(1, -40, 0, 40)
    title.Position = UDim2.new(0, 20, 0, 20)
    title.BackgroundTransparency = 1
    title.Text = "Auto Buy Seeds"
    title.TextColor3 = Color3.fromRGB(100, 200, 255) -- Light blue color
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = tab
    
    -- Create seed selection section
    local selectionSection = Instance.new("Frame")
    selectionSection.Name = "SelectionSection"
    selectionSection.Size = UDim2.new(1, -40, 0, 120)
    selectionSection.Position = UDim2.new(0, 20, 0, 70)
    selectionSection.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    selectionSection.BorderSizePixel = 0
    selectionSection.Parent = tab
    
    local sectionCorner = Instance.new("UICorner")
    sectionCorner.CornerRadius = UDim.new(0, 8)
    sectionCorner.Parent = selectionSection
    
    -- Section title
    local sectionTitle = Instance.new("TextLabel")
    sectionTitle.Name = "SectionTitle"
    sectionTitle.Size = UDim2.new(1, -20, 0, 30)
    sectionTitle.Position = UDim2.new(0, 10, 0, 10)
    sectionTitle.BackgroundTransparency = 1
    sectionTitle.Text = "Select Seeds To Buy"
    sectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    sectionTitle.TextSize = 18
    sectionTitle.Font = Enum.Font.GothamBold
    sectionTitle.TextXAlignment = Enum.TextXAlignment.Left
    sectionTitle.Parent = selectionSection
    
    -- Create action buttons
    local autoBuySelectedBtn = ui:CreateToggleButton("Auto Buy Selected Seeds", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 210), tab)
    local autoBuyAllBtn = ui:CreateToggleButton("Auto Buy All Seeds", UDim2.new(1, -40, 0, 50), UDim2.new(0, 20, 0, 280), tab)
end

return SolvixFeatures
