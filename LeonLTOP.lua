local Players = game:GetService("Players") local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer local gui = Instance.new("ScreenGui") gui.Name = "LeonLTOP" gui.ResetOnSpawn = false gui.Parent = player:WaitForChild("PlayerGui")
local main = Instance.new("Frame") main.Size = UDim2.fromOffset(350, 420) main.Position = UDim2.new(.5, -175, .5, -210) main.BackgroundColor3 = Color3.fromRGB(13,13,17) main.BorderSizePixel = 0 main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke", main) stroke.Color = Color3.fromRGB(255,40,50) stroke.Thickness = 1.5
local title = Instance.new("TextLabel") title.Size = UDim2.new(1,-60,0,55) title.Position = UDim2.fromOffset(15,0) title.BackgroundTransparency = 1 title.Text = "LeonLTOP" title.TextColor3 = Color3.fromRGB(255,45,55) title.TextSize = 21 title.Font = Enum.Font.GothamBold title.TextXAlignment = Enum.TextXAlignment.Left title.Parent = main
local close = Instance.new("TextButton") close.Size = UDim2.fromOffset(36,36) close.Position = UDim2.new(1,-46,0,10) close.Text = "×" close.TextSize = 24 close.TextColor3 = Color3.fromRGB(255,70,80) close.BackgroundColor3 = Color3.fromRGB(35,18,22) close.Parent = main Instance.new("UICorner",close).CornerRadius = UDim.new(0,9)
local open = Instance.new("TextButton") open.Size = UDim2.fromOffset(50,50) open.Position = UDim2.fromOffset(15,250) open.Text = "L" open.TextSize = 22 open.Font = Enum.Font.GothamBold open.TextColor3 = Color3.fromRGB(255,45,55) open.BackgroundColor3 = Color3.fromRGB(15,15,20) open.Visible = false open.Parent = gui Instance.new("UICorner",open).CornerRadius = UDim.new(1,0)
close.MouseButton1Click:Connect(function() main.Visible = false open.Visible = true end)
open.MouseButton1Click:Connect(function() main.Visible = true open.Visible = false end)
local tabs = {"ESP","Visuals","Player","Misc","Settings"}
local tabFrame = Instance.new("Frame") tabFrame.Position = UDim2.fromOffset(10,65) tabFrame.Size = UDim2.fromOffset(95,340) tabFrame.BackgroundTransparency = 1 tabFrame.Parent = main
local tabLayout = Instance.new("UIListLayout") tabLayout.Padding = UDim.new(0,6) tabLayout.Parent = tabFrame
local content = Instance.new("ScrollingFrame") content.Position = UDim2.fromOffset(115,65) content.Size = UDim2.new(1,-125,1,-75) content.BackgroundTransparency = 1 content.BorderSizePixel = 0 content.ScrollBarThickness = 3 content.Parent = main
local layout = Instance.new("UIListLayout") layout.Padding = UDim.new(0,6) layout.Parent = content
local functions = { ESP = { "ESP Players","ESP Murderer","ESP Sheriff","ESP Innocents", "Nicknames","Distance","Item Highlight","Weapon Highlight", "Role Colors","ESP Colors" }, Visuals = { "Tracers","Box ESP","Health Bar","Skeleton ESP","Chams", "Highlight","Crosshair","Role Display","ESP Size","Transparency" }, Player = { "WalkSpeed","JumpPower","FOV","Infinite Jump","NoClip", "Fly","Spawn Point","Teleport Player","Player List","Distance" }, Misc = { "FPS Counter","Ping Counter","Server Info","Round Timer", "Auto Rejoin","Server Hop","Anti AFK","Round Notifications", "Map Notifications","Save Settings" }, Settings = { "Keybinds","Theme","Move UI","UI Size","Menu Transparency", "UI Animations","UI Sounds","Reset Settings","Export Config", "Import Config" } }
local function clear() for _,v in ipairs(content:GetChildren()) do if v:IsA("GuiObject") then v:Destroy() end end end
local function toggle(name) local row = Instance.new("Frame") row.Size = UDim2.new(1,-5,0,42) row.BackgroundColor3 = Color3.fromRGB(23,23,29) row.BorderSizePixel = 0 row.Parent = content Instance.new("UICorner",row).CornerRadius = UDim.new(0,9)
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1,-60,1,0)
text.Position = UDim2.fromOffset(10,0)
text.BackgroundTransparency = 1
text.Text = name
text.TextColor3 = Color3.fromRGB(225,225,230)
text.TextSize = 11
text.Font = Enum.Font.Gotham
text.TextXAlignment = Enum.TextXAlignment.Left
text.Parent = row

local b = Instance.new("TextButton")
b.Size = UDim2.fromOffset(40,22)
b.Position = UDim2.new(1,-50,.5,-11)
b.Text = ""
b.BackgroundColor3 = Color3.fromRGB(55,55,62)
b.Parent = row
Instance.new("UICorner",b).CornerRadius = UDim.new(1,0)

local dot = Instance.new("Frame")
dot.Size = UDim2.fromOffset(16,16)
dot.Position = UDim2.fromOffset(3,3)
dot.BackgroundColor3 = Color3.fromRGB(170,170,175)
dot.Parent = b
Instance.new("UICorner",dot).CornerRadius = UDim.new(1,0)

local state = false

b.MouseButton1Click:Connect(function()
	state = not state

	if state then
		b.BackgroundColor3 = Color3.fromRGB(190,25,35)
		dot.Position = UDim2.new(1,-19,.5,-8)
		dot.BackgroundColor3 = Color3.new(1,1,1)
	else
		b.BackgroundColor3 = Color3.fromRGB(55,55,62)
		dot.Position = UDim2.fromOffset(3,3)
		dot.BackgroundColor3 = Color3.fromRGB(170,170,175)
	end
end)
end
local function show(tab) clear()
for _,name in ipairs(functions[tab]) do
	toggle(name)
end

content.CanvasSize = UDim2.fromOffset(
	0,
	layout.AbsoluteContentSize.Y + 10
)
end
for _,tab in ipairs(tabs) do local b = Instance.new("TextButton") b.Size = UDim2.new(1,0,0,40) b.Text = tab b.TextSize = 11 b.Font = Enum.Font.GothamBold b.TextColor3 = Color3.fromRGB(210,210,215) b.BackgroundColor3 = Color3.fromRGB(23,23,29) b.Parent = tabFrame Instance.new("UICorner",b).CornerRadius = UDim.new(0,8)
b.MouseButton1Click:Connect(function()
	show(tab)
end)
end
show("ESP")
-- Перетаскивание меню пальцем
local dragging = false local dragStart local startPos
title.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true dragStart = input.Position startPos = main.Position end end)
UIS.InputChanged:Connect(function(input) if dragging and ( input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement ) then local d = input.Position - dragStart
	main.Position = UDim2.new(
		startPos.X.Scale,
		startPos.X.Offset + d.X,
		startPos.Y.Scale,
		startPos.Y.Offset + d.Y
	)
end
end)
UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
