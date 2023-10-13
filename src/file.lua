local Void         = {}

local TweenService = game:GetService("TweenService")
local HttpService  = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()

local name         = "Void"


-- local function Create(Name, vParent, Properties)
-- 	local Object   = Instance.new(Name)
-- 	for i, v in next, Properties or {} do
-- 		Object[i]  = v
-- 	end
-- 	v.Parent       = vParent
-- 	return Object
-- end


local isMainFrameDraggable = true

local CoreGui = game:GetService("CoreGui")

local Settings = {
    Theme = {
        TopBar = Color3.fromRGB(30,30,30),
        MainFrame = Color3.fromRGB(30,30,30),
        Line = Color3.fromRGB(57,57,57),
        MainFrameLine = Color3.fromRGB(60,60,60),
        TextColor = Color3.fromRGB(255,255,255),
        TextColor2 = Color3.fromRGB(220,220,220),
        CrossIcon = Color3.fromRGB(188,0,0),
        LeftScrollingFrame = Color3.fromRGB(35,35,35),
        PushButton = Color3.fromRGB(50,50,50),
        TabButton = Color3.fromRGB(100,100,100),
        TabSelectColor = Color3.fromRGB(255,255,255),
        MainButtonColor = Color3.fromRGB(35,35,35),
        HoveredButtonColor = Color3.fromRGB(45,45,45),
        ButtonStroke = Color3.fromRGB(70,70,70),
        HoveredButtonStroke = Color3.fromRGB(90,90,90),
        ToggleLever = Color3.fromRGB(30,30,30),
        ToggleLeverOn = Color3.fromRGB(80,80,80)
    },
    Icons = {
         Close = "rbxassetid://9886659671", 
         Minimize = "rbxassetid://9886659276", 
         Maximize = "rbxassetid://9886659406", 
         Restore = "rbxassetid://9886659001"
    }
}

local function MakeDraggable(frame)
    local frame = frame
	local dragToggle = nil
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
	 local delta = input.Position - dragStart
	 local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
	  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
 	frame.Position = position
	end

	frame.InputBegan:Connect(function(input)
	 if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and isMainFrameDraggable then 
	  dragToggle = true
	  dragStart = input.Position
	  startPos = frame.Position
	  input.Changed:Connect(function()
	   if input.UserInputState == Enum.UserInputState.End then
 	   dragToggle = false
	   end
	  end)
	 end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
	 if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
	  if dragToggle then
	   updateInput(input)
	  end
	 end
	end)
end

local Icons = loadstring(game:HttpGet("https://gitlab.com/koterahq/luciderblx/plugin/-/raw/main/src/modules/Assets.lua?ref_type=heads"))().assets

function Void:GetIcon(Name) 
    if Name ~= nil and Icons["lucide-" .. Name] then 
            return Icons["lucide-" .. Name] 
    end 
    return nil 
end

function Void:CreateWindow(WindowProperties)
    local Cornerradius = 10
    local TopBarSize = 40
    
    WindowProperties.Name  = WindowProperties.Name or "UI Library"

    local x = 550
    local y = 350
    
    
    local ScreenGui = Instance.new("ScreenGui", CoreGui)
        ScreenGui["Name"] = name .. "UI Lib"
    
    
        
    local MainFrame = Instance.new("Frame", ScreenGui)
        MainFrame["Size"] = UDim2.new(0, 0, 0, 0)
        MainFrame["BackgroundColor3"] = Settings.Theme.MainFrame
        MainFrame["BorderSizePixel"] = 0
        MainFrame["ClipsDescendants"] = true
        MainFrame["ZIndex"] = 4
        MainFrame["Active"] = true
        MainFrame["AnchorPoint"] = Vector2.new(0.5, 0.5)
        MainFrame["Position"] = UDim2.new(0.5, 0, 0.5, 0)
        
    -- Anim {
        local speed = 0.1
        TweenService:Create(MainFrame, TweenInfo.new(speed), {Size = UDim2.new(0, x, 0, y)}):Play()
    -- }
    
        
    local MainFrame_UICorner = Instance.new("UICorner", MainFrame)
        MainFrame_UICorner["CornerRadius"] = UDim.new(0, Cornerradius)
        
    local MainFrame_UIStroke = Instance.new("UIStroke", MainFrame)
        MainFrame_UIStroke["Thickness"] = 1
        MainFrame_UIStroke["Transparency"] = 0.5
        MainFrame_UIStroke["Color"] = Settings.Theme.MainFrameLine
        
    local TopBarFrame = Instance.new("CanvasGroup", MainFrame)
        TopBarFrame["Size"] = UDim2.new(1, 0, 0, TopBarSize)
        TopBarFrame["BackgroundColor3"] = Settings.Theme.TopBar
        TopBarFrame["BorderSizePixel"] = 0
        TopBarFrame["Active"] = false
        TopBarFrame["ZIndex"] = 5
        
    
    MakeDraggable(MainFrame)
    
    local TopBarFrame_TextLabel = Instance.new("TextLabel", TopBarFrame)
        TopBarFrame_TextLabel["Size"] = UDim2.new(1, -90, 1, 0)
        TopBarFrame_TextLabel["Position"] = UDim2.new(0, 15, 0, 0)
        TopBarFrame_TextLabel["BackgroundTransparency"] = 1
        TopBarFrame_TextLabel["TextColor3"] = Settings.Theme.TextColor
        TopBarFrame_TextLabel["Text"] = WindowProperties.Name
        TopBarFrame_TextLabel["TextSize"] = 12
        TopBarFrame_TextLabel["Font"] = "Gotham"
        TopBarFrame_TextLabel["ZIndex"] = 5
        TopBarFrame_TextLabel["TextXAlignment"] = "Left"
    
    local TopBarFrame_UICorner = Instance.new("UICorner", TopBarFrame)
        TopBarFrame_UICorner["CornerRadius"] = UDim.new(0, Cornerradius)
    
    local TopBarFrame_AntiCorner = Instance.new("Frame", TopBarFrame)
        TopBarFrame_AntiCorner["Size"] = UDim2.new(1, 0, 0, Cornerradius)
        TopBarFrame_AntiCorner["AnchorPoint"] = Vector2.new(0, 1)
        TopBarFrame_AntiCorner["Position"] = UDim2.new(0, 0, 1, 0)
        TopBarFrame_AntiCorner["BorderSizePixel"] = 0
        TopBarFrame_AntiCorner["BackgroundColor3"] = Settings.Theme.TopBar
        TopBarFrame_AntiCorner["ZIndex"] = 5
        
    local TopBarFrame_XLine = Instance.new("Frame", TopBarFrame)
        TopBarFrame_XLine["Size"] = UDim2.new(1, 0, 0, 1)
        TopBarFrame_XLine["BackgroundColor3"] = Settings.Theme.Line
        TopBarFrame_XLine["BackgroundTransparency"] = 0
        TopBarFrame_XLine["BorderSizePixel"] = 0
        TopBarFrame_XLine["Position"] = UDim2.new(0, 0, 1, -1)
        TopBarFrame_XLine["ZIndex"] = 5
    
    local CrossIcon = Instance.new("ImageButton", TopBarFrame)
        CrossIcon["Size"] = UDim2.new(0, TopBarSize, 1, -1)
        CrossIcon["AnchorPoint"] = Vector2.new(1,0)
        CrossIcon["Position"] = UDim2.new(1,0,0,0)
        CrossIcon["BackgroundTransparency"] = 1
        CrossIcon["BackgroundColor3"] = Settings.Theme.CrossIcon
        CrossIcon["ImageColor3"] = Settings.Theme.TextColor
        CrossIcon["Image"] = ""
        CrossIcon["AutoButtonColor"] = false
        CrossIcon["BorderSizePixel"] = 0
        CrossIcon["ZIndex"] = 6
        
        local CrossIcon_Frame = Instance.new("Frame", CrossIcon)
            CrossIcon_Frame["Size"] = UDim2.new(0, Cornerradius, 1, 0)
            CrossIcon_Frame["BackgroundColor3"] = Settings.Theme.CrossIcon
            CrossIcon_Frame["BackgroundTransparency"] = 1
            CrossIcon_Frame["BorderSizePixel"] = 0
            CrossIcon_Frame["ZIndex"] = 6
            
        local CrossIcon_Frame2 = Instance.new("Frame", CrossIcon)
            CrossIcon_Frame2["Size"] = UDim2.new(1, 0, 0, Cornerradius)
            CrossIcon_Frame2["BackgroundColor3"] = Settings.Theme.CrossIcon
            CrossIcon_Frame2["BackgroundTransparency"] = 1
            CrossIcon_Frame2["AnchorPoint"] = Vector2.new(0, 1)
            CrossIcon_Frame2["Position"] = UDim2.new(0, 0, 1, 0)
            CrossIcon_Frame2["BorderSizePixel"] = 0
            CrossIcon_Frame2["ZIndex"] = 6
        
        CrossIcon.MouseEnter:Connect(function()
            CrossIcon["BackgroundTransparency"] = 0
            CrossIcon_Frame["BackgroundTransparency"] = 0
            CrossIcon_Frame2["BackgroundTransparency"] = 0
        end)
        
        CrossIcon.MouseLeave:Connect(function()
            CrossIcon["BackgroundTransparency"] = 1
            CrossIcon_Frame["BackgroundTransparency"] = 1
            CrossIcon_Frame2["BackgroundTransparency"] = 1
        end)
        
        CrossIcon.MouseButton1Click:Connect(function()
            TweenService:Create(MainFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, 0, 0, 0)}):Play()
            wait(0.2)
            ScreenGui:Destroy()
        end)
        
        local CrossIcon2 = Instance.new("ImageLabel", CrossIcon)
            CrossIcon2["Size"] = UDim2.new(0, 15, 0, 15) 
            CrossIcon2["AnchorPoint"] = Vector2.new(0.5,0.5)
            CrossIcon2["Position"] = UDim2.new(0.5,0,0.5,0)
            CrossIcon2["BackgroundTransparency"] = 1
            CrossIcon2["BackgroundColor3"] = Settings.Theme.CrossIcon
            CrossIcon2["ImageColor3"] = Settings.Theme.TextColor
            CrossIcon2["Image"] = Settings.Icons.Close
            CrossIcon2["BorderSizePixel"] = 0
            CrossIcon2["ZIndex"] = 6
        
    local CrossIcon_UICorner = Instance.new("UICorner", CrossIcon)
        CrossIcon_UICorner["CornerRadius"] = UDim.new(0, Cornerradius)
        
    local SquareIcon = Instance.new("ImageButton", TopBarFrame)
        SquareIcon["Size"] = UDim2.new(0, TopBarSize , 1, -1)
        SquareIcon["AnchorPoint"] = Vector2.new(1,0)
        SquareIcon["Position"] = UDim2.new(1,-TopBarSize - 0,0,0)
        SquareIcon["BackgroundTransparency"] = 1
        SquareIcon["BackgroundColor3"] = Settings.Theme.TextColor
        SquareIcon["ImageColor3"] = Settings.Theme.TextColor
        SquareIcon["Image"] = "rbxassetid://"
        SquareIcon["AutoButtonColor"] = false
        SquareIcon["BorderSizePixel"] = 0
        SquareIcon["ZIndex"] = 6
        
        SquareIcon.MouseEnter:Connect(function()
            SquareIcon["BackgroundTransparency"] = 0.8
        end)
        
        SquareIcon.MouseLeave:Connect(function()
            SquareIcon["BackgroundTransparency"] = 1
        end)
        
        
        
        
        local SquareIcon2 = Instance.new("ImageLabel", SquareIcon)
            SquareIcon2["Size"] = UDim2.new(0, 15, 0, 15) 
            SquareIcon2["AnchorPoint"] = Vector2.new(0.5,0.5)
            SquareIcon2["Position"] = UDim2.new(0.5,0,0.5,0)
            SquareIcon2["BackgroundTransparency"] = 1
            SquareIcon2["BackgroundColor3"] = Settings.Theme.CrossIcon
            SquareIcon2["ImageColor3"] = Settings.Theme.TextColor
            SquareIcon2["Image"] = Settings.Icons.Maximize
            SquareIcon2["BorderSizePixel"] = 0
            SquareIcon2["ZIndex"] = 6
            
    local MinusIcon = Instance.new("ImageButton", TopBarFrame)
        MinusIcon["Size"] = UDim2.new(0, TopBarSize, 1, -1)
        MinusIcon["AnchorPoint"] = Vector2.new(1,0)
        MinusIcon["Position"] = UDim2.new(1,-TopBarSize*2 - 0,0,0)
        MinusIcon["BackgroundTransparency"] = 1
        MinusIcon["BackgroundColor3"] = Settings.Theme.TextColor
        MinusIcon["ImageColor3"] = Settings.Theme.TextColor
        MinusIcon["Image"] = "rbxassetid://"
        MinusIcon["AutoButtonColor"] = false
        MinusIcon["BorderSizePixel"] = 0
        MinusIcon["ZIndex"] = 6
        
        MinusIcon.MouseEnter:Connect(function()
            MinusIcon["BackgroundTransparency"] = 0.8
        end)
        
        MinusIcon.MouseLeave:Connect(function()
            MinusIcon["BackgroundTransparency"] = 1
        end)
        
        local toggled2 = false
        
        
        
        local MinusIcon2 = Instance.new("ImageLabel", MinusIcon)
            MinusIcon2["Size"] = UDim2.new(0, 15, 0, 15) 
            MinusIcon2["AnchorPoint"] = Vector2.new(0.5,0.5)
            MinusIcon2["Position"] = UDim2.new(0.5,0,0.5,0)
            MinusIcon2["BackgroundTransparency"] = 1
            MinusIcon2["BackgroundColor3"] = Settings.Theme.CrossIcon
            MinusIcon2["ImageColor3"] = Settings.Theme.TextColor
            MinusIcon2["Image"] = Settings.Icons.Minimize
            MinusIcon2["BorderSizePixel"] = 0
            MinusIcon2["ZIndex"] = 6
            
    local LeftScrollingFrame_SizeX = 150
            
    local LeftScrollingFrame = Instance.new("ScrollingFrame", MainFrame)
        LeftScrollingFrame["Size"] = UDim2.new(0, LeftScrollingFrame_SizeX, 1, -85)
        LeftScrollingFrame["Position"] = UDim2.new(0, 0, 0, TopBarSize)
        LeftScrollingFrame["BackgroundColor3"] = Settings.Theme.LeftScrollingFrame
        LeftScrollingFrame["ZIndex"] = 4
        LeftScrollingFrame["BorderColor3"] = Settings.Theme.Line
        LeftScrollingFrame["ScrollBarThickness"] = 0
        LeftScrollingFrame["ScrollingDirection"] = "Y"
        LeftScrollingFrame["CanvasSize"] = UDim2.new(0,0,0,0)
        
        local LeftScrollingFrame_MinimizeButton_Line = Instance.new("Frame", MainFrame)
            LeftScrollingFrame_MinimizeButton_Line["Size"] = UDim2.new(0, 1, 1, 0)
            LeftScrollingFrame_MinimizeButton_Line["AnchorPoint"] = Vector2.new(0, 1)
            LeftScrollingFrame_MinimizeButton_Line["ZIndex"] = 4
            LeftScrollingFrame_MinimizeButton_Line["Position"] = UDim2.new(0, 150, 1, 0)
            LeftScrollingFrame_MinimizeButton_Line["BackgroundColor3"] = Settings.Theme.Line
            LeftScrollingFrame_MinimizeButton_Line["BorderSizePixel"] = 0
            
            
        local LeftScrollingFrame_MinimizeButton = Instance.new("TextButton", LeftScrollingFrame_MinimizeButton_Line)
            LeftScrollingFrame_MinimizeButton["Size"] = UDim2.new(0, 30, 0, 30)
            LeftScrollingFrame_MinimizeButton["AnchorPoint"] = Vector2.new(1,0)
            LeftScrollingFrame_MinimizeButton["Position"] = UDim2.new(0, -10, 1, -37) 
            LeftScrollingFrame_MinimizeButton["BackgroundColor3"] = Settings.Theme.PushButton
            LeftScrollingFrame_MinimizeButton["Text"] = ""
            LeftScrollingFrame_MinimizeButton["ZIndex"] = 4
            LeftScrollingFrame_MinimizeButton["AutoButtonColor"] = false
            
            local LeftScrollingFrame_MinimizeButton_UICorner = Instance.new("UICorner", LeftScrollingFrame_MinimizeButton)
                LeftScrollingFrame_MinimizeButton_UICorner["CornerRadius"] = UDim.new(1,0)
            
            local LeftScrollingFrame_MinimizeButton_Icon = Instance.new("ImageLabel", LeftScrollingFrame_MinimizeButton)
                LeftScrollingFrame_MinimizeButton_Icon["Size"] = UDim2.new(0, 20 - 2, 0, 20 - 2)
                LeftScrollingFrame_MinimizeButton_Icon["Position"] = UDim2.new(0.5, 0, 0.5, 0)
                LeftScrollingFrame_MinimizeButton_Icon["AnchorPoint"] = Vector2.new(0.5,0.5)
                LeftScrollingFrame_MinimizeButton_Icon["BackgroundTransparency"] = 1
                LeftScrollingFrame_MinimizeButton_Icon["Image"] = "rbxassetid://10709768114"
                LeftScrollingFrame_MinimizeButton_Icon["ZIndex"] = 4
                
            
        MinusIcon.MouseButton1Click:Connect(function()
            if toggled2 == false then
                TweenService:Create(MainFrame, TweenInfo.new(0.7), {Size = UDim2.new(0, x, 0, TopBarSize)}):Play()
                TweenService:Create(LeftScrollingFrame, TweenInfo.new(1.3), {Size = UDim2.new(0, LeftScrollingFrame_SizeX, 1, 0)}):Play()
                TweenService:Create(LeftScrollingFrame_MinimizeButton, TweenInfo.new(0.4), {Position = UDim2.new(0, -10, 1, 0)}):Play()
                TweenService:Create(MainFrame_UICorner, TweenInfo.new(0.7), {CornerRadius = UDim.new(0,Cornerradius)}):Play()
                TweenService:Create(CrossIcon_UICorner, TweenInfo.new(0.7), {CornerRadius = UDim.new(0,Cornerradius)}):Play()
                TopBarFrame_AntiCorner["Visible"] = false
                TopBarFrame_XLine["Visible"] = false
                toggled2 = true
                isMainFrameDraggable = true
                CrossIcon_Frame2["Visible"] = false
            else
                TweenService:Create(MainFrame, TweenInfo.new(0.7), {Size = UDim2.new(0, x, 0, y)}):Play()
                TweenService:Create(LeftScrollingFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, LeftScrollingFrame_SizeX, 1, -85)}):Play()
                TweenService:Create(LeftScrollingFrame_MinimizeButton, TweenInfo.new(0.4), {Position = UDim2.new(0, -10, 1, -37)}):Play()
                toggled2 = false
                TopBarFrame_AntiCorner["Visible"] = true
                TopBarFrame_XLine["Visible"] = true
                CrossIcon_Frame2["Visible"] = true
            end
        end)
        
    
    
    local RightScrollingFrame_SizeX = -160
        
    
        
    local LeftScrollingFrame_Folder = Instance.new("Folder", LeftScrollingFrame)
        
    local LeftScrollingFrame_UIListLayout = Instance.new("UIListLayout", LeftScrollingFrame_Folder)
        LeftScrollingFrame_UIListLayout["Padding"] = UDim.new(0, 5)
        LeftScrollingFrame_UIListLayout["SortOrder"] = "LayoutOrder"
        LeftScrollingFrame_UIListLayout["HorizontalAlignment"] = "Center"
        
    local LeftScrollingFrame_PaddingFrame = Instance.new("Frame", LeftScrollingFrame_Folder)
        LeftScrollingFrame_PaddingFrame["Size"] = UDim2.new(1, -10, 0, 10)
        LeftScrollingFrame_PaddingFrame["BackgroundTransparency"] = 1
        
    local Tab = {}
    
    local first = true
    
    local RightScrollingFrame_Folder = Instance.new("Folder", MainFrame)
        
    function Tab:CreateTab(TabProperties)
        TabProperties.Title = TabProperties.Title or "Tab"
        TabProperties.Icon = TabProperties.Icon or ""
        
        icon = Void:GetIcon(TabProperties.Icon) or ""
            
        local TabFrame = Instance.new("TextButton", LeftScrollingFrame_Folder)
            TabFrame["Size"] = UDim2.new(1, -15, 0, 30)
            TabFrame["BackgroundColor3"] = Settings.Theme.TabButton
            TabFrame["BackgroundTransparency"] = 1
            TabFrame["ZIndex"] = 4
            TabFrame["BorderSizePixel"] = 0
            TabFrame["Text"] = ""
            TabFrame["AutoButtonColor"] = false
            
            local RightScrollingFrame = Instance.new("ScrollingFrame", RightScrollingFrame_Folder)
                RightScrollingFrame["Size"] = UDim2.new(1, -160, 1, -50)
                RightScrollingFrame["AnchorPoint"] = Vector2.new(1, 0)
                RightScrollingFrame["Position"] = UDim2.new(1, 5, 0, TopBarSize + 5)
                RightScrollingFrame["ZIndex"] = 4
                RightScrollingFrame["BackgroundTransparency"] = 1
                RightScrollingFrame["ScrollingDirection"] = "Y"
                RightScrollingFrame["ScrollBarThickness"] = 0
                RightScrollingFrame["CanvasSize"] = UDim2.new(0,0,0,0)
                
                local RightScrollingFrame_ContentFolder = Instance.new("Folder", RightScrollingFrame)
            
            local TabFrame_UICorner = Instance.new("UICorner", TabFrame)
                TabFrame_UICorner["CornerRadius"] = UDim.new(0, 5)
                
            local TabFrame_CornerFrame = Instance.new("Frame", TabFrame)
                TabFrame_CornerFrame["AnchorPoint"] = Vector2.new(1, 0.5)
                TabFrame_CornerFrame["Size"] = UDim2.new(0, 5, 0, 10)
                TabFrame_CornerFrame["BorderSizePixel"] = 0
                TabFrame_CornerFrame["Position"] = UDim2.new(0, -10, 0.5, 0)
                TabFrame_CornerFrame["BackgroundColor3"] = Settings.Theme.TabSelectColor
                TabFrame_CornerFrame["ZIndex"] = 4
                TabFrame_CornerFrame["Name"] = "CornerFrame"
                
                local TabFrame_CornerFrame_UICorner = Instance.new("UICorner", TabFrame_CornerFrame)
                    TabFrame_CornerFrame_UICorner["CornerRadius"] = UDim.new(1,0)

            
            local TabFrame_Icon = Instance.new("ImageLabel", TabFrame)
                TabFrame_Icon["Size"] = UDim2.new(0, 15, 0, 15)
                TabFrame_Icon["Position"] = UDim2.new(0, 15, 0.5, 0)
                TabFrame_Icon["BackgroundTransparency"] = 1
                TabFrame_Icon["Image"] = icon
                TabFrame_Icon["ZIndex"] = 4
                TabFrame_Icon["AnchorPoint"] = Vector2.new(0.5,0.5)
                
            local TabFrame_Text = Instance.new("TextLabel", TabFrame)
                TabFrame_Text["AnchorPoint"] = Vector2.new(1,0)
                TabFrame_Text["Position"] = UDim2.new(1, -5, 0, 0)
                TabFrame_Text["Size"] = UDim2.new(1, -40, 1, 0)
                TabFrame_Text["Text"] = TabProperties.Title
                TabFrame_Text["TextColor3"] = Settings.Theme.TextColor
                TabFrame_Text["ZIndex"] = 4
                TabFrame_Text["TextXAlignment"] = "Right"
                TabFrame_Text["Font"] = "Gotham"
                TabFrame_Text["BackgroundTransparency"] = 1
                TabFrame_Text["TextWrapped"] = true
                TabFrame_Text["TextSize"] = 11
                
                TabFrame["Size"] = UDim2.new(1, -15, 0, TabFrame_Text.TextBounds.Y + 23)
            
            local toggled4 = false
            
            if first then
                first = false
                RightScrollingFrame.Visible = true
                TabFrame.BackgroundTransparency = 0.79
                TweenService:Create(TabFrame_CornerFrame, TweenInfo.new(0.3), {Position = UDim2.new(0, -4, 0.5, 0)}):Play()
            else
                RightScrollingFrame.Visible = false
                TabFrame.BackgroundTransparency = 1
            end
            
            TabFrame.MouseButton1Click:Connect(function()
	    		for i,v in next, LeftScrollingFrame_Folder:GetChildren() do
                	if v:IsA("TextButton") then
                		TweenService:Create(v, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
                        TweenService:Create(v.CornerFrame, TweenInfo.new(0.3), {Position = UDim2.new(0, -10, 0.5, 0)}):Play()
                	end
                end
                TweenService:Create(TabFrame, TweenInfo.new(0.3), {BackgroundTransparency = 0.79}):Play()
                TweenService:Create(TabFrame_CornerFrame, TweenInfo.new(0.3), {Position = UDim2.new(0, -4, 0.5, 0)}):Play()
    		end)
    
            TabFrame.MouseButton1Click:Connect(function()
		    	for i,v in next, RightScrollingFrame_Folder:GetChildren() do
		    		v.Visible = false
		            v["Position"] = UDim2.new(1, 5, 0, TopBarSize + 5)
	    		end	
	    		RightScrollingFrame.Visible = true
	            TweenService:Create(RightScrollingFrame, TweenInfo.new(0.4), {Position = UDim2.new(1, -5, 0, TopBarSize + 5)}):Play()
            end)
    	
    	    TweenService:Create(RightScrollingFrame, TweenInfo.new(0.4), {Position = UDim2.new(1, -5, 0, TopBarSize + 5)}):Play()
	
	        local toggled3 = false
	
	        LeftScrollingFrame_MinimizeButton.MouseButton1Click:Connect(function()
                if toggled3 == false then
                    LeftScrollingFrame_SizeX = 50
                    RightScrollingFrame_SizeX = -60
                    TweenService:Create(LeftScrollingFrame, TweenInfo.new(0.3), {Position = UDim2.new(0, -150, 0, TopBarSize)}):Play()
                    for i,v in next, RightScrollingFrame_Folder:GetChildren() do
		        		TweenService:Create(v, TweenInfo.new(0.3), {Size = UDim2.new(1, RightScrollingFrame_SizeX, 1, -50)}):Play()
	        		end
                    TweenService:Create(LeftScrollingFrame_MinimizeButton_Line, TweenInfo.new(0.3), {Position = UDim2.new(0, LeftScrollingFrame_SizeX, 1, 0)}):Play()
                    TweenService:Create(LeftScrollingFrame_MinimizeButton_Icon, TweenInfo.new(0.3), {Rotation = 180}):Play()
                
                    toggled3 = true 
                else
                    LeftScrollingFrame_SizeX = 150
                    RightScrollingFrame_SizeX = -160
                    TweenService:Create(LeftScrollingFrame, TweenInfo.new(0.3), {Position = UDim2.new(0, 0, 0, TopBarSize)}):Play()
                    for i,v in next, RightScrollingFrame_Folder:GetChildren() do
		        		TweenService:Create(v, TweenInfo.new(0.3), {Size = UDim2.new(1, RightScrollingFrame_SizeX, 1, -50)}):Play()
	        		end
                    TweenService:Create(LeftScrollingFrame_MinimizeButton_Line, TweenInfo.new(0.3), {Position = UDim2.new(0, LeftScrollingFrame_SizeX, 1, 0)}):Play()
                    TweenService:Create(LeftScrollingFrame_MinimizeButton_Icon, TweenInfo.new(0.3), {Rotation = 0}):Play()
                    
                    toggled3 = false
                end
            end)
            
            local toggled = false
            
            SquareIcon.MouseButton1Click:Connect(function()
                if toggled == false then
                    TweenService:Create(MainFrame, TweenInfo.new(0.8), {Size = UDim2.new(1,0,1,0), Position = UDim2.new(0.5,0,0.5,0)}):Play()
                    TweenService:Create(MainFrame_UICorner, TweenInfo.new(0.7), {CornerRadius = UDim.new(0,0)}):Play()
                    TweenService:Create(CrossIcon_UICorner, TweenInfo.new(0.7), {CornerRadius = UDim.new(0,0)}):Play()
                    TweenService:Create(LeftScrollingFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 150, 1, -85)}):Play()
                    TweenService:Create(LeftScrollingFrame_MinimizeButton, TweenInfo.new(0.4), {Position = UDim2.new(0, -10, 1, -37)}):Play()
                    toggled2 = false
                    TopBarFrame_AntiCorner["Visible"] = true
                    TopBarFrame_XLine["Visible"] = true
                    toggled = true
                    isMainFrameDraggable = false
                    SquareIcon2["Image"] = Settings.Icons.Restore
                else
                    TweenService:Create(MainFrame, TweenInfo.new(0.8), {Size = UDim2.new(0, x, 0, y), Position = UDim2.new(0.5,0,0.5,0)}):Play()
                    TweenService:Create(MainFrame_UICorner, TweenInfo.new(0.7), {CornerRadius = UDim.new(0,Cornerradius)}):Play()
                    TweenService:Create(CrossIcon_UICorner, TweenInfo.new(0.7), {CornerRadius = UDim.new(0,Cornerradius)}):Play()
                    TweenService:Create(LeftScrollingFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 150, 1, -85)}):Play()
                    TweenService:Create(LeftScrollingFrame_MinimizeButton, TweenInfo.new(0.4), {Position = UDim2.new(0, -10, 1, -37)}):Play()
                    toggled2 = false
                    TopBarFrame_AntiCorner["Visible"] = true
                    TopBarFrame_XLine["Visible"] = true
                    toggled = false
                    isMainFrameDraggable = true
                    SquareIcon2["Image"] = Settings.Icons.Maximize
                end
            end)
            
            LeftScrollingFrame["CanvasSize"] = UDim2.new(0,0,0, LeftScrollingFrame["Folder"]["UIListLayout"]["AbsoluteContentSize"]["Y"] + 5)
            
        local RightScrollingFrame_UIListLayout = Instance.new("UIListLayout", RightScrollingFrame_ContentFolder)
            RightScrollingFrame_UIListLayout["Padding"] = UDim.new(0, 5)
            RightScrollingFrame_UIListLayout["SortOrder"] = "LayoutOrder"
            RightScrollingFrame_UIListLayout["HorizontalAlignment"] = "Center"
            
            
        RightScrollingFrame_UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            RightScrollingFrame["CanvasSize"] = UDim2.new(0,0,0, RightScrollingFrame_UIListLayout["AbsoluteContentSize"]["Y"] + 5)
        end)
        
        
            
        local Elements = {}

        function Elements:CreateLabel(LabelProperty)
            LabelProperty.Title = LabelProperty.Title or "Label"
            
            local Label = Instance.new("TextLabel", RightScrollingFrame_ContentFolder)
                Label["Size"] = UDim2.new(1, -20, 0, 30)
                Label["Text"] = LabelProperty.Title
                Label["TextColor3"] = Settings.Theme.TextColor
                Label["BackgroundTransparency"] = 1
                Label["TextXAlignment"] = "Left"
                Label["ZIndex"] = 4
                Label["Font"] = "GothamMedium"
                Label["TextSize"] = 12
                Label["TextWrapped"] = true
        end
        
        function Elements:CreateParagraph(ParagraphProperty)
            ParagraphProperty.Title = ParagraphProperty.Title or "Paragraph"
            ParagraphProperty.Content = ParagraphProperty.Content or "Content \n2 Line!"
            
            local Paragraph = Instance.new("Frame", RightScrollingFrame_ContentFolder)
                Paragraph["BackgroundColor3"] = Settings.Theme.MainButtonColor
                Paragraph["BorderSizePixel"] = 0
                Paragraph["ZIndex"] = 4
                
                local Paragraph_UICorner = Instance.new("UICorner", Paragraph)
                    Paragraph_UICorner["CornerRadius"] = UDim.new(0, 5)
                    
                local Paragraph_UIStroke = Instance.new("UIStroke", Paragraph)
                    Paragraph_UIStroke["Thickness"] = 1
                    Paragraph_UIStroke["Color"] = Settings.Theme.ButtonStroke
                    
                local Paragraph_Title = Instance.new("TextLabel", Paragraph)
                    Paragraph_Title["Size"] = UDim2.new(1, -14, 0, 30)
                    Paragraph_Title["Position"] = UDim2.new(0, 7, 0, 5)
                    Paragraph_Title["Text"] = ParagraphProperty.Title
                    Paragraph_Title["TextColor3"] = Settings.Theme.TextColor
                    Paragraph_Title["Font"] = "Gotham"
                    Paragraph_Title["TextSize"] = 12
                    Paragraph_Title["TextXAlignment"] = "Left"
                    Paragraph_Title["TextYAlignment"] = "Top"
                    Paragraph_Title["BackgroundTransparency"] = 1
                    Paragraph_Title["ZIndex"] = 4
                    Paragraph_Title["Name"] = "Paragraph_Title"
                    
                local Paragraph_Content = Instance.new("TextLabel", Paragraph)
                    Paragraph_Content["Size"] = UDim2.new(1, -12, 0, 0)
                    Paragraph_Content["Position"] = UDim2.new(0, 6, 0, Paragraph_Title["TextBounds"]["Y"] + 10 )
                    Paragraph_Content["TextXAlignment"] = "Left"
                    Paragraph_Content["TextYAlignment"] = "Top"
                    Paragraph_Content["Font"] = "Gotham"
                    Paragraph_Content["Text"] = ParagraphProperty.Content
                    Paragraph_Content["TextColor3"] = Settings.Theme.TextColor2
                    Paragraph_Content["TextWrapped"] = true
                    Paragraph_Content["ZIndex"] = 4
                    Paragraph_Content["BackgroundTransparency"] = 1
                    Paragraph_Content["TextSize"] = 10
                    
            Paragraph_Content:GetPropertyChangedSignal("TextBounds"):Connect(function()
                    
                Paragraph["Size"] = UDim2.new(1, -28, 0, Paragraph_Content.TextBounds.Y + 25)
                Paragraph_Content.Size = UDim2.new(1, -12, 0, Paragraph_Content.TextBounds.Y + 35)
                
            end)
            
            Paragraph_Content["Text"] = ParagraphProperty.Content
                    
        end
        
        
        
        function Elements:CreateButton(ButtonProperties)
            ButtonProperties.Title = ButtonProperties.Title or "Button"
            ButtonProperties.Callback = ButtonProperties.Callback or function() end
            
            local Button_ = Instance.new("TextButton", RightScrollingFrame_ContentFolder)
                Button_["Size"] = UDim2.new(1, -28, 0, 30)
                Button_["BackgroundColor3"] = Settings.Theme.MainButtonColor
                Button_["BorderSizePixel"] = 0
                Button_["ZIndex"] = 4
                Button_["AutoButtonColor"] = false
                Button_["Text"] = ""
                
                local Button_UICorner = Instance.new("UICorner", Button_)
                    Button_UICorner["CornerRadius"] = UDim.new(0,5)
                    
                local Button_UIStroke = Instance.new("UIStroke", Button_)
                    Button_UIStroke["Thickness"] = 1
                    Button_UIStroke["ApplyStrokeMode"] = "Border"
                    Button_UIStroke["Color"] = Settings.Theme.ButtonStroke
                    
                local Button_Title = Instance.new("TextLabel", Button_)
                    Button_Title["Size"] = UDim2.new(1, -14, 1, 0)
                    Button_Title["Position"] = UDim2.new(0, 7, 0, 0)
                    Button_Title["BackgroundTransparency"] = 1
                    Button_Title["TextXAlignment"] = "Left"
                    Button_Title["Font"] = "Gotham"
                    Button_Title["Text"] = ButtonProperties.Title
                    Button_Title["TextColor3"] = Settings.Theme.TextColor
                    Button_Title["TextSize"] = 10
                    Button_Title["TextWrapped"] = false
                    Button_Title["ZIndex"] = 4
                    
                local Button_Icon = Instance.new("ImageLabel", Button_)
                    Button_Icon["Image"] = "rbxassetid://10734898592"
                    Button_Icon["Size"] = UDim2.new(0, 18, 0, 18)
                    Button_Icon["AnchorPoint"] = Vector2.new(1, 0.5)
                    Button_Icon["Position"] = UDim2.new(1, -5, 0.5, 0)
                    Button_Icon["BackgroundTransparency"] = 1
                    Button_Icon["ZIndex"] = 4
                    
                    
                Button_.MouseEnter:Connect(function()
                    TweenService:Create(Button_, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.HoveredButtonColor}):Play()
                    TweenService:Create(Button_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.HoveredButtonStroke}):Play()
                end)
                
                Button_.MouseLeave:Connect(function()
                    TweenService:Create(Button_, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.MainButtonColor}):Play()
                    TweenService:Create(Button_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.ButtonStroke}):Play()
                end)
                
                Button_.MouseButton1Click:Connect(function()
                    ButtonProperties.Callback()
                end)
                
                
                
        end

        function Elements:CreateToggle(ToggleProperties)
            ToggleProperties.Title = ToggleProperties.Title or "Toggle"
            -- ToggleProperties.Status = ToggleProperties.Status or "off"
            ToggleProperties.Callback = ToggleProperties.Callback or function() end
            
            local Toggle_ = Instance.new("TextButton", RightScrollingFrame_ContentFolder)
                Toggle_["Size"] = UDim2.new(1, -28, 0, 30)
                Toggle_["BackgroundColor3"] = Settings.Theme.MainButtonColor
                Toggle_["BorderSizePixel"] = 0
                Toggle_["ZIndex"] = 4
                Toggle_["AutoButtonColor"] = false
                Toggle_["Text"] = ""
                
                local Toggle_UICorner = Instance.new("UICorner", Toggle_)
                    Toggle_UICorner["CornerRadius"] = UDim.new(0,5)
                    
                local Toggle_UIStroke = Instance.new("UIStroke", Toggle_)
                    Toggle_UIStroke["Thickness"] = 1
                    Toggle_UIStroke["ApplyStrokeMode"] = "Border"
                    Toggle_UIStroke["Color"] = Settings.Theme.ButtonStroke
                    
                local Toggle_Title = Instance.new("TextLabel", Toggle_)
                    Toggle_Title["Size"] = UDim2.new(1, -14, 1, 0)
                    Toggle_Title["Position"] = UDim2.new(0, 7, 0, 0)
                    Toggle_Title["BackgroundTransparency"] = 1
                    Toggle_Title["TextXAlignment"] = "Left"
                    Toggle_Title["Font"] = "Gotham"
                    Toggle_Title["Text"] = ToggleProperties.Title
                    Toggle_Title["TextColor3"] = Settings.Theme.TextColor
                    Toggle_Title["TextSize"] = 10
                    Toggle_Title["TextWrapped"] = false
                    Toggle_Title["ZIndex"] = 4
                    
                local Toggle_Lever = Instance.new("Frame", Toggle_)
                    Toggle_Lever["Size"] = UDim2.new(0, 40, 0, 20)
                    Toggle_Lever["AnchorPoint"] = Vector2.new(1, 0.5)
                    Toggle_Lever["Position"] = UDim2.new(1, -5, 0.5, 0)
                    Toggle_Lever["BackgroundColor3"] = Settings.Theme.ToggleLever
                    Toggle_Lever["BorderSizePixel"] = 0
                    Toggle_Lever["ZIndex"] = 4
                    
                    local Toggle_Lever_UICorner = Instance.new("UICorner", Toggle_Lever)
                        Toggle_Lever_UICorner["CornerRadius"] = UDim.new(1,0)
                    
                    local Toggle_Lever_UIStroke = Instance.new("UIStroke", Toggle_Lever)
                        Toggle_Lever_UIStroke["Thickness"] = 1
                        Toggle_Lever_UIStroke["Color"] = Settings.Theme.ButtonStroke
                        
                    local Toggle_Lever_Circle = Instance.new("Frame", Toggle_Lever)
                        Toggle_Lever_Circle["Size"] = UDim2.new(0, 16, 0, 16)
                        Toggle_Lever_Circle["Position"] = UDim2.new(0, 2, 0, 2)
                        Toggle_Lever_Circle["BackgroundColor3"] = Settings.Theme.ButtonStroke
                        Toggle_Lever_Circle["ZIndex"] = 4
                        
                        local Toggle_Lever_Circle_UICorner = Instance.new("UICorner", Toggle_Lever_Circle)
                            Toggle_Lever_Circle_UICorner["CornerRadius"] = UDim.new(1,0)
                            
                Toggle_.MouseEnter:Connect(function()
                    TweenService:Create(Toggle_, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.HoveredButtonColor}):Play()
                    TweenService:Create(Toggle_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.HoveredButtonStroke}):Play()
                end)
                
                Toggle_.MouseLeave:Connect(function()
                    TweenService:Create(Toggle_, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.MainButtonColor}):Play()
                    TweenService:Create(Toggle_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.ButtonStroke}):Play()
                end)
                
                local Toggle_Toggled = false
                
                Toggle_.MouseButton1Click:Connect(function()
                    if Toggle_Toggled == false then
                        TweenService:Create(Toggle_Lever, TweenInfo.new(0.3), {BackgroundColor3 = Settings.Theme.ToggleLeverOn}):Play()
                        TweenService:Create(Toggle_Lever_Circle, TweenInfo.new(0.3), {Position = UDim2.new(1, -18, 0, 2), BackgroundColor3 = Settings.Theme.MainButtonColor}):Play()
                        Toggle_Toggled = true
                        pcall(ToggleProperties.Callback, Toggle_Toggled)
                    else 
                        TweenService:Create(Toggle_Lever, TweenInfo.new(0.3), {BackgroundColor3 = Settings.Theme.ToggleLever}):Play()
                        TweenService:Create(Toggle_Lever_Circle, TweenInfo.new(0.3), {Position = UDim2.new(0, 2, 0, 2), BackgroundColor3 = Settings.Theme.ButtonStroke}):Play()
                        Toggle_Toggled = false
                        pcall(ToggleProperties.Callback, Toggle_Toggled)
                    end
                end)
        end
        
        function Elements:CreateSlider(SliderProperties)
            SliderProperties.Title = SliderProperties.Title or "Slider"
            SliderProperties.Min = SliderProperties.Min or 0
            SliderProperties.Max = SliderProperties.Max or 100 
            SliderProperties.Value = SliderProperties.Value or 0 
            SliderProperties.Callback = SliderProperties.Callback or function() end
            
            local Slider_ = Instance.new("TextButton", RightScrollingFrame_ContentFolder)
                Slider_["Size"] = UDim2.new(1, -28, 0, 40)
                Slider_["BackgroundColor3"] = Settings.Theme.MainButtonColor
                Slider_["BorderSizePixel"] = 0
                Slider_["ZIndex"] = 4 
                Slider_["Text"] = ""
                Slider_["AutoButtonColor"] = false
                
                local Slider_UICorner = Instance.new("UICorner", Slider_)
                    Slider_UICorner["CornerRadius"] = UDim.new(0,5)
                
                local Slider_UIStroke = Instance.new("UIStroke", Slider_)
                    Slider_UIStroke["Thickness"] = 1
                    Slider_UIStroke["ApplyStrokeMode"] = "Border"
                    Slider_UIStroke["Color"] = Settings.Theme.ButtonStroke
                    
                local Slider_Title = Instance.new("TextLabel", Slider_)
                    Slider_Title["Size"] = UDim2.new(1, -14, 1, -10)
                    Slider_Title["Position"] = UDim2.new(0, 7, 0, 0)
                    Slider_Title["BackgroundTransparency"] = 1
                    Slider_Title["TextXAlignment"] = "Left"
                    Slider_Title["Font"] = "Gotham"
                    Slider_Title["Text"] = SliderProperties.Title
                    Slider_Title["TextColor3"] = Settings.Theme.TextColor
                    Slider_Title["TextSize"] = 10
                    Slider_Title["ZIndex"] = 4
                    
                local Slider_Value = Instance.new("TextLabel", Slider_)
                    Slider_Value["Size"] = UDim2.new(1, -50, 1, -10) 
                    Slider_Value["AnchorPoint"] = Vector2.new(1, 0) 
                    Slider_Value["Position"] = UDim2.new(1, -10, 0, 0)
                    Slider_Value["TextXAlignment"] = "Right"
                    Slider_Value["ZIndex"] = 4
                    Slider_Value["BackgroundTransparency"] = 1
                    Slider_Value["Text"] = SliderProperties.Min
                    Slider_Value["TextColor3"] = Settings.Theme.TextColor
                    
                local Slider_Line = Instance.new("CanvasGroup", Slider_)
                    Slider_Line["Size"] = UDim2.new(0, 352, 0, 4)
                    Slider_Line["Position"] = UDim2.new(1, -357, 0, 30)
                    Slider_Line["BackgroundColor3"] = Settings.Theme.ToggleLever
                    Slider_Line["ZIndex"] = 4 
                    Slider_Line["BorderSizePixel"] = 0
                    
                    local Slider_Line_UICorner = Instance.new("UICorner", Slider_Line)
                        Slider_Line_UICorner["CornerRadius"] = UDim.new(0, 3)
                        
                    local Slider_Line_UIStroke = Instance.new("UIStroke", Slider_Line)
                        Slider_Line_UIStroke["Thickness"] = 1 
                        Slider_Line_UIStroke["Color"] = Settings.Theme.ButtonStroke
                        
                    local Slider_Line_Content = Instance.new("Frame", Slider_Line)
                        Slider_Line_Content["Size"] = UDim2.new(0, 0, 1, 0)
                        Slider_Line_Content["BorderSizePixel"] = 0
                        Slider_Line_Content["ZIndex"] = 4
                        Slider_Line_Content["BackgroundColor3"] = Settings.Theme.ButtonStroke
                        
                Slider_.MouseEnter:Connect(function()
                    TweenService:Create(Slider_, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.HoveredButtonColor}):Play()
                    TweenService:Create(Slider_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.HoveredButtonStroke}):Play()
                    TweenService:Create(Slider_Line_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.HoveredButtonStroke}):Play()
                    TweenService:Create(Slider_Line_Content, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.HoveredButtonStroke}):Play()
                end)
                
                Slider_.MouseLeave:Connect(function()
                    TweenService:Create(Slider_, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.MainButtonColor}):Play()
                    TweenService:Create(Slider_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.ButtonStroke}):Play()
                    TweenService:Create(Slider_Line_UIStroke, TweenInfo.new(0.1), {Color = Settings.Theme.ButtonStroke}):Play()
                    TweenService:Create(Slider_Line_Content, TweenInfo.new(0.1), {BackgroundColor3 = Settings.Theme.ButtonStroke}):Play()
                end)
                
                local focusing = false
                local Value
                
                Slider_.MouseButton1Down:Connect(function()
                    if not focusing then
                    	local minvalue = SliderProperties.Min
        				local maxvalue = SliderProperties.Max
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 352) * Slider_Line_Content.AbsoluteSize.X) + tonumber(minvalue)) or 0
                        pcall(function()
                            SliderProperties.Callback(Value)
                        end)
                        Slider_Line_Content:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slider_Line_Content.AbsolutePosition.X, 0, 352), 0, 4), "InOut", "Linear", 0.05, true)
                        moveconnection = mouse.Move:Connect(function()
                            Slider_Value["Text"] = Value
                            Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 352) * Slider_Line_Content.AbsoluteSize.X) + tonumber(minvalue))
                            pcall(function()
                                SliderProperties.Callback(Value)
                            end)
                            Slider_Line_Content:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slider_Line_Content.AbsolutePosition.X, 0, 352), 0, 4), "InOut", "Linear", 0.05, true)
                        end)
                        releaseconnection = UserInputService.InputEnded:Connect(function(Mouse)
                            if Mouse.UserInputType == Enum.UserInputType.MouseButton1 or Mouse.UserInputType == Enum.UserInputType.Touch then
                                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 352) * Slider_Line_Content.AbsoluteSize.X) + tonumber(minvalue))
                                pcall(function()
                                    SliderProperties.Callback(Value)
                                end)
                                Slider_Value["Text"] = Value
                                Slider_Line_Content:TweenSize(UDim2.new(0, math.clamp(mouse.X - Slider_Line_Content.AbsolutePosition.X, 0, 352), 0, 4), "InOut", "Linear", 0.05, true)
                                moveconnection:Disconnect()
                                releaseconnection:Disconnect()
                            end
                        end)
                    end
                end)
                
        end
        return Elements
    end
    return Tab
end
return Void
