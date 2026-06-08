-- Audio Asset Setup
1. local audio_filename = "own_world.mp3"
2. local audio_url = "https://raw.githubusercontent.com/midorimidoru1-collab/roblox-scripts/main/own_world.mp3"
3. 
4. -- Ensure folder exists
5. if not isfolder("DeltaScripts") then makefolder("DeltaScripts") end
6. if not isfolder("DeltaScripts/Assets") then makefolder("DeltaScripts/Assets") end
7. 
8. local audio_path = "DeltaScripts/Assets/" .. audio_filename
9. 
10. -- Download audio if not exists
11. if not isfile(audio_path) then
12.     writefile(audio_path, game:HttpGet(audio_url))
13. end
14. 
15. -- Load and Play Audio
16. local audio_asset = getcustomasset(audio_path)
17. local sound = Instance.new("Sound")
18. sound.SoundId = audio_asset
19. sound.Volume = 1
20. sound.Parent = game:GetService("CoreGui") -- Play in CoreGui to persist
21. sound:Play()
22. 
23. local main = Instance.new("ScreenGui")
24. local Frame = Instance.new("Frame")
25. local up = Instance.new("TextButton")
26. local down = Instance.new("TextButton")
27. local onof = Instance.new("TextButton")
28. local TextLabel = Instance.new("TextLabel")
29. local plus = Instance.new("TextButton")
30. local speed = Instance.new("TextLabel")
31. local mine = Instance.new("TextButton")
32. local closebutton = Instance.new("TextButton")
33. local mini = Instance.new("TextButton")
34. local mini2 = Instance.new("TextButton")
35. local vnoclipBtn = Instance.new("TextButton")
36. 
37. main.Name = "main"
38. main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
39. main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
40. main.ResetOnSpawn = false
41. 
42. Frame.Parent = main
43. Frame.BackgroundColor3 = Color3.fromRGB(163,255,137)
44. Frame.BorderColor3 = Color3.fromRGB(103,221,213)
45. Frame.Position = UDim2.new(0.100320168,0,0.379746825,0)
46. Frame.Size = UDim2.new(0,190,0,57)
47. Frame.Active = true
48. Frame.Draggable = true
49. 
50. up.Parent = Frame
51. up.BackgroundColor3 = Color3.fromRGB(79,255,152)
52. up.Size = UDim2.new(0,44,0,28)
53. up.Text = "UP"
54. 
55. down.Parent = Frame
56. down.BackgroundColor3 = Color3.fromRGB(215,255,121)
57. down.Position = UDim2.new(0,0,0.491228074,0)
58. down.Size = UDim2.new(0,44,0,28)
59. down.Text = "DOWN"
60. 
61. onof.Parent = Frame
62. onof.BackgroundColor3 = Color3.fromRGB(255,249,74)
63. onof.Position = UDim2.new(0.702823281,0,0.491228074,0)
64. onof.Size = UDim2.new(0,56,0,28)
65. onof.Text = "V-fly"
66. 
67. TextLabel.Parent = Frame
68. TextLabel.BackgroundColor3 = Color3.fromRGB(242,60,255)
69. TextLabel.Position = UDim2.new(0.469327301,0,0,0)
70. TextLabel.Size = UDim2.new(0,100,0,28)
71. TextLabel.Text = "V-FLY GUI V3"
72. TextLabel.TextScaled = true
73. 
74. plus.Parent = Frame
75. plus.BackgroundColor3 = Color3.fromRGB(133,145,255)
76. plus.Position = UDim2.new(0.231578946,0,0,0)
77. plus.Size = UDim2.new(0,45,0,28)
78. plus.Text = "+"
79. 
80. speed.Parent = Frame
81. speed.BackgroundColor3 = Color3.fromRGB(255,85,0)
82. speed.Position = UDim2.new(0.468421042,0,0.491228074,0)
83. speed.Size = UDim2.new(0,44,0,28)
84. speed.Text = "1"
85. speed.TextScaled = true
86. 
87. mine.Parent = Frame
88. mine.BackgroundColor3 = Color3.fromRGB(123,255,247)
89. mine.Position = UDim2.new(0.231578946,0,0.491228074,0)
90. mine.Size = UDim2.new(0,45,0,29)
91. mine.Text = "-"
92. 
93. closebutton.Parent = Frame
94. closebutton.BackgroundColor3 = Color3.fromRGB(225,25,0)
95. closebutton.Size = UDim2.new(0,45,0,28)
96. closebutton.Text = "X"
97. closebutton.TextSize = 15
98. closebutton.Position = UDim2.new(0,0,-1,27)
99. 
100. mini.Parent = Frame
101. mini.BackgroundColor3 = Color3.fromRGB(192,150,230)
102. mini.Size = UDim2.new(0,45,0,28)
103. mini.Text = "-"
104. mini.TextSize = 15
105. mini.Position = UDim2.new(0,44,-1,27)
106. 
107. mini2.Parent = Frame
108. mini2.BackgroundColor3 = Color3.fromRGB(192,150,230)
109. mini2.Size = UDim2.new(0,45,0,28)
110. mini2.Text = "+"
111. mini2.TextSize = 15
112. mini2.Position = UDim2.new(0,44,-1,57)
113. mini2.Visible = false
114. 
115. vnoclipBtn.Parent = Frame
116. vnoclipBtn.Size = UDim2.new(0,189,0,28)
117. vnoclipBtn.Position = UDim2.new(0,0,1,0)
118. vnoclipBtn.BackgroundColor3 = Color3.fromRGB(255,90,160)
119. vnoclipBtn.Text = "V-NOCLIP : OFF"
120. vnoclipBtn.TextScaled = true
121. vnoclipBtn.TextColor3 = Color3.new(0,0,0)
122. vnoclipBtn.Font = Enum.Font.SourceSans
123. 
124. local Players = game:GetService("Players")
125. local RunService = game:GetService("RunService")
126. local speaker = Players.LocalPlayer
127. local speeds = 1
128. local nowe = false
129. local vup, vdown = 0,0
130. local vnoclip = false
131. local noclipConn
132. local GYRO_SMOOTHNESS = 0.15
133. 
134. onof.MouseButton1Down:Connect(function()
135. 	nowe = not nowe
136. 	if not nowe then return end
137. 
138. 	local chr = speaker.Character
139. 	if not chr then return end
140. 	local hum = chr:FindFirstChildWhichIsA("Humanoid")
141. 	local torso = chr:FindFirstChild("Torso") or chr:FindFirstChild("UpperTorso")
142. 	if not hum or not torso then return end
143. 
144. 	local bg = Instance.new("BodyGyro", torso)
145. 	bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
146. 	bg.P = 9e4
147. 
148. 	local bv = Instance.new("BodyVelocity", torso)
149. 	bv.MaxForce = Vector3.new(9e9,9e9,9e9)
150. 
151. 	local cam = workspace.CurrentCamera
152. 
153. 	local conn
154. 	conn = RunService.RenderStepped:Connect(function()
155. 		if not nowe or hum.Health <= 0 then
156. 			conn:Disconnect()
157. 			bg:Destroy()
158. 			bv:Destroy()
159. 			return
160. 		end
161. 
162. 		local lookVec = cam.CFrame.LookVector
163. 		local torsoPos = torso.Position
164. 		local targetCFrame = CFrame.new(torsoPos, torsoPos + Vector3.new(lookVec.X,0,lookVec.Z))
165. 		bg.CFrame = bg.CFrame:Lerp(targetCFrame, GYRO_SMOOTHNESS)
166. 
167. 		local md = hum.MoveDirection
168. 		local dir = cam.CFrame.LookVector*md:Dot(cam.CFrame.LookVector) +
169. 					cam.CFrame.RightVector*md:Dot(cam.CFrame.RightVector) +
170. 					Vector3.new(0, vup - vdown, 0)
171. 		bv.Velocity = dir.Magnitude>0 and dir.Unit*(speeds/0.03) or Vector3.zero
172. 	end)
173. end)
174. 
175. up.MouseEnter:Connect(function() vup = 1 end)
176. up.MouseLeave:Connect(function() vup = 0 end)
177. down.MouseEnter:Connect(function() vdown = 1 end)
178. down.MouseLeave:Connect(function() vdown = 0 end)
179. plus.MouseButton1Down:Connect(function() speeds +=1 speed.Text = speeds end)
180. mine.MouseButton1Down:Connect(function() if speeds>1 then speeds-=1 speed.Text=speeds end end)
181. 
182. local function setCollide(model,state)
183. 	for _,v in ipairs(model:GetDescendants()) do
184. 		if v:IsA("BasePart") then
185. 			if not v:FindFirstAncestorWhichIsA("Accessory") then
186. 				v.CanCollide = state
187. 			end
188. 		end
189. 	end
190. end
191. 
192. vnoclipBtn.MouseButton1Click:Connect(function()
193. 	vnoclip = not vnoclip
194. 	vnoclipBtn.Text = vnoclip and "V-NOCLIP : ON" or "V-NOCLIP : OFF"
195. 
196. 	local chr = speaker.Character
197. 	if not chr then return end
198. 	local hum = chr:FindFirstChildWhichIsA("Humanoid")
199. 	if not hum then return end
200. 
201. 	if vnoclip then
202. 		noclipConn = RunService.Stepped:Connect(function()
203. 			setCollide(chr,false)
204. 			if hum.SeatPart then
205. 				local veh = hum.SeatPart:FindFirstAncestorOfClass("Model")
206. 				if veh then setCollide(veh,false) end
207. 			end
208. 		end)
209. 	else
210. 		if noclipConn then noclipConn:Disconnect() noclipConn=nil end
211. 		setCollide(chr,true)
212. 		if hum.SeatPart then
213. 			local veh = hum.SeatPart:FindFirstAncestorOfClass("Model")
214. 			if veh then setCollide(veh,true) end
215. 		end
216. 	end
217. end)
218. 
219. closebutton.MouseButton1Click:Connect(function()
220. 	main:Destroy()
221. end)
222. 
223. mini.MouseButton1Click:Connect(function()
224. 	up.Visible=false
225. 	down.Visible=false
226. 	onof.Visible=false
227. 	plus.Visible=false
228. 	speed.Visible=false
229. 	mine.Visible=false
230. 	vnoclipBtn.Visible=false
231. 	mini.Visible=false
232. 	mini2.Visible=true
233. 	Frame.BackgroundTransparency=1
234. 	closebutton.Position=UDim2.new(0,0,-1,57)
235. end)
236. 
237. mini2.MouseButton1Click:Connect(function()
238. 	up.Visible=true
239. 	down.Visible=true
240. 	onof.Visible=true
241. 	plus.Visible=true
242. 	speed.Visible=true
243. 	mine.Visible=true
244. 	vnoclipBtn.Visible=true
245. 	mini.Visible=true
246. 	mini2.Visible=false
247. 	Frame.BackgroundTransparency=0
248. 	closebutton.Position=UDim2.new(0,0,-1,27)
249. end)
250. 
251. -- Auto-Stop Audio when GUI is closed
252. closebutton.MouseButton1Click:Connect(function()
253.     sound:Stop()
254.     sound:Destroy()
255. end)
256. 
