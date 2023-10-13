# 🎱 - Void-UI-Library

### ✨ - Features:
> - Tab's
> - Label
> - Paragraph
> - Button
> - Toggle
> - Slider

## 📃 - Documentation:

### 📥 - Loadstring:

```lua
local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlikSusFootages/Void-UI-Library/main/src/file.lua"))()
```

### 🖼️ - Creating Window

```lua
local Window = UI:CreateWindow({
    Name = "UI Library"
}) 
```

### 📁 - Creating Tab:

```lua
-- icons: "https://gitlab.com/koterahq/luciderblx/plugin/-/raw/main/src/modules/Assets.lua?ref_type=heads"

local Tab = Window:CreateTab({ 
    Title = "Tab 1", 
    Icon = "monitor" 
}) 
```

### 💬 - Creating Label

```lua
local Label = Tab:CreateLabel({ 
    Title = "Label" 
})
```

### 📖 - Creating Paragraph

```lua
local Paragraph = Tab:CreateParagraph({ 
    Title = "Paragraph", 
    Content = "Paragraph Content" 
})
```

### 🖱️ - Creating Button 

```lua
local Button = Tab:CreateButton({ 
    Title = "Button", 
    Callback = function()
        print("Button Clicked!")
    end 
})
```

### 🕹️ - Creating Toggle

```lua
local toggle = tab:CreateToggle({ 
    Title = "Toggle", 
    Callback = function(state)
        if state then
            print("True")
        else
            print("False")
        end
    end
})
```

### 📍 - Creating Slider

```lua
local slider = tab:CreateSlider({ 
    Title = "Slider", 
    Min = 0, 
    Max = 200, 
    Callback = function(s)
        print(s)
    end
})
```