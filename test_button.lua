--[[
    Solvix Hub - Test Button
    Example of a button click handler
]]

-- This function will be connected to a button's MouseButton1Click event
local function onClick()
    print("Test button was clicked!")
    
    -- You can add any functionality here
    -- For example, showing a notification
    local notification = Instance.new("ScreenGui")
    notification.Name = "SolvixNotification"
    notification.ResetOnSpawn = false
    notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Handle protection/hiding from game detection
    if syn then
        syn.protect_gui(notification)
        notification.Parent = game:GetService("CoreGui")
    elseif gethui then
        notification.Parent = gethui()
    else
        notification.Parent = game:GetService("CoreGui")
    end
    
    -- Create notification frame
    local frame = Instance.new("Frame")
    frame.Name = "NotificationFrame"
    frame.Size = UDim2.new(0, 200, 0, 60)
    frame.Position = UDim2.new(1, -220, 0, 20)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = notification
    
    -- Add corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    -- Add title
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Size = UDim2.new(1, 0, 0, 25)
    title.Position = UDim2.new(0, 0, 0, 5)
    title.BackgroundTransparency = 1
    title.Text = "Solvix Hub"
    title.TextColor3 = Color3.fromRGB(0, 255, 0)
    title.TextSize = 16
    title.Font = Enum.Font.GothamBold
    title.Parent = frame
    
    -- Add message
    local message = Instance.new("TextLabel")
    message.Name = "Message"
    message.Size = UDim2.new(1, 0, 0, 20)
    message.Position = UDim2.new(0, 0, 0, 30)
    message.BackgroundTransparency = 1
    message.Text = "Test button clicked!"
    message.TextColor3 = Color3.fromRGB(255, 255, 255)
    message.TextSize = 14
    message.Font = Enum.Font.Gotham
    message.Parent = frame
    
    -- Animate notification
    frame:TweenPosition(
        UDim2.new(1, -220, 0, 20),
        Enum.EasingDirection.Out,
        Enum.EasingStyle.Quad,
        0.5,
        true
    )
    
    -- Remove notification after a delay
    spawn(function()
        wait(3)
        frame:TweenPosition(
            UDim2.new(1, 20, 0, 20),
            Enum.EasingDirection.Out,
            Enum.EasingStyle.Quad,
            0.5,
            true,
            function()
                notification:Destroy()
            end
        )
    end)
    
    -- You can also modify game elements here
    -- For example:
    -- local player = game.Players.LocalPlayer
    -- if player and player.Character then
    --     player.Character.Humanoid.WalkSpeed = 50
    -- end
end

return onClick
