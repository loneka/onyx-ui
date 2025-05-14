---
sidebar_position: 5
---

# Utilities

## [Fallback](/api/Util#Fallback)

Guarantee your props to fall back on a default value.

```lua
return function(Props)
  local Color = OnyxUI.Util.Fallback(Props.Color, Theme.Colors.Neutral.Main)
end
```

## [CombineProps](/api/Util#CombineProps)

Automatically support every single OnyxUI property available, right in your custom component. `Size`, `Position`, `Padding`, etc. Every. single. one.

```lua
return function(Scope, Props)
  local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components)
  local Theme = Themer.Theme:now()

  return Scope:BaseButton(OnyxUI.Util.CombineProps(Props, {
    BackgroundTransparency = 0,
    Corner = {
      Radius = Scope:UDim(0, Theme.CornerRadius["2"]),
    },

    -- All properties from OnyxUI's `BaseButton` component will now work.
  }))
end
```

## [EnsureValue](/api/Util#EnsureValue)

Want to ensure your component props are Fusion `Value`s? This makes it a one-line operation.

```lua
return function(Scope, Props)
  local Scope = Fusion.innerScope(Scope, OnyxUI.Util)

  local MyProp = Scope:EnsureValue(Props.MyProp)
end
```

## [Colors](/api/Util#Colors)

Color shorthands imported from [TailwindCSS's color palette](https://tailwindcss.com/docs/customizing-colors#default-color-palette). So you don't have to worry about color picking anymore.

```lua
Scope:Button {
  Color = OnyxUI.Util.Colors.Red["500"], -- Shade "500" of Colors.Red
}
```

## [Units](/api/Util#UDim)

Compute reactive units with less code.

```lua
return function(Scope, Props)
  local Scope = Fusion.innerScope(Fusion, OnyxUI.Util)
  local Theme = Themer.Theme:now()

  Scope:Card {
    Padding = {
      All = Scope:UDim(0, Theme.Padding["2"])
    }
  }
end
```
