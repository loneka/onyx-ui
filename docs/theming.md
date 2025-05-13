---
sidebar_position: 3
---

# Theming

[`Themer`](/api/Themer) allows you to customize components throughout OnyxUI, with support for properties like color, corner radius, padding, etc. You should also reference it within your own components for a more consistent design.

[More examples ➜](/docs/examples)

![Theming](/theming.png)

## Accessing the theme

A card making use of the theme for color, stroke and padding:

```lua
local Theme = OnyxUI.Themer.Theme:now()

Scope:Card {
  BackgroundColor3 = Theme.Colors.Neutral.Main,
  Stroke = {
    Thickness = Theme.StrokeThickness["2"],
  },
  Padding = {
    All = Scope:UDim(0, Theme.Spacing["2"])
  }
}
```

## Making your own theme

:::tip
Check out [ThemeSpec.luau](https://github.com/ImAvafe/OnyxUI/blob/main/src/Themer/ThemeSpec.luau) for a full reference of available theme properties. The default OnyxUI theme can also [be found here](https://github.com/ImAvafe/OnyxUI/blob/main/src/Themer/ThemeSpec.luau).
:::

1. Copy the following code into a new "`MyTheme`" module
```lua
local Themer = OnyxUI.Themer


local Scope = Fusion.scoped()

local MyTheme = Themer.NewTheme(Scope, {
  -- Specify theme properties here
})

return MyTheme
```
2. Specify the properties you want
3. Use it when constructing your UI
```lua
local MyTheme = require(path.to.MyTheme)

local Themer = OnyxUI.Themer

Themer.Theme:is(MyTheme):during(function()
  local Theme = Themer.Theme:now() -- This now returns MyTheme!
  -- Any UI constructed from this callback will also use MyTheme.
end)
```