local HawkLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Cxh4n/PenciZornoHUB/refs/heads/main/Assets/UILib.lua"))()
-- The library requires this key to be set.
_HawkKey = "pencizurnabayilirim"

local Hawk = HawkLib -- Assuming HawkLib is loaded and assigned to Hawk

-- 1. Hawk:Window(options)
-- Creates the main UI window.
local Window = Hawk:Window({
	ScriptName = "Hawk Lib",
	DestroyIfExists = true, -- if false, gui wont disappear
	Theme = "Rise" -- Themes: "Hawk", "Rise"
})

-- 2. Window:ToggleUI()
-- Toggles the visibility of the entire UI. Can be called from the Window object.
-- Example:
-- game:GetService("UserInputService").InputBegan:Connect(function(input)
--     if input.KeyCode == Enum.KeyCode.RightShift then
--         Window:ToggleUI()
--     end
-- end)

-- 3. Window:Destroy()
-- Completely removes the UI. Can be called from the Window object.

-- 4. Window:Minimize(options)
-- Adds a minimize button to the title bar.
Window:Minimize({
	visibility = true, -- if false, close button will disappear
	OpenButton = true, -- Creates a small button to restore the UI when minimized.
	Callback = function()
		print("UI Minimized")
	end,
})

-- 5. Window:Close(options)
-- Adds a close button to the title bar.
Window:Close({
	visibility = true, -- if false, close button will disappear
	Callback = function()
		print("Close button clicked. Destroying UI.")
		Window:Destroy() -- Destroying Gui Function
	end,
})

-- 6. Window:Tab(tabName, pageTitle)
-- Creates a new tab and a corresponding page.
local mainTab = Window:Tab("Example Tab", "Example Page Title")
HawkLib:NewConfig("Rise")
if isfile("RiseSettings.json") then
	HawkLib:LoadConfig()
end

------------------------------------------------------
-- Main Controls Tab
------------------------------------------------------

-- 7. Tab:Section(title)
-- Adds a titled separator to organize elements within a tab.
mainTab:Section("Core Actions")

-- 8. Tab:Button(title, description, callback)
-- Creates a clickable button.
local myButton = mainTab:Button("My Button", "This is a button.", function()
	print("Button clicked!")
end)
-- 8a. button:UpdateButton(newTitle, newDescription, newCallback)
myButton:UpdateButton("Updated Button", "Description changed.", function()
	print("Updated button clicked!")
end)

-- 9. Tab:Toggle(title, description, defaultState, callback)
-- Creates an on/off switch.
local myToggle = mainTab:Toggle("My Toggle", "Enable or disable a feature.", false, function(state)
	print("Toggle state is now: " .. tostring(state))
end)
-- 9a. toggle:UpdateToggle(newState)
-- Programmatically sets the state of the toggle.


local myToggle = mainTab:CheckBox("My Checkbox", false, function(state)
	print("Toggle state is now: " .. tostring(state))
end)

-- 10. Tab:KeyBind(title, description, defaultKey, callback)
-- Creates a keybind selector. The callback is triggered when the bound key is pressed.
mainTab:KeyBind("Toggle UI", "Press this key to toggle the UI.", "End", function()
	Window:ToggleUI()
end)

mainTab:Section("Informational")

-- 11. Tab:Label(title, description)
-- Displays non-interactive text.
local myLabel = mainTab:Label("Status", "Everything is OK.")
-- 11a. label:UpdateLabel(newTitle, newDescription)
myLabel:UpdateLabel("New Status", "Everything is great!")

-- 12. Tab:Paragraph(title, linesTable)
-- Displays a multi-line block of text.
mainTab:Paragraph("Info", {"Line 1 of information.", "Line 2 of information."})

-- 13. Tab:Line()
-- Adds a horizontal separating line.
mainTab:Line()

-- 14. Tab:TextBox(options)
-- Creates a text input field.
mainTab:TextBox({
	Title = "Input Field",
	Description = "Enter some text here.",
	PlaceHolderText = "Your text...",
	DisableReset = true, -- If true, text isn't cleared on focus.
	Callback = function(text)
		print("TextBox submitted: " .. text)
	end
})

------------------------------------------------------
-- Visuals Tab
------------------------------------------------------

mainTab:Section("Value Selectors")

-- 15. Tab:Slider(title, description, minValue, maxValue, callback)
-- Creates a slider to select a number in a range.
local mySlider = mainTab:Slider("Intensity", "Adjust the intensity.", 0, 100, function(value)
	print("Slider value: " .. value)
end)
-- 15a. slider:GetValue()
print("Initial slider value: " .. tostring(mySlider:GetValue()))
-- 15b. slider:SetValue(newValue)
-- 15c. slider:SetColor(colorOptions)
-- Customizes the slider's colors.
mySlider:SetColor({
	SliderPrimer = {FirstColor = Color3.fromRGB(189,189,189), SecondColor = Color3.fromRGB(70,70,70)},
	SliderSeconder = {FirstColor = Color3.fromRGB(61,61,61), SecondColor = Color3.fromRGB(36,36,36)}
})

-- 16. Tab:ColorPicker(title, description, defaultColor, callback)
-- Creates a color selection tool.
local myColorPicker = mainTab:ColorPicker("Highlight Color", "Select a highlight color.", Color3.fromRGB(255, 0, 0), function(color)
	print("Color changed to: ", color)
end)
-- 16a. colorPicker:SetColor(newColor)


mainTab:Section("Media Elements")

-- 17. Tab:Image(options)
-- Displays an image or video.
mainTab:Image({
	Title = "Shadow",
	MiniTitle = "Shawde",
	FileName = "ap.png",
	CheckFile = false,
	ImageLink = "https://risehub.fun/assets/Rise.png",
	ImageColor = Color3.fromRGB(255, 255, 255),
	Description = {"Naber","Hahza","oamahgd"},
	StrokeColor = Color3.fromRGB(85, 255, 0),
	Volume = 1,
	WriteInto = "Rise",
	Type = "Image"
})

-- 18. Tab:Video(options)
-- Displays a video. (Similar to Image but may have different internal handling)
mainTab:Video({
	VideoTitle = "Trxdent ve Hanki",
	VideoDescription = "Derdine derman spiderman",
	VideoLink = "https://images-ext-1.discordapp.net/external/c-uWyr5tJDAGz8FY5vmz6bpUQtiXK6HeSrdU59SXPCE/https/i.imgur.com/nVHti29.mp4", -- webm links or rbxassetid ids only
	VideoVolume = 0,
	WriteInto = "Hawk",
	FileName = "ahah.mp4"
})

------------------------------------------------------
-- Misc Tab
------------------------------------------------------

mainTab:Section("List Management")

-- 19. Tab:Dropdown(options)
-- Creates a dropdown menu.
local myDropdown = mainTab:Dropdown({
	Title = "My Dropdown",
	Description = "Select one or more items.",
	List = {"Option 1", "Option 2", "Option 3"},
	MultiOption = true,
	Callback = function(option, isSelected)
		print(option .. " selected state: " .. tostring(isSelected))
	end
})

-- 19a. dropdown:Add(itemName, isSelected, callback)
-- Adds a new item to the dropdown.
myDropdown:Add("Option 4", false, function(option, isSelected)
	print(option .. " (new) selected state: " .. tostring(isSelected))
end)

-- 19b. dropdown:Remove(itemName)
-- Removes an item from the dropdown.
myDropdown:Remove("Option 2")


myDropdown:Refresh({
	MultiOption = true,
	NewList = {"Refreshed A", "Refreshed B"}
})

-- 19c. dropdown:Clear()
-- Removes all items from the dropdown.
-- myDropdown:Clear() -- Uncomment to test

-- 19d. dropdown:Refresh(options)
-- Clears the dropdown and repopulates it with a new list.


local Settings = Window:Tab("Settings","SettingsPage")
Settings:Section("Config System")

local tbox = Settings:TextBox({
	Title = "Write Config Name",
	Description = "Enter some text here.",
	PlaceHolderText = "Your text...",
	DisableReset = true, -- If true, text isn't cleared on focus.
	Callback = function(text)
		print("TextBox submitted: " .. text)
	end
})

Settings:Button("Save Config", "Save the current settings.", function()
	HawkLib:SaveConfig()
end)


------------------------------------------------------
-- Notifications (Global)
------------------------------------------------------

-- 20. Hawk:AddNotifications()
-- Creates a notification manager. This is a global object, not tied to a tab.
local Notifications = Hawk:AddNotifications()

-- 21. notifications:Notification(options)
-- Shows a notification that automatically disappears.
Notifications:Notification({
	Title = "Auto-Dismiss",
	Description = "This notification will go away on its own.",
	Selection = "Done", -- Icon type
	Animated = true,
	Cooldown = 5 -- Seconds before it disappears
})

-- 22. notifications:Notify(options)
-- Shows a notification with a button that requires user interaction.
Notifications:Notify({
	Title = "Action Required",
	Description = "Click the button to proceed.",
	Selection = "Done", -- Icon type
	Animated = true,
	Callback = function()
		print("Notification button clicked!")
	end
})

print("HawkLib full example script loaded.")