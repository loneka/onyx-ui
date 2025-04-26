---
sidebar_position: 3
---

# Styling

Styling props are globally supported props for styling UI. These aim to stay close to Roblox's way of doing things, but differ when necessary.

# Property-based styling

Traditional properties like `BackgroundColor3` are supported identically to how Roblox does it. Use these as you would normally. There are exceptions however, like how `Color` is preferred over `BackgroundColor3` in [`Button`](/api/Button).

# Children-based styling

`UIPadding`s, `UIStroke`s, `UIListLayout`s... Children-based styling is just too much mess. In OnyxUI, all components support an extensive set of props to *avoid* working with these objects, so you can write code faster!

:::tip
  Most of the below also support `Enabled` for easily enabling/disabling their effects.
:::

## Cosmetic

### Corner Radius

```lua
Corner = {
  Radius = UDim.new(0, 4)
}
```

### Stroke

```lua
Stroke = {
  Color = Color3.fromRGB(255, 255, 255),
  Thickness = 2,
  Transparency = 0,
  ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
  LineJoinMode = Enum.LineJoinMode.Round,
}
```

Stroke with gradient:

```lua
Stroke = {
  Color = Color3.fromRGB(255, 255, 255),
  Gradient = {
    Color = ColorSequence.new()
  }
}
```

### Gradient

```lua
Gradient = {
  Color = ColorSequence.new(),
  Rotation = 90,
  Offset = 0,
  Transparency = 0,
}
```

## Layout

### Padding

Equal-sided padding:

```lua
Padding = {
  Padding = UDim.new(0, 4),
}
```

Individual padding:

```lua
Padding = {
  Top = UDim.new(0, 4),
  Left = UDim.new(0, 8),
  Right = UDim.new(0, 8),
  Bottom = UDim.new(0, 4),
}
```

### Flex

Fill the parent container:

```lua
Flex = {
  Mode = Enum.FlexMode.Fill,
}
```

Grow with a custom ratio, center-aligned:

```lua
Flex = {
  Mode = Enum.FlexMode.Grow,
  ItemLineAlignment = Enum.ItemLineAlignment.Center,
  GrowRatio = 1,
  ShrinkRatio = 0,
}
```

### List

Vertical list:

```lua
List = {
  FillDirection = Enum.FillDirection.Vertical,
  HorizontalFlex = Enum.UIFlexAlignment.Fill,
  Padding = UDim.new(0, 8),
}
```

Horizontal-filled, vertically-wrapping, centered list:

```lua
List = {
  FillDirection = Enum.FillDirection.Horizontal,
  HorizontalAlignment = Enum.HorizontalAlignment.Center,
  VerticalAlignment = Enum.VerticalAlignment.Center,
  Padding = UDim.new(0, 8),
  Wraps = true,
}
```

### Grid

Horizontally-filled grid:

```lua
Grid = {
  FillDirection = Enum.FillDirection.Horizontal,
  CellSize = UDim2.fromOffset(100, 100),
  CellPadding = UDim2.fromOffset(20, 20),
}
```

### Others

Other layouts like `UITableLayout` and `UIPageLayout` are generally inferior and unused. For API reference, see the [`Base`](/api/Base) component's source code.

## Constraints

### Aspect ratio

Square-locked size:

```lua
AspectRatio = {
  Ratio = 1,
}
```

Growing with parent:

```lua
Aspect = {
  Ratio = 1,
  Type = Enum.AspectType.ScaleWithParentSize,
  DominantAxis = Enum.DominantAxis.Height,
}
```

### Scale

Scaled by 2x:

```lua
Scale = {
  Scale = 2,
}
```

### Size constraint

Smaller than 100x 100y:

```lua
MaxSize = Vector2.new(100, 100),
MinSize = Vector2.new(0, 0),
```

No constraint:

```lua
MaxSize = Vector2.new(math.huge, math.huge),
MinSize = Vector2.new(0, 0),
```

### Text size constraint

Bigger than 12, smaller than 24:

```lua
MaxTextSize = 24,
MinTextSize = 12,
```

# Using in custom components

To support styling props in your own components, make use of the [`CombineProps`](/docs/utilities#combineprops) utility to pass props through automatically. Your component must be based upon an OnyxUI component such as [`Base`](/api/Base) for this to work.