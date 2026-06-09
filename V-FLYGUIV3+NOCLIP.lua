-- [[ V-FLY GUI V3 + CUSTOM AUDIO & IMAGE ]] --

-- カスタムアセットの設定
local folder_name = "VFlyGuiV3_Assets"
local audio_filename = "own_world.mp3"
local image_filename = "cat_image.jpg"

local audio_url = "https://raw.githubusercontent.com/midorimidoru1-collab/roblox-scripts/main/own_world.mp3"
local image_url = "https://raw.githubusercontent.com/midorimidoru1-collab/roblox-scripts/main/cat_image.jpg"

-- デバイス内に専用フォルダを作成
if not isfolder(folder_name) then
    makefolder(folder_name)
end

local audio_path = folder_name .. "/" .. audio_filename
local image_path = folder_name .. "/" .. image_filename

-- アセットのダウンロード処理
local function downloadAsset(url, path)
    if not isfile(path) then
        local success, result = pcall(function()
            return game:HttpGet(url)
        end)
        if success then
            writefile(path, result)
        else
            warn("Failed to download asset: " .. path .. " | Error: " .. tostring(result))
        end
    end
end

downloadAsset(audio_url, audio_path)
downloadAsset(image_url, image_path)

-- 音声の再生
local sound = Instance.new("Sound")
local success_audio, asset_id_audio = pcall(function()
    return getcustomasset(audio_path)
end)

if success_audio then
    sound.SoundId = asset_id_audio
    sound.Volume = 1
    sound.Parent = game:GetService("CoreGui")
    sound:Play()
end

-- 画像の表示（画面中央上部）
local screen_gui_image = Instance.new("ScreenGui")
screen_gui_image.Name = "VFlyImageGui"
screen_gui_image.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screen_gui_image.ResetOnSpawn = false

local image_label = Instance.new("ImageLabel")
image_label.Name = "TopCenterImage"
image_label.Parent = screen_gui_image
image_label.AnchorPoint = Vector2.new(0.5, 0)
image_label.Position = UDim2.new(0.5, 0, 0.05, 0) -- 画面上部から5%の位置
image_label.Size = UDim2.new(0, 150, 0, 150) -- サイズ調整（150x150）
image_label.BackgroundTransparency = 1
image_label.BorderSizePixel = 0

local success_image, asset_id_image = pcall(function()
    return getcustomasset(image_path)
end)

if success_image then
    image_label.Image = asset_id_image
else
    image_label.Visible = false
end

-- GUI Main Code (V-FLY GUI)
local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local up = Instance.new("TextButton")
local down = Instance.new("TextButton")
local onof = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local plus = Instance.new("TextButton")
local speed = Instance.new("TextLabel")
local mine = Instance.new("TextButton")
local closebutton = Instance.new("TextButton")
local mini = Instance.new("TextButton")
local mini2 = Instance.new("TextButton")
local vnoclipBtn = Instance.new("TextButton")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(163,255,137)
Frame.BorderColor3 = Color3.fromRGB(103,221,213)
Frame.Position = UDim2.new(0.100320168,0,0.379746825,0)
Frame.Size = UDim2.new(0,190,0,57)
Frame.Active = true
Frame.Draggable = true

up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(79,255,152)
up.Size = UDim2.new(0,44,0,28)
up.Text = "UP"

down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(215,255,121)
down.Position = UDim2.new(0,0,0.491228074,0)
down.Size = UDim2.new(0,44,0,28)
down.Text = "DOWN"

onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(255,249,74)
onof.Position = UDim2.new(0.702823281,0,0.491228074,0)
onof.Size = UDim2.new(0,56,0,28)
onof.Text = "V-fly"

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(242,60,255)
TextLabel.Position = UDim2.new(0.469327301,0,0,0)
TextLabel.Size = UDim2.new(0,100,0,28)
TextLabel.Text = "V-FLY GUI V3"
TextLabel.TextScaled = true

plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(133,145,255)
plus.Position = UDim2.new(0.231578946,0,0,0)
plus.Size = UDim2.new(0,45,0,28)
plus.Text = "+"

speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(255,85,0)
speed.Position = UDim2.new(0.468421042,0,0.491228074,0)
speed.Size = UDim2.new(0,44,0,28)
speed.Text = "1"
speed.TextScaled = true

mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(123,255,247)
mine.Position = UDim2.new(0.231578946,0,0.491228074,0)
mine.Size = UDim2.new(0,45,0,29)
mine.Text = "-"

closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(225,25,0)
closebutton.Size = UDim2.new(0,45,0,28)
closebutton.Text = "X"
closebutton.TextSize = 15
closebutton.Position = UDim2.new(0,0,-1,27)

mini.Parent = Frame
mini.BackgroundColor3 = Color3.fromRGB(192,150,230)
mini.Size = UDim2.new(0,45,0,28)
mini.Text = "-"
mini.TextSize = 15
mini.Position = UDim2.new(0,44,-1,27)

mini2.Parent = Frame
mini2.BackgroundColor3 = Color3.fromRGB(192,150,230)
mini2.Size = UDim2.new(0,45,0,28)
mini2.Text = "+"
mini2.TextSize = 15
mini2.Position = UDim2.new(0,44,-1,57)
mini2.Visible = false

vnoclipBtn.Parent = Frame
vnoclipBtn.Size = UDim2.new(0,189,0,28)
vnoclipBtn.Position = UDim2.new(0,0,1,0)
vnoclipBtn.BackgroundColor3 = Color3.fromRGB(255,90,160)
vnoclipBtn.Text = "V-NOCLIP : OFF"
vnoclipBtn.TextScaled = true
vnoclipBtn.TextColor3 = Color3.new(0,0,0)
vnoclipBtn.Font = Enum.Font.SourceSans

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local speaker = Players.LocalPlayer
local speeds = 1
local nowe = false
local vup, vdown = 0,0
local vnoclip = false
local noclipConn
local GYRO_SMOOTHNESS = 0.15

onof.MouseButton1Down:Connect(function()
	nowe = not nowe
	if not nowe then return end

	local chr = speaker.Character
	if not chr then return end
	local hum = chr:FindFirstChildWhichIsA("Humanoid")
	local torso = chr:FindFirstChild("Torso") or chr:FindFirstChild("UpperTorso")
	if not hum or not torso then return end

	local bg = Instance.new("BodyGyro", torso)
	bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
	bg.P = 9e4

	local bv = Instance.new("BodyVelocity", torso)
	bv.MaxForce = Vector3.new(9e9,9e9,9e9)

	local cam = workspace.CurrentCamera

	local conn
	conn = RunService.RenderStepped:Connect(function()
		if not nowe or hum.Health <= 0 then
			conn:Disconnect()
			bg:Destroy()
			bv:Destroy()
			return
		end

		local lookVec = cam.CFrame.LookVector
		local torsoPos = torso.Position
		local targetCFrame = CFrame.new(torsoPos, torsoPos + Vector3.new(lookVec.X,0,lookVec.Z))
		bg.CFrame = bg.CFrame:Lerp(targetCFrame, GYRO_SMOOTHNESS)

		local md = hum.MoveDirection
		local dir = cam.CFrame.LookVector*md:Dot(cam.CFrame.LookVector) +
					cam.CFrame.RightVector*md:Dot(cam.CFrame.RightVector) +
					Vector3.new(0, vup - vdown, 0)
		bv.Velocity = dir.Magnitude>0 and dir.Unit*(speeds/0.03) or Vector3.zero
	end)
end)

up.MouseEnter:Connect(function() vup = 1 end)
up.MouseLeave:Connect(function() vup = 0 end)
down.MouseEnter:Connect(function() vdown = 1 end)
down.MouseLeave:Connect(function() vdown = 0 end)
plus.MouseButton1Down:Connect(function() speeds +=1 speed.Text = speeds end)
mine.MouseButton1Down:Connect(function() if speeds>1 then speeds-=1 speed.Text=speeds end end)

local function setCollide(model,state)
	for _,v in ipairs(model:GetDescendants()) do
		if v:IsA("BasePart") then
			if not v:FindFirstAncestorWhichIsA("Accessory") then
				v.CanCollide = state
			end
		end
	end
end

vnoclipBtn.MouseButton1Click:Connect(function()
	vnoclip = not vnoclip
	vnoclipBtn.Text = vnoclip and "V-NOCLIP : ON" or "V-NOCLIP : OFF"

	local chr = speaker.Character
	if not chr then return end
	local hum = chr:FindFirstChildWhichIsA("Humanoid")
	if not hum then return end

	if vnoclip then
		noclipConn = RunService.Stepped:Connect(function()
			setCollide(chr,false)
			if hum.SeatPart then
				local veh = hum.SeatPart:FindFirstAncestorOfClass("Model")
				if veh then setCollide(veh,false) end
			end
		end)
	else
		if noclipConn then noclipConn:Disconnect() noclipConn=nil end
		setCollide(chr,true)
		if hum.SeatPart then
			local veh = hum.SeatPart:FindFirstAncestorOfClass("Model")
			if veh then setCollide(veh,true) end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
    if sound then sound:Stop() sound:Destroy() end
    if screen_gui_image then screen_gui_image:Destroy() end
	main:Destroy()
end)

mini.MouseButton1Click:Connect(function()
	up.Visible=false
	down.Visible=false
	onof.Visible=false
	plus.Visible=false
	speed.Visible=false
	mine.Visible=false
	vnoclipBtn.Visible=false
	mini.Visible=false
	mini2.Visible=true
	Frame.BackgroundTransparency=1
	closebutton.Position=UDim2.new(0,0,-1,57)
end)

mini2.MouseButton1Click:Connect(function()
	up.Visible=true
	down.Visible=true
	onof.Visible=true
	plus.Visible=true
	speed.Visible=true
	mine.Visible=true
	vnoclipBtn.Visible=true
	mini.Visible=true
	mini2.Visible=false
	Frame.BackgroundTransparency=0
	closebutton.Position=UDim2.new(0,0,-1,27)
end)
