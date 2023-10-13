
<div align="center">
<picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://cdn.discordapp.com/attachments/810891979147313184/1162401965360283659/261_20231013204925.png?ex=653bce30&is=65295930&hm=9179356949da535b8b437f0882d297b5908f6cf945cd62191ea693725fb926d4&">
    <source media="(prefers-color-scheme: light)" srcset="https://cdn.discordapp.com/attachments/810891979147313184/1162401954228617246/261_20231013204918.png?ex=653bce2e&is=6529592e&hm=eeb08728abc67238e59845fcf01adec154f4350841ea779e514504339564d997&">
    <img width="150px" src="https://cdn.discordapp.com/attachments/810891979147313184/1162401965360283659/261_20231013204925.png?ex=653bce30&is=65295930&hm=9179356949da535b8b437f0882d297b5908f6cf945cd62191ea693725fb926d4&">
    Void - UI Library
</picture>
</div>

<div align="center">
<img width="80%" src="https://cdn.discordapp.com/attachments/810891979147313184/1162399036200980520/Screenshot_2023-10-13-19-50-12-756_com.roblox.client.png?ex=653bcb76&is=65295676&hm=8a1135c496b8f550fbd90b3b6521a0bca54eb56b5901c733ac432e30023ed94f&" alt="Image">
</div>

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
local Toggle = Tab:CreateToggle({ 
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
local Slider = Yab:CreateSlider({ 
    Title = "Slider", 
    Min = 0, 
    Max = 200, 
    Callback = function(s)
        print(s)
    end
})
```