---
sidebar_position: 1
---

# Getting Started

![Kitty Banner](/kittyBanner.png)

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

## Previewing

Preview and interact with OnyxUI components live:

1. Open a place with OnyxUI installed
2. Install the [UI Labs](https://create.roblox.com/store/asset/14293316215/UI-Labs) Studio plugin
3. Open UI Labs
4. Open the OnyxUI story, and select a component

## Usage example

Here's a basic text button component example, making use of some of OnyxUI's features:

```lua
local OnyxUI = require(path.to.OnyxUI)
local Fusion = require(path.to.Fusion)

export type TextButtonProps = OnyxUI.ButtonProps & {
	Text: Fusion.UsedAs<string>?,
}

return function(Scope: Fusion.Scope<any>, Props: TextButtonProps)
	local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components)
	local Theme = OnyxUI.Themer.Theme:now()

	local Text = OnyxUI.Util.Fallback(Props.Text, "Hello World")

	return Scope:Button(OnyxUI.Util.CombineProps(Props, {
		Name = script.Name,
		Content = Scope:Computed(function(Use)
			local TextValue = Use(Text)

			return { TextValue }
		end),
		Color = Theme.Colors.Primary.Main,
		SizeVariant = "Large",
		Size = Scope:UDim(0, Theme.Sizing["8"]),
		List = {
			FillDirection = Enum.FillDirection.Vertical,
		}
	}))
end
```

