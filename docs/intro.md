---
sidebar_position: 1
---

# Getting Started

## Installation

### Wally package

1. Copy the [Wally details](https://wally.run/package/imavafe/onyx-ui)
2. Paste it into your `wally.toml` dependencies
3. Run `wally install`

### Roblox model

:::warning Important
When using the `rbxm`, you must require the copy of Fusion bundled within it, rather than your own install. Or alternatively, switch to Wally to avoid this altogether.
:::

1. Download the `OnyxUI.rbxm` file [listed here](https://github.com/ImAvafe/OnyxUI/releases/latest)
2. Insert `OnyxUI.rbxm` into Roblox Studio

## Usage Example

Here's a basic component example, making use of some of OnyxUI's features.

```lua
local OnyxUI = require(path.to.OnyxUI)
local Fusion = require(path.to.Fusion)

return function(Scope: Fusion.Scope<any>, Props)
	local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components)
	local Theme = OnyxUI.Themer.Theme:now()

	return Scope:Button {
		Content = { "Press me!" },
		Color = Theme.Colors.Primary.Main,
		SizeVariant = "Large",
	}
end
```

## [See it in action ✨](in-production.md)
