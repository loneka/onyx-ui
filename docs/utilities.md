---
sidebar_position: 4
---

# Utilities

## [Fallback](/api/Util#Fallback)

Guarantee your props to fall back on a default value.

```lua
local Color = OnyxUI.Util.Fallback(Props.Color, Theme.Colors.Neutral.Main)
```

## [CombineProps](/api/Util#CombineProps)

Automatically support every single OnyxUI property available, right in your custom component. `Size`, `Position`, `Padding`, etc. Every. single. one.

```lua
return function(Props)
  local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components)
  local Theme = Themer.Theme:now()

  return Scope:BaseButton(OnyxUI.Util.CombineProps(Props, {
    BackgroundTransparency = 0,
    Corner = {
      Radius = Computed(function(Use)
        return UDim.new(0, Use(Theme.CornerRadius["1"]))
      end),
    },

    -- All properties from OnyxUI's `BaseButton` component will now work.
  }))
end
```

## [EnsureValue](/api/Util#EnsureValue)

Want to ensure your component props are Fusion `Value`s? This makes it a one-line operation.

```lua
return function(Props)
  local Scope = Fusion.innerScope(Scope, OnyxUI.Util)

  local MyProp = Scope:Fallback(Props.MyProp, "Default")
end
```
## [Colors](/api/Util#Colors)

Color shorthands imported from [TailwindCSS's color palette](https://tailwindcss.com/docs/customizing-colors#default-color-palette). So you don't have to worry about color picking anymore.

```lua
return function(Props)
  return Scope:Button {
    Color = OnyxUI.Util.Colors.Red["500"], -- Shade "500" of Colors.Red
  }
end
```