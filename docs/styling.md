---
sidebar_position: 2
---

# Styling

Styling props are globally supported props for styling UI. These aim to stay close to Roblox's way of doing things, but differ when necessary.

## Traditional styling

Traditional properties like `BackgroundColor3` are supported identically to how Roblox does it. Use these as you would normally. There are exceptions however, like how `Color` is preferred over `BackgroundColor3` in [`Button`](/api/Button).

## Children-based styling

`UIPadding`s, `UIStroke`s, `UIListLayout`s... Children-based styling is just too much mess. In OnyxUI, all components support an extensive set of props to *avoid* working with these objects, while offering their benefits.

:::tip
  The styles below also support `Enabled` for easily enabling/disabling their effects.
:::

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
  Transparency = 0,
  Offset = 0,
}
```

### Padding

Equal-sided padding:

```lua
Padding = {
  All = UDim.new(0, 4),
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
  GrowRatio = 1,
  ShrinkRatio = 0,
  ItemLineAlignment = Enum.ItemLineAlignment.Center,
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

### Other Layouts

Other layouts like `UITableLayout` and `UIPageLayout` are generally inferior and unused. For API reference, see the [`Base`](/api/Base) component's source code.

### Aspect ratio

Square-locked size:

```lua
Aspect = {
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

### Size limit

Smaller than 100x 100y:

```lua
SizeLimit = {
  Max = Vector2.new(100, 100),
  Min = Vector2.new(0, 0),
}
```

### Text size limit

Smaller than 24, bigger than 12:

```lua
TextSizeLimit = {
  Max = 24,
  Min = 12,
}
```

## Using in custom components

To support styling props in your own components, make use of the [`CombineProps`](/docs/utilities#combineprops) utility to pass props through automatically. Your component must be based upon an OnyxUI component such as [`Base`](/api/Base) for this to work.