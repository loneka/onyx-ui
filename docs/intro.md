---
sidebar_position: 1
---

# Getting Started

:::info
  OnyxUI is premature software, relying on the premature software Fusion. If that doesn't deter you, get ready to enjoy how easy UI can be. ✨
:::

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

local Themer = OnyxUI.Themer
local InnerScope = Fusion.innerScope
local Util = OnyxUI.Util

return function(Scope: Fusion.Scope<any>, Props)
	local Scope = InnerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components)
	local Theme = Themer.Theme:now()

	return Scope:Card {
		BackgroundColor3 = Util.Colors.Gray["200"],
		Padding = Scope:Computed(function(Use)
			return UDim.new(0, Use(Theme.Spacing["2"]))
		end),
	}
end
```

## [See it in action ✨](in-production.md)
