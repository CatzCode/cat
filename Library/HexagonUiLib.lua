-- Hexagon UI Library
local TweenService, RunService, UserInputService,gui,dragging,dragInput,dragStart,startPos,cpt,cpf,cppicking,cppickingVal,cppickingAlpha,cphue,cpsat,cpval,focused,highest,focusedBox = game:GetService("TweenService"),game:GetService("RunService"), game:GetService("UserInputService")
local cpalpha = 0

-- Dragging
local function updateDrag(input)
    local delta = input.Position - dragStart
    gui.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
end

--color picker
local function updateColorHue(input, obj, hue, sat)
	hue = (obj.AbsoluteSize.X-(input.Position.X-obj.AbsolutePosition.X))/obj.AbsoluteSize.X
	sat = (obj.AbsoluteSize.Y-(input.Position.Y-obj.AbsolutePosition.Y))/obj.AbsoluteSize.Y
	return (input.Position.X-obj.AbsolutePosition.X)/obj.AbsoluteSize.X, (input.Position.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y, hue, sat
end

local function updateValue(input, obj, val)
	val = (obj.AbsoluteSize.Y-(input.Position.Y-obj.AbsolutePosition.Y))/obj.AbsoluteSize.Y
	return (input.Position.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y, val
end

local function updateAlpha(input, obj, alpha)
	alpha = (obj.AbsoluteSize.X-(input.Position.X-obj.AbsolutePosition.X))/obj.AbsoluteSize.X
	return (input.Position.X-obj.AbsolutePosition.X)/obj.AbsoluteSize.X, alpha
end

local function rgbToHsv(r, g, b)
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max
	
	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end
	
	if max == min then
		h = 0 -- achromatic
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

--drag function and color picker
UserInputService.InputChanged:connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
	if input.UserInputType == Enum.UserInputType.MouseMovement then
	
	end
end)

--slider
local function round(num, bracket)
	bracket = bracket or 1
	return math.floor(num/bracket + math.sign(num) * 0.5) * bracket
end

--zindex stuff
local function focusOnOption(obj)
	if highest then
		highest.ZIndex = highest.ZIndex - 5
		for _,v in next, highest:GetDescendants() do
			pcall(function()
				v.ZIndex = v.ZIndex +- 5
			end)
		end
	end
	highest = obj
	highest.ZIndex = highest.ZIndex + 5
	for _,v in next, highest:GetDescendants() do
		pcall(function()
			v.ZIndex = v.ZIndex + 5
		end)
	end
end

local function focusOnWindow(obj)
	if focused then
		focused.ZIndex = focused.ZIndex - 10
		for _,v in next, focused:GetDescendants() do
			pcall(function()
				v.ZIndex = v.ZIndex - 10
			end)
		end
	end
	focused = obj
	focused.ZIndex = focused.ZIndex + 10
	for _,v in next, focused:GetDescendants() do
		pcall(function()
			v.ZIndex = v.ZIndex + 10
		end)
	end
end

local ddcheck
local extframes = {}
for i=1,4 do
	local frame = Instance.new("Frame")
	frame.ZIndex = 50
	frame.BackgroundTransparency = 1
	frame.Visible = false
	if i == 1 then
		frame.Size = UDim2.new(0,1000,0,-1000)
	elseif i == 2 then
		frame.Size = UDim2.new(0,1000,0,1000)
		frame.Position = UDim2.new(1,0,0,0)
	elseif i == 3 then
		frame.Size = UDim2.new(0,-1000,0,1000)
		frame.Position = UDim2.new(1,0,1,0)
	elseif i == 4 then
		frame.Size = UDim2.new(0,-1000,0,-1000)
		frame.Position = UDim2.new(0,0,1,0)
	end
	table.insert(extframes, frame)
	frame.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			frame.Parent.Visible = false
			if ddcheck then
				ddcheck.arrow.Text = ">"
				ddcheck.closed = not ddcheck.closed
			end
			for _,v in next, extframes do
				v.Visible = false
			end
		end
	end)
end

local function closeWindow(obj)
	for _,v in next, extframes do
		v.Visible = true
		v.Parent = obj
	end
end

local library = {
	windows = {},
    pointers = {},
    settings = {
        guiname = "Hexagon",
		title = "Hexagon",
		logo = "rbxassetid://4350178803", -- "http://www.roblox.com/asset/?id=6597976562",
        footer = " wassup",
        modal = true,
        font = Enum.Font.SourceSans,
        textsize = 16,
        textstroke = true
    },
    theme = {
        buttons = Color3.fromRGB(20, 200, 20), -- toggle, sliders colors
        text = Color3.fromRGB(235, 235, 235),
        textboxtext = Color3.fromRGB(145, 145, 145),
        main = Color3.fromRGB(30, 30, 30),
        outline = Color3.fromRGB(60, 60, 60),
        tabholder = Color3.fromRGB(35, 35, 35),
        tabbutton = Color3.fromRGB(30, 30, 30),
        tabselected = Color3.fromRGB(50, 50, 50)
    }
}

function library:create(class, properties)
	local inst = Instance.new(class)
	for property, value in pairs(properties) do
		inst[property] = value
	end
	return inst
end

function library:Notify(title, message, time, buttons, _function)
	local notification = {}

	for i,v in pairs(library.base:GetChildren()) do
		if v.Name == "Notification" then
			v:TweenPosition(UDim2.new(v.Position.X, v.Position.Y - UDim.new(0, 100)), "InOut", "Quart", 0.5)
		end
	end

	notification.settings = {
		title = title or "",
		message = message or "",
		time = time or 5,
		buttons = buttons or {}
	}

	notification.window = library:create("TextLabel", {
		ZIndex = 100,
		Size = UDim2.new(0,220,0,80),
		Position = UDim2.new(0,-300,1,-90),
		BackgroundColor3 = Color3.fromRGB(30,30,30),
		Text = "",
		Name = "Notification",
		Parent = library.base
	})

	notification.title = library:create("TextLabel", {
		ZIndex = 100,
		BackgroundTransparency = 1,
		Size = UDim2.new(1,0,0,18),
		Text = notification.settings.title,
		TextSize = 18,
		TextColor3 = Color3.new(1,1,1),
		Font = "Code",
		TextXAlignment = "Left",
		Name = "Title",
		Parent = notification.window
	})

	notification.message = library:create("TextLabel", {
		ZIndex = 100,
		BackgroundTransparency = 1,
		Size = UDim2.new(1,0,0,18),
		Position = UDim2.new(0,0,0.25,0),
		Text = notification.settings.message,
		TextSize = 14,
		TextColor3 = Color3.new(1,1,1),
		Font = "Code",
		TextXAlignment = "Left",
		Name = "Message",
		Parent = notification.window
	})

	for i,v in pairs(notification.settings.buttons) do
		notification["button"..i] = library:create("TextButton", {
			ZIndex = 100,
			Size = UDim2.new(1/#buttons, 0, 0, 16),
			Position = UDim2.new((i-1)/#buttons, 0,0.8,0),
			BackgroundColor3 = Color3.fromRGB(60,60,60),
			Text = v,
			TextSize = 14,
			TextColor3 = Color3.fromRGB(235, 235, 235),
			Font = "Code",
			TextStrokeColor3 = Color3.new(0,0,0),
			TextStrokeTransparency = 0,
			Name = "Button"..i,
			Parent = notification.window
		}) 

		notification["button"..i].InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				_function(notification["button"..i].Text)
				notification.window:TweenPosition(UDim2.new(notification.window.Position.X - UDim.new(0, 310), notification.window.Position.Y), "InOut", "Quart", 0.5)
				wait(0.5)
				if notification and notification.window then
					notification.window:Remove()
					notification = nil
				end
			end
		end)
	end

	notification.window:TweenPosition(UDim2.new(notification.window.Position.X + UDim.new(0, 310), notification.window.Position.Y), "InOut", "Quart", 0.5)

	wait(notification.settings.time)

	if notification and notification.window then
		notification.window:TweenPosition(UDim2.new(notification.window.Position.X - UDim.new(0, 310), notification.window.Position.Y), "InOut", "Quart", 0.5)
		wait(0.5)
		if notification and notification.window then
			notification.window:Remove()
			notification = nil
		end
	end
end

function library:LoadTheme(theme)

end

function library:LoadConfiguration(cfg)
	table.foreach(cfg, function(a,b)
		if library.pointers[a] then
			spawn(function() library.pointers[a]:Set(b) end)
		else
			warn("Config loading error (Object not found):", a, b)
		end
	end)
end

function library:SaveConfiguration()
	local tbl = {}
	
	local SpecialCharacters = {
		['\a'] = '\\a',
		['\b'] = '\\b',
		['\f'] = '\\f',
		['\n'] = '\\n',
		['\r'] = '\\r',
		['\t'] = '\\t',
		['\v'] = '\\v',
		['\0'] = '\\0'
	}
	
	local function SerializeType(Value, Class, Comma)
		local NewValue = ''
	
		if Class == 'string' then
			NewValue = ('"%s"'):format(Value:gsub('[%c%z]', SpecialCharacters))
		elseif Class == 'Instance' then
			NewValue = Value:GetFullName()
		elseif Class == 'EnumItem' then
			NewValue = tostring(Value)
		elseif type(Value) ~= Class then -- CFrame, Vector3, UDim2, ...
			NewValue = Class .. '.new(' .. tostring(Value) .. ')'
		elseif Class == 'userdata' then
			NewValue = ('[Userdata, Metatable Field: %s]'):format(tostring(not not getmetatable(Value)))
		else -- thread, number, boolean, nil, ...
			NewValue = tostring(Value)
		end
	
		if Comma == true then
			NewValue = NewValue..","
		end

		return NewValue
	end
	
	local function TableToString(Table, IgnoredTables, Depth)
		IgnoredTables = IgnoredTables or {}
	
		if IgnoredTables[Table] then
			return IgnoredTables[Table] == Depth - 1 and '[Parent table]' or '[Cyclic Table]'
		end
	
		Depth = Depth or 0
		Depth = Depth + 1
		IgnoredTables[Table] = Depth
	
		local Tab = ('    '):rep(Depth)
		local TrailingTab = ('    '):rep(Depth - 1)
		local Result = '{'
		local LineTab = '\n' .. Tab
	
		for Key, Value in pairs(Table) do
			local KeyClass, ValueClass = typeof(Key), typeof(Value)
			
			if KeyClass == 'string' then
				Key = Key:gsub('[%c%z]', SpecialCharacters)
				
				if Key:match'%s' then
					Key = ('["%s"]'):format(Key)
				end
				
				Key = '["'..Key..'"]'
			else
				Key = '[' .. (KeyClass == 'table' and TableToString(Key, IgnoredTables, Depth):gsub('^[\n\r%s]*(.-)[\n\r%s]*$', '%1') or SerializeType(Key, KeyClass, false)) .. ']'
			end
	
			Value = ValueClass == 'table' and TableToString(Value, IgnoredTables, Depth) or SerializeType(Value, ValueClass, true)
			Result = Result .. LineTab .. Key .. ' = ' .. Value
		end
	
		return Result .. '\n'  .. TrailingTab .. '}' .. ","
	end
	
    for i,v in pairs(library.pointers) do
		if not table.find({"SettingsTabCategoryPlayersUsername", "SettingsTabCategoryConfigsConfig", "SettingsTabCategoryConfigsName"}, i) then
			tbl[i] = v.value
		end
	end
	
    return TableToString(tbl):sub(0, -2)
end

function library:CreateWindow(csize, cpos)
	ctitle = library.settings.title
	
	local window = {xpos = 0, close = true, draggable = true}
	table.insert(self.windows, window)
	
	self.base = self.base or self:create("ScreenGui", {
		Name = library.settings.guiname,
		Parent = game.CoreGui
	})

	self.pointer = self.pointer or self:create("ImageLabel", {
		ZIndex = 100,
		Size = UDim2.new(0,8,0,8),
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0.5,0.5),
        Image = "rbxassetid://165689900",
		Name = "Pointer",
		Parent = self.base
	})
	
	window.main = self:create("TextButton", {
		Position = UDim2.new(0,cpos.X,0,cpos.Y),
		Size = UDim2.new(0,csize.X,0,csize.Y),
		BackgroundColor3 = self.theme.main,
		BorderColor3 = self.theme.outline,
		Text = "",
		Name = "Window",
		AutoButtonColor = false,
		Parent = self.base
	})
	
	window.shade = self:create("ImageLabel", {
		Size = UDim2.new(1,0,0,18),
		BackgroundTransparency = 1,
		Image = "rbxassetid://2916745254",
		ImageColor3 = Color3.fromRGB(25, 25, 25),
		ImageTransparency = 0.2,
		Parent = window.main
	})
	
	window.logo = self:create("ImageLabel", {
		Size = UDim2.new(0,18,0,18),
		Position = UDim2.new(0,8,0,2),
		BackgroundTransparency = 1,
		Name = "Logo",
		Image = library.settings.logo,
		Parent = window.main
	})

	window.title = self:create("TextLabel", {
		Size = UDim2.new(1,0,0,18),
		Position = UDim2.new(0,32,0,2),
		BackgroundTransparency = 1,
		Name = "TitleLabel",
		Text = ctitle, -- tostring(" "..ctitle) or tostring(" "..self.settings.title),
		TextColor3 = self.theme.text,
		TextStrokeTransparency = self.settings.textstroke and 0 or 1,
		TextXAlignment = "Left",
		Font = self.settings.font,
		TextSize = self.settings.textsize + 2,
		Parent = window.main
	})
	
	window.title.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 and window.draggable then
			gui = window.main
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	window.title.InputChanged:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	window.main.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			focusOnWindow(window.main)
		end
	end)
	
	local spectators = {}

	spectators.main = library:create("TextButton", {
		Position = UDim2.new(0, (workspace.CurrentCamera.ViewportSize.X/2)-100, 0, (workspace.CurrentCamera.ViewportSize.Y/2)-320),
		Size = UDim2.new(0,200,0,40),
		BackgroundColor3 = self.theme.main,
		BorderColor3 = self.theme.outline,
		Text = "",
		Name = "Spectators",
		AutoButtonColor = false,
		Active = true,
		Draggable = true,
		Selectable = true,
		Visible = false,
		Parent = library.base
	})

	spectators.title = library:create("TextLabel", {
		Size = UDim2.new(1,0,0,18),
		Position = UDim2.new(0,0,0,2),
		BackgroundTransparency = 1,
		Name = "TitleLabel",
		Text = "Spectators",
		TextColor3 = self.theme.text,
		TextStrokeTransparency = self.settings.textstroke and 0 or 1,
		Font = self.settings.font,
		TextSize = self.settings.textsize + 2,
		Parent = spectators.main
	})	

	spectators.frame = library:create("Frame", {
		Position = UDim2.new(0,10,0,25),
		Size = UDim2.new(1,-20,1,-35),
		BackgroundColor3 = library.theme.tabholder,
		BorderColor3 = library.theme.outline,
		Name = "SpectatorsFrame",
		Parent = spectators.main
	})
	
	spectators.layout = library:create("UIListLayout", {
		Parent = spectators.frame
	})
	
	spectators.layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		if spectators.layout.AbsoluteContentSize.Y == 0 then
			spectators.main.Size = UDim2.new(0,200,0,40)
		else
			spectators.main.Size = UDim2.new(0,200,0,spectators.layout.AbsoluteContentSize.Y+34)
		end
	end)
	
	function window:CreateTab(name)
		local tab = {}
		local bounds = game:GetService('TextService'):GetTextSize(name, library.settings.textsize, library.settings.font, Vector2.new(math.huge, math.huge))
		tab.rows = {}
		
		local function createNewRow()
			tab.row = library:create("Frame", {
				Position = UDim2.new(0,csize.X/2 * #tab.rows - (#tab.rows * 10),0,0),
				Size = UDim2.new(0,csize.X/2 - 10,1,0),
				BackgroundTransparency = 1,
				Parent = tab.main
			})

			tab.layout = library:create("UIListLayout", {
				Padding = UDim.new(0,8),
				Parent = tab.row
			})
			
			tab.layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				if tab.layout.AbsoluteContentSize.Y+20 > tab.main.CanvasSize.Y.Offset then
					tab.main.CanvasSize = UDim2.new(0,0,0,tab.layout.AbsoluteContentSize.Y+20)
				end
			end)
			
			tab.padding = library:create("UIPadding", {
				PaddingLeft = UDim.new(0,4),
				PaddingRight = UDim.new(0,4),
				PaddingTop = UDim.new(0,12),
				Parent = tab.row
			})

			table.insert(tab.rows, tab)

			if #tab.rows > 2 then
				self.main.Size = self.main.Size + UDim2.new(0,csize.X/2 - 10,0,0)
			end
		end
		
		local function checkRow()
			if tab.row then
				for _,row in pairs(tab.rows) do
					tab = row
				end
			else
				createNewRow()
			end
		end

		self.tabholder = self.tabholder or library:create("Frame", {
			Position = UDim2.new(0,10,0,25),
			Size = UDim2.new(1,-20,1,-55),
			BackgroundColor3 = library.theme.tabholder,
			BorderColor3 = library.theme.outline,
			Name = "PagesFrame",
			Parent = self.main
		})
		
		self.footer = self.footer or library:create("TextLabel", {
			Position = UDim2.new(0,0,1,0),
			Size = UDim2.new(1,0,0,-18),
			BackgroundColor3 = library.theme.tabbutton,
			BorderColor3 = library.theme.outline,
			Name = "FooterLabel",
			Text = " "..library.settings.footer,
			TextColor3 = library.theme.text,
			TextStrokeTransparency = library.settings.textstroke and 0 or 1,
			Font = library.settings.font,
			TextSize = library.settings.textsize,
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = self.main
		})
	
		tab.main = library:create("ScrollingFrame", {
			Position = UDim2.new(0,0,0,20),
			Size = UDim2.new(1,0,1,-20),
			BackgroundColor3 = library.theme.tabselected,
			BorderColor3 = library.theme.outline,
			Name = "Frame-"..name, -- "PageFrame",
			ScrollBarThickness = 0,
			ScrollingDirection = "Y",
			TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
			MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
			BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
			Visible = false,
			Parent = self.tabholder
		})

		tab.button = library:create("Frame", {
			Position = UDim2.new(0,self.xpos,0,0),
			Size = UDim2.new(0,bounds.X+8,0,19),
			Name = "Button-"..name,
			BorderColor3 = library.theme.outline,
			Parent = self.tabholder
		})
		
		tab.buttontop = library:create("Frame", {
			Size = UDim2.new(1,0,1,0),
			BackgroundColor3 = library.theme.tabbutton,
			BorderSizePixel = 0,
			BorderColor3 = library.theme.outline,
			Parent = tab.button
		})
		
		tab.label = library:create("TextLabel", {
			Size = UDim2.new(1,0,1,0),
			BackgroundTransparency = 1,
			Text = name,
			TextColor3 = library.theme.text,
			TextStrokeTransparency = library.settings.textstroke and 0 or 1,
			Font = library.settings.font,
			TextSize = library.settings.textsize,
			Parent = tab.button
		})
		
		if self.xpos == 0 then
			self.focused = tab
			self.focused.main.Visible = true
			self.focused.buttontop.Size = self.focused.buttontop.Size + UDim2.new(0,0,0,1)
			tab.buttontop.BackgroundColor3 = library.theme.tabselected
		end

		self.xpos = self.xpos + bounds.X + 8
		
		tab.label.InputBegan:connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				self.focused.main.Visible = false
				self.focused.buttontop.Size = self.focused.buttontop.Size - UDim2.new(0,0,0,1)
				self.focused.buttontop.BackgroundColor3 = library.theme.tabbutton
				self.focused = tab
				self.focused.main.Visible = true
				self.focused.buttontop.Size = self.focused.buttontop.Size + UDim2.new(0,0,0,1)
				self.focused.buttontop.BackgroundColor3 = library.theme.tabselected
			end
		end)
		
		function tab:AddCategory(title, side)
			local LocalTab = {order = 0}
			local bounds = game:GetService('TextService'):GetTextSize(title, library.settings.textsize, library.settings.font, Vector2.new(math.huge, math.huge))

			if side and typeof(side) == "number" then
				if tab.rows[side] then
					tab = tab.rows[side]
				else
					repeat
						wait()
						createNewRow()
					until tab.rows[side]
				end
			else
				checkRow()
			end
			
			LocalTab.main = library:create("Frame", {
				Size = UDim2.new(1,0,0,0),
				BackgroundColor3 = library.theme.tabselected,
				BorderColor3 = library.theme.outline,
				BorderSizePixel = 2,
				BorderMode = "Outline",
				Parent = self.row
			})
			
			LocalTab.title = library:create("TextLabel", {
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(0,12,0,0),
				Size = UDim2.new(0,bounds.X + 8,0,2),
				BackgroundColor3 = library.theme.tabselected,
				BorderSizePixel = 0,
				Text = title,
				TextColor3 = library.theme.text,
				TextStrokeTransparency = library.settings.textstroke and 0 or 1,
				Font = library.settings.font,
				TextSize = library.settings.textsize + 2,
				ZIndex = 12,
				Parent = LocalTab.main
			})
			
			LocalTab.content = library:create("Frame", {
				Size = UDim2.new(1,0,1,0),
				BackgroundColor3 = Color3.fromRGB(40, 40, 40),
				BackgroundTransparency = 0,
				Parent = LocalTab.main
			})
			
			LocalTab.layout = library:create("UIListLayout", {
				Padding = UDim.new(0,4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = LocalTab.content
			})
			
			LocalTab.padding = library:create("UIPadding", {
				PaddingLeft = UDim.new(0,6),
				PaddingRight = UDim.new(0,6),
				PaddingTop = UDim.new(0,12),
				Parent = LocalTab.content
			})

			function LocalTab:AddLabel(text, pointername)
				local label = {}
				checkRow()
				LocalTab.main.Parent = tab.row
				
				label.label = library:create("TextLabel", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundTransparency = 1,
					Text = "",
					TextColor3 = Color3.fromRGB(255, 255, 255),
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextWrapped = true,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = LocalTab.content
				})
				
				function label:Set(text)
					label.text = text
					label.label.Text = text
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
				label:Set(text)
				if pointername then library.pointers[pointername] = label end
				
				self.order = self.order + 1
				
				return label
			end
			
			function LocalTab:AddButton(text, newrow, _function)
				local button = {}
				_function = _function or function() end
                newrow = newrow or false

				if newrow then 
                    checkRow()
					LocalTab.main.Parent = tab.row
                end
				
				button.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundColor3 = Color3.fromRGB(60, 60, 60),
					BackgroundTransparency = 0,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Center,
					Parent = self.content,
				})
				if newrow then 
					self.order = self.order + 1
				end
				
				button.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						_function()
					end
				end)
				
                if newrow then
				    LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				end
                
				return button
			end
			
			function LocalTab:AddToggle(text, defVal, pointername, _function)
				local toggle = {value = false}
				_function = _function or function() end
				checkRow()
				LocalTab.main.Parent = tab.row
				
				toggle.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Parent = self.content,
				})
				
				toggle.holder = library:create("Frame", {
					AnchorPoint = Vector2.new(0,0.5),
					Position = UDim2.new(1,-1,0.5,0),
					Size = UDim2.new(0,-library.settings.textsize+4,0,library.settings.textsize-4),
					BackgroundColor3 = library.theme.tabholder,
					BorderSizePixel = 2,
					BorderColor3 = library.theme.main,
					Parent = toggle.button,
				})
				
				toggle.visualize = library:create("Frame", {
					Position = UDim2.new(0,0,0,0),
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 1,
					BackgroundColor3 = library.theme.buttons,
					BorderSizePixel = 0,
					Parent = toggle.holder,
				})
				
				self.order = self.order + 1
				
				function toggle:Set(value)
					toggle.value = value
					if toggle.value then
						toggle.visualize.BackgroundTransparency = 0
					else
						toggle.visualize.BackgroundTransparency = 1	
					end
					return _function(toggle.value)
				end
				
				toggle.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						toggle.value = not toggle.value
						toggle:Set(toggle.value)
					end
				end)
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
				
                toggle:Set(defVal)
                library.pointers[pointername] = toggle
				
				return toggle
			end
			
			function LocalTab:AddTextBox(text, txtval, pointername, _function, keep)
				local box = {value = ""}
				
				if txtval then
					if typeof(txtval) == "function" then
						_function = txtval
						txtval = ""
					elseif typeof(txtval) == "string" then
						box.value = txtval
					end
				end

				if keep then
					if typeof(keep) == "string" then
						keep = false
					end
				end
				
				_function = _function or function() end
				checkRow()
				LocalTab.main.Parent = tab.row
				
				box.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				box.box = library:create("TextBox", {
					Position = UDim2.new(0,0,0,19),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Text = txtval,
					TextColor3 = library.theme.text,
					PlaceholderText = text,
					PlaceholderColor3 = library.theme.textboxtext,
					Font = library.settings.font,
					TextSize = library.settings.textsize-2,
					TextWrapped = true,
					Parent = box.button,
				})
				
				self.order = self.order + 1
				
				box.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						box.box:CaptureFocus()
					end
				end)
				
				box.box:GetPropertyChangedSignal("Text"):connect(function(ext)
                    box.value = box.box.Text
					return _function(box.box.Text, false, ext)
				end)

				box.box.FocusLost:connect(function()
                    box.value = box.box.Text
					return _function(box.box.Text, true)
				end)
				
				UserInputService.InputBegan:connect(function(input)
					if input.KeyCode == Enum.KeyCode.Escape and box.box:IsFocused() then
						box.box:ReleaseFocus()
					end
				end)
				
                function box:Set(value)
					box.value = value
                    box.box.Text = value
					--return _function(box.box.Text, true)
                end
                
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)

                box:Set(txtval)
                library.pointers[pointername] = box
				
				return box
			end
			
			function LocalTab:AddDropdown(text, defOptions, defVal, pointername, _function, push)
				_function = _function or function() end
				
				local dropdown = {order = 0, closed = true, options = defOptions, value = nil}
				
				dropdown.content = {}
				checkRow()
				LocalTab.main.Parent = tab.row
				
				dropdown.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				dropdown.main = library:create("TextButton", {
					Position = UDim2.new(0,0,0,19),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Text = dropdown.value,
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = dropdown.button,
				})
				
				dropdown.arrow = library:create("TextLabel", {
					Position = UDim2.new(1,0,0,2),
					Size = UDim2.new(0,-16,0,16),
					Rotation = 90,
					BackgroundTransparency = 1,
					Text = ">",
					TextColor3 = library.theme.textboxtext, -- library.theme.tabbutton,
					Font = Enum.Font.Arcade,
					TextSize = 18,
					Parent = dropdown.main,
				})
				
				dropdown.container = library:create("Frame", {
					ZIndex = 15,
					Position = UDim2.new(0,0,1,3),
					BackgroundTransparency = 1,
					Visible = false,
					Parent = dropdown.main,
				})
				
				dropdown.contentholder = library:create("ScrollingFrame", {
					ZIndex = 15,
					ClipsDescendants = true,
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 0,
					BorderSizePixel = 1,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.outline,
					CanvasSize = UDim2.new(0,0,0,0),
					ScrollBarThickness = 0,
					Visible = true,
					Parent = dropdown.container,
				})
				
				dropdown.layout = library:create("UIListLayout", {
					Padding = UDim.new(0,0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = dropdown.contentholder
				})
				
				dropdown.search = library:create("TextBox", {
					ZIndex = dropdown.contentholder.ZIndex,
					LayoutOrder = dropdown.order,
					Size = UDim2.new(1,0,0,18),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Text = "",
					PlaceholderText = "Search",
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = dropdown.contentholder
				})

				self.order = self.order + 1
				
				local function addOptions(options)
					if typeof(options[1]) == "function" and typeof(options[2]) == "Instance" then
						options = options[1](options[2])
					end

					for _,value in pairs(options) do
						if typeof(value) ~= "table" then 
							value = tostring(value)
						end

						dropdown.order = dropdown.order + 1
						
						local option = library:create("TextButton", {
							ZIndex = dropdown.contentholder.ZIndex,
							LayoutOrder = dropdown.order,
							Size = UDim2.new(1,0,0,18),
							BackgroundTransparency = 0,
							BackgroundColor3 = library.theme.tabholder,
							BorderColor3 = library.theme.tabbutton,
							Text = value,
							TextColor3 = library.theme.text,
							Font = library.settings.font,
							TextSize = library.settings.textsize,
							AutoButtonColor = false,
							Parent = dropdown.contentholder,
						})
						
						option.MouseButton1Click:connect(function()
							dropdown.value = value
							if push then
								for _,v in pairs(dropdown.content) do
									if v.LayoutOrder < option.LayoutOrder then
										v.LayoutOrder = v.LayoutOrder + 1
									end
								end
								option.LayoutOrder = 1
							end
							dropdown.main.Text = dropdown.value
							dropdown.closed = true
							dropdown.arrow.Text = ">"
							dropdown.container.Visible = false
							return _function(dropdown.value)
						end)
						
						if dropdown.order > 5 then
							dropdown.contentholder.CanvasSize = UDim2.new(0,0,0,dropdown.layout.AbsoluteContentSize.Y)
						else
							dropdown.container.Size = UDim2.new(1,0,0,dropdown.layout.AbsoluteContentSize.Y)
						end
						
						table.insert(dropdown.content, dropdown.order, option)
					end
				end

				function dropdown:Refresh(options, keep)
					if typeof(options) == "function" then
						options = options()
					end
					
					if not keep then
						for _,v in pairs(dropdown.contentholder:GetChildren()) do
							if v:IsA"TextButton" then
								v:Destroy()
								dropdown.order = dropdown.order - 1
								dropdown.contentholder.CanvasSize = UDim2.new(0,0,0,dropdown.layout.AbsoluteContentSize.Y)
							end
						end
					end
					
					addOptions(options)
				end

				function dropdown:Search(text)
					for i,v in pairs(dropdown.content) do
						if v.Text:match(text) then
							v.Visible = true
						else
							v.Visible = false
						end
					end
				end
				
				dropdown.main.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						focusOnOption(dropdown.container)
						closeWindow(dropdown.container)
						ddcheck = dropdown
						dropdown.closed = not dropdown.closed
						dropdown.container.Visible = not dropdown.container.Visible

						if not dropdown.closed then
							dropdown.arrow.Text = "<"
							dropdown.container.Visible = true
							dropdown:Refresh(dropdown.options)
						end
					end
				end)

				dropdown.search.FocusLost:Connect(function(input)
					dropdown:Search(dropdown.search.Text)
				end)

				function dropdown:Set(value)
					dropdown.value = value
					dropdown.main.Text = dropdown.value or "None"
					return _function(dropdown.value)
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)
				
				dropdown:Refresh(defOptions)
                dropdown:Set(defVal)
                library.pointers[pointername] = dropdown

				return dropdown
            end
			
			function LocalTab:AddMultiDropdown(text, optionz, defVal, pointername, _function, push)
				_function = _function or function() end
				
				local dropdown = {order = 0, closed = true, options = optionz, value = defVal}
				
				dropdown.content = {}
				checkRow()
				LocalTab.main.Parent = tab.row
				
				dropdown.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				dropdown.main = library:create("TextButton", {
					Position = UDim2.new(0,0,0,19),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Text = "test1",
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = dropdown.button,
				})
				
				dropdown.arrow = library:create("TextLabel", {
					Position = UDim2.new(1,0,0,2),
					Size = UDim2.new(0,-16,0,16),
					Rotation = 90,
					BackgroundTransparency = 1,
					Text = ">",
					TextColor3 = library.theme.textboxtext,
					Font = Enum.Font.Arcade,
					TextSize = 18,
					Parent = dropdown.main,
				})
				
				dropdown.container = library:create("Frame", {
					ZIndex = 15,
					Position = UDim2.new(0,0,1,3),
					BackgroundTransparency = 1,
					Visible = false,
					Parent = dropdown.main,
				})
				
				dropdown.contentholder = library:create("ScrollingFrame", {
					ZIndex = 15,
					ClipsDescendants = true,
					Size = UDim2.new(1,0,1,0),
					BackgroundTransparency = 0,
					BorderSizePixel = 1,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.outline,
					CanvasSize = UDim2.new(0,0,0,0),
					ScrollBarThickness = 0,
					Visible = true,
					Parent = dropdown.container,
				})
				
				dropdown.layout = library:create("UIListLayout", {
					Padding = UDim.new(0,0),
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = dropdown.contentholder
				})
				
				dropdown.search = library:create("TextBox", {
					ZIndex = dropdown.contentholder.ZIndex,
					LayoutOrder = dropdown.order,
					Size = UDim2.new(1,0,0,18),
					BackgroundTransparency = 0,
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Text = "",
					PlaceholderText = "Search",
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = dropdown.contentholder
				})

				self.order = self.order + 1
				
				local function addOptions(options)
					if typeof(options[1]) == "function" and typeof(options[2]) == "Instance" then
						options = options[1](options[2])
					end

					for index,value in pairs(options) do
						if typeof(value) ~= "table" then 
							value = tostring(value)
						end

						dropdown.order = dropdown.order + 1
						
						local option = library:create("TextButton", {
							ZIndex = dropdown.contentholder.ZIndex,
							LayoutOrder = dropdown.order,
							Size = UDim2.new(1,0,0,18),
							BackgroundTransparency = 0,
							BackgroundColor3 = library.theme.tabholder,
							BorderColor3 = library.theme.tabbutton,
							Text = value,
							TextColor3 = library.theme.text,
							Font = library.settings.font,
							TextSize = library.settings.textsize,
							AutoButtonColor = false,
							Parent = dropdown.contentholder,
						})

						option.MouseButton1Click:connect(function()
							if option.TextColor3 == library.theme.text then
								table.insert(dropdown.value, value)
								option.TextColor3 = library.theme.buttons
							else
								table.foreach(dropdown.value, function(i,v)
									if v == value then
										return table.remove(dropdown.value, i)
									end
								end)
								option.TextColor3 = library.theme.text
							end
							
							dropdown:Set(dropdown.value)
						end)
						
						if dropdown.order > 5 then
							dropdown.contentholder.CanvasSize = UDim2.new(0,0,0,dropdown.layout.AbsoluteContentSize.Y)
						else
							dropdown.container.Size = UDim2.new(1,0,0,dropdown.layout.AbsoluteContentSize.Y)
						end

						if table.find(dropdown.value, option.Text) then
							option.TextColor3 = library.theme.buttons
						end
						
						table.insert(dropdown.content, dropdown.order, option)
					end
				end

				addOptions(dropdown.options)

				function dropdown:Refresh(options, keep)
					if not keep then
						for _,v in pairs(dropdown.contentholder:GetChildren()) do
							if v:IsA"TextButton" then
								v:Destroy()
								dropdown.order = dropdown.order - 1
								dropdown.contentholder.CanvasSize = UDim2.new(0,0,0,dropdown.layout.AbsoluteContentSize.Y)
							end
						end
					end
					addOptions(options)
				end

				function dropdown:Search(text)
					for i,v in pairs(dropdown.content) do
						if v.Text:match(text) then
							v.Visible = true
						else
							v.Visible = false
						end
					end
				end
				
				dropdown.main.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						focusOnOption(dropdown.container)
						closeWindow(dropdown.container)
						ddcheck = dropdown
						dropdown.closed = not dropdown.closed
						dropdown.container.Visible = not dropdown.container.Visible

						if dropdown.closed then
							dropdown.arrow.Text = ">"
							dropdown.container.Visible = false
						else
							dropdown.arrow.Text = "<"
							dropdown.container.Visible = true
							dropdown:Refresh(dropdown.options)
						end
					end
				end)

				dropdown.search.FocusLost:Connect(function(input)
					dropdown:Search(dropdown.search.Text)
				end)

				function dropdown:Set(value)
					local val = {}

					for i,v in pairs(dropdown.options) do
						for i2,v2 in pairs(value) do
							if v == v2 then
								table.insert(val, v2)
							end
						end
					end
					
					dropdown.value = val
					
					-- generate string from table
					otp = ""
					
					table.foreach(dropdown.value, function(i,v)
						otp = otp..tostring(v)..", "
					end)
					
					if string.len(otp) > 25 then
						otp = tostring(otp:sub(1, 25).."...")
					end
					
					dropdown.main.Text = (otp:sub(1) == "" and "None") or (otp:sub(-2, -2) == "," and otp:sub(0, -3)) or otp
					
					return _function(dropdown.value)
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)
				
                dropdown:Set(defVal)
                library.pointers[pointername] = dropdown

				return dropdown
            end

			function LocalTab:AddSlider(text, values, pointername, _function, float, incrementalMode)
				if values[3] then
					if typeof(values[3]) == "function" then
						if _function then
							if typeof(_function) == "number" then
								incrementalMode = float
								float = _function
							elseif typeof(_function) == "boolean" then
								incrementalMode = _function
								float = nil
							end
						end
						_function = values[3]
						values[3] = 0
					else
						if float then
							if typeof(float) == "boolean" then
								incrementalMode = float
								float = nil
							end
						end
					end
                end
                
				if values[3] > values[2] then
					values[3] = values[2]
                end
                
				_function = _function or function() end
				local slider = {value = values[3]}
				checkRow()
				LocalTab.main.Parent = tab.row
				
				slider.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 22),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				slider.holder = library:create("Frame", {
					Position = UDim2.new(0,0,0,20),
					Size = UDim2.new(1,0,0,17),
					BackgroundTransparency = 1,
					Parent = slider.button,
				})
				
				slider.visualize = library:create("TextBox", {
					Position = UDim2.new(0,0,0.5,0),
					Size = UDim2.new(1,0,0.5,0),
					BackgroundTransparency = 1,
					Text = tostring(slider.value),
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize-2,
					TextWrapped = true,
					Parent = slider.holder,
				})
				
				slider.sliderbar = library:create("Frame", {
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(0.5,0,0.2,0),
					Size = UDim2.new(1,-6,0,4),
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Parent = slider.holder,
				})
				
				slider.sliderfill = library:create("Frame", {
					Size = UDim2.new(slider.value/values[2],0,1,0),
					BackgroundColor3 = library.theme.buttons,
					BorderSizePixel = 0,
					Parent = slider.sliderbar,
				})
				
				slider.sliderbox = library:create("Frame", {
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(slider.value/values[2],0,0.5,0),
					Size = UDim2.new(0,4,0,12),
					BackgroundColor3 = library.theme.main,
					BorderSizePixel = 0,
					Parent = slider.sliderbar,
				})
				
				self.order = self.order + 1
				
				local function updateValue()
					slider.value = round(slider.value*values[2], values[4]) -- float)
					if slider.value > values[2] then
						slider.value = values[2]
					end
					if slider.value < values[1] then
						slider.value = values[1]
					end
					if incrementalMode then
						slider.sliderbox.Position = UDim2.new((slider.value-values[1])/(values[2]-values[1]),0,0.5,0)
						slider.sliderfill.Size = UDim2.new((slider.value-values[1])/(values[2]-values[1]),0,1,0)
					else
						slider.sliderbox:TweenPosition(UDim2.new((slider.value-values[1])/(values[2]-values[1]),0,0.5,0), "Out", "Quint", 0.3, true)
						slider.sliderfill:TweenSize(UDim2.new((slider.value-values[1])/(values[2]-values[1]),0,1,0), "Out", "Quint", 0.3, true)
					end
					slider.visualize.Text = slider.value..values[5]
					_function(slider.value, false)
				end
				
				local function updateSlider(input)
					local relativePos = input.Position.X- slider.sliderbar.AbsolutePosition.X
					if input.Position.X < slider.sliderbar.AbsolutePosition.X then
						relativePos = 0
					end
					if relativePos > slider.sliderbar.AbsoluteSize.X then
						relativePos = slider.sliderbar.AbsoluteSize.X
					end
					slider.value = relativePos/slider.sliderbar.AbsoluteSize.X
					updateValue()
				end
				
				local sliding
				local modifying
				
				slider.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						sliding = true
						updateSlider(input)
					end
				end)

				slider.visualize.FocusLost:connect(function()
					slider.value = (tonumber(slider.visualize.Text) or 0) / values[2]
					updateValue()
					_function(slider.value, true)
				end)
				
				slider.button.InputEnded:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						sliding = false
						_function(slider.value, true)
					end
				end)
				
				UserInputService.InputChanged:connect(function(input)
					if modifying then
						if input == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Space then
							slider.visualize:ReleaseFocus()
						end
					end
					if input.UserInputType == Enum.UserInputType.MouseMovement then
						if sliding then
							updateSlider(input)
						end
					end
				end)
				
				function slider:Set(num)
					slider.value = num/values[2]
					updateValue()
				end
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+18)
				
                slider:Set(values[3])
                library.pointers[pointername] = slider
				
				return slider
			end
			
			function LocalTab:AddKeybind(text, key, pointername, _function)
				_function = _function or function() end
				local bind = {binding = false, holding = false, value = key}
				local bindname = ""

				if key ~= nil then
					bindname = bind.value.Name
				else
					bindname = "None"
					key = nil
				end

				local bounds = game:GetService('TextService'):GetTextSize(bindname, library.settings.textsize, library.settings.font, Vector2.new(math.huge, math.huge))

				checkRow()

				LocalTab.main.Parent = tab.row
				
				bind.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 4),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutoButtonColor = false,
					Parent = self.content,
				})
				
				bind.label = library:create("TextLabel", {
					Position = UDim2.new(1,0,0,2),
					Size = UDim2.new(0,-bounds.X-8,1,-4),
					BackgroundTransparency = 1, -- aeaeaeae
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.main,
					Text = bindname,
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					Parent = bind.button,
				})
				
				self.order = self.order + 1
				
				bind.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						bind.label.Text = "..."
						bind.label.Size = UDim2.new(0,-bind.label.TextBounds.X-8,1,-4)
					end
				end)
				
				bind.button.InputEnded:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						if bind.value ~= nil then
							bind:Set(nil)
						else
							bind.binding = true
						end
					end
                end)
                
                function bind:Set(key)
                    if not key then
						bind.value = nil
						bind.label.Text = tostring("[ ".."None".." ]")
						bind.label.Size = UDim2.new(0,-bind.label.TextBounds.X-8,1,-4)
                    else
						if key.Name:sub(1,11) == "MouseButton" then
							bind.label.Text = tostring("[ ".."MB"..key.Name:sub(12).." ]")
						else
							bind.label.Text = tostring("[ "..key.Name.." ]")
						end
						bind.value = key
						bind.label.Size = UDim2.new(0,-bind.label.TextBounds.X-8,1,-4)
					end
				end
				
				local a = tick()

				UserInputService.InputBegan:connect(function(input)
					if bind.binding then
						if table.find({Enum.KeyCode.Backspace, Enum.KeyCode.Escape}, input.KeyCode) then
							bind:Set(nil)
							bind.binding = false
						elseif input.KeyCode and input.KeyCode ~= Enum.KeyCode.Unknown then
							bind:Set(input.KeyCode)
							bind.binding = false
						elseif input.UserInputType and table.find({Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3}, input.UserInputType) then
							bind:Set(input.UserInputType)
							bind.binding = false
						end
					elseif input.KeyCode == bind.value or input.UserInputType == bind.value then
						_function(true)
					end
				end)

				UserInputService.InputEnded:connect(function(input)
					if input.KeyCode.Name == bindname then
						bind.holding = false
					end
					if input.UserInputType.Name == bindname then
						bind.holding = false
					end
					if not bind.binding and input.KeyCode == bind.value or input.UserInputType == bind.value then
						_function(false)
					end
				end)
				
                LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
                
                bind:Set(key)
                library.pointers[pointername] = bind

				return bind
			end
			
			function LocalTab:AddColorPicker(text, color3, pointername, _function)
				_function = _function or function() end
				
				local color = {value = color3}

				checkRow()

				LocalTab.main.Parent = tab.row
					
				color.button = library:create("TextButton", {
					LayoutOrder = self.order,
					Size = UDim2.new(1,0,0,library.settings.textsize + 2),
					BackgroundTransparency = 1,
					Text = tostring(text),
					TextColor3 = library.theme.text,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					Parent = self.content,
				})
				
				color.visualize = library:create("ImageLabel", {
					Position = UDim2.new(1,-3,0,3),
					Size = UDim2.new(0,-22,0,10),
					BorderSizePixel = 2,
					BorderColor3 = library.theme.main,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0,8,0,8),
					Name = "ColorVisualize",
					Parent = color.button
				})
				
				color.colorpicker = library:create("TextButton", {
					ZIndex = 165,
					Position = UDim2.new(0,20,0,20),
					Size = UDim2.new(0,200,0,220),
					BackgroundColor3 = library.theme.tabholder,
					BorderColor3 = library.theme.outline,
					AutoButtonColor = false,
					Visible = false,
					Parent = color.button
				})
				
				color.hueselector = library:create("ImageLabel", {
					ZIndex = 165,
					Position = UDim2.new(0,5,0,5),
					Size = UDim2.new(0,170,0,170),
					Image = "http://www.roblox.com/asset/?id=4155801252",
					BackgroundColor3 = Color3.new(1,0,0),
					BorderColor3 = library.theme.outline,
					Parent = color.colorpicker
				})
				
				color.hueselectorpointer = library:create("Frame", {
					ZIndex = 165,
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(0.5,0,0,0),
					Size = UDim2.new(0,6,0,6),
					Parent = color.rgbselector
				})
				
				color.colorselector = library:create("TextLabel", {
					ZIndex = 165,
					Position = UDim2.new(0,181,0,5),
					Size = UDim2.new(0,14,0,170),
					BackgroundColor3 = Color3.fromRGB(200,200,200),
					BorderColor3 = library.theme.outline,
					Text = "",
					Parent = color.colorpicker
				})
				
				color.colorselectorgradient = library:create("UIGradient", {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),
						ColorSequenceKeypoint.new(0.25,Color3.new(1,1,0)),
						ColorSequenceKeypoint.new(0.5,Color3.new(0,1,1)),
						ColorSequenceKeypoint.new(0.75,Color3.new(1,0,1)),
						ColorSequenceKeypoint.new(1,Color3.new(1,0,0))
					}),
					Enabled = true,
					Rotation = 90,
					Parent = color.colorselector
				})
				
				color.colorselectorpointer = library:create("Frame", {
					ZIndex = 165,
					AnchorPoint = Vector2.new(0.5,0.5),
					Position = UDim2.new(0.5,0,0,0),
					Size = UDim2.new(1,0,0,3),
					Parent = color.colorselector
				})
				
				color.rgbselector = library:create("TextBox", {
					ZIndex = 165,
					Position = UDim2.new(0,5,0,180),
					Size = UDim2.new(0,170,0,14),
					BackgroundColor3 = library.theme.main,
					BorderColor3 = library.theme.outline,
					Text = "",
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Center,
					Parent = color.colorpicker
				})
				
				color.hexselector = library:create("TextBox", {
					ZIndex = 165,
					Position = UDim2.new(0,5,0,200),
					Size = UDim2.new(0,170,0,14),
					BackgroundColor3 = library.theme.main,
					BorderColor3 = library.theme.outline,
					Text = "",
					TextColor3 = library.theme.text,
					Font = library.settings.font,
					TextSize = library.settings.textsize,
					TextStrokeTransparency = library.settings.textstroke and 0 or 1,
					TextXAlignment = Enum.TextXAlignment.Center,
					Parent = color.colorpicker
				})
				
				color.rgbcopy = library:create("ImageLabel", {
					ZIndex = 165,
					Position = UDim2.new(0,181,0,180),
					Size = UDim2.new(0,14,0,14),
					BackgroundColor3 = library.theme.main,
					BorderColor3 = library.theme.outline,
					Image = "http://www.roblox.com/asset/?id=3021120430",
					Parent = color.colorpicker
				})
				
				color.hexcopy = library:create("ImageLabel", {
					ZIndex = 165,
					Position = UDim2.new(0,181,0,200),
					Size = UDim2.new(0,14,0,14),
					BackgroundColor3 = library.theme.main,
					BorderColor3 = library.theme.outline,
					Image = "http://www.roblox.com/asset/?id=3021120430",
					Parent = color.colorpicker
				})
				
				color.button.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						function isinregion(point, pos, size)
							if point.X > pos.X and point.X < pos.X  + size.X and point.Y > pos.Y and point.Y < pos.Y + size.Y then
								return true
							end
							return false
						end
						
						focusOnOption(color.colorpicker)
						closeWindow(color.colorpicker)
						color.colorpicker.Visible = not color.colorpicker.Visible
					end
				end)
				
				color.colorselector.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						cselheld = true
						listeneer = input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								cselheld = false
								listeneer:Disconnect()
							end
						end)
						
						repeat 
							wait()
							
							local mouse = game:GetService("Players").LocalPlayer:GetMouse()
							local obj = color.hueselector
							local pos = (mouse.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y
							pos = (pos < 0 and 0) or (pos > 1 and 1) or pos
							colorval = pos
							color.colorselectorpointer.Position = UDim2.new(0.5,0,pos,0)
							color.hueselector.BackgroundColor3 = Color3.fromHSV(pos, 1, 1)
						until cselheld == false

						--return _function(color.value)
					end
				end)
				
				color.hueselector.InputBegan:connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						chueheld = true
						listeneer = input.Changed:connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								chueheld = false
								listeneer:Disconnect()
							end
						end)
						
						repeat 
							wait()
							
							local mouse = game:GetService("Players").LocalPlayer:GetMouse()
							local obj = color.hueselector
							local x = (mouse.X-obj.AbsolutePosition.X)/obj.AbsoluteSize.X
							local y = (mouse.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y

							color.hueselectorpointer.Position = UDim2.new(x,0,y,0)
							
							new = Color3.fromHSV(colorval, x, 1-y)

							color:Set(new)
						until chueheld == false
					end
				end)
				
				local function hex2rgb(hex)
					return Color3.fromRGB(tonumber("0x"..hex:sub(2,3)),tonumber("0x"..hex:sub(4,5)),tonumber("0x"..hex:sub(6,7)))
				end
				
				local function rgb2hex(rgb)
					return string.format("#%02X%02X%02X", rgb.r*255, rgb.g*255, rgb.b*255)
				end
				
				function color:Set(newColor)
					newColor = Color3.new(math.clamp(newColor.r, 0, 1), math.clamp(newColor.g, 0, 1), math.clamp(newColor.b, 0, 1))

					color.value = newColor
					color.visualize.BackgroundColor3 = newColor
					color.rgbselector.Text = tostring(math.floor(newColor.r*255)..", "..math.floor(newColor.g*255)..", "..math.floor(newColor.b*255))
					color.hexselector.Text = rgb2hex(newColor)
					_function(newColor)
				end
				
				color.rgbselector.FocusLost:Connect(function()
					new = color.rgbselector.Text:gsub(" ","")
					new = string.split(new, ",")
					table.foreach(new, function(a,b)
						b = tonumber(b)
						if b < 0 then
							new[a] = 0
						elseif b > 255 then
							new[a] = 255
						else
							new[a] = b
						end
					end)
					color:Set(Color3.fromRGB(new[1], new[2], new[3]))
				end)
				
				color.hexselector.FocusLost:Connect(function()
					new = color.hexselector.Text:gsub(" ","")
					color:Set(hex2rgb(new))
				end)
				
				LocalTab.main.Size = UDim2.new(1,0,0,self.layout.AbsoluteContentSize.Y+16)
					
				color:Set(color3)
				library.pointers[pointername] = color
					
				return color
			end
			
			return LocalTab
		end
		
		return tab
	end

	return window
end
--[[
game:GetService("UserInputService").InputChanged:connect(function(input)
	pcall(function()
	local MousePosition = UserInputService:GetMouseLocation()
	
    if input.UserInputType == Enum.UserInputType.MouseMovement then
		if library.base.Window.Visible == true and library.pointers.SettingsPointerEnabled.value == true then
			library.pointer.Visible = true
			library.pointer.Position = UDim2.new(0, MousePosition.X, 0, MousePosition.Y - 36)
		else
			library.pointer.Visible = false
        end
	end
	end)
end)
--]]
local function GetConfigs()
	cfgs = {}
	for i,v in pairs(syn_io_listdir("hexhub")) do
		if v:sub(-10) == ".hexhubcfg" then
			table.insert(cfgs, string.split(v, ".")[1]:sub(8))
		end
	end
	return cfgs
end

return library
