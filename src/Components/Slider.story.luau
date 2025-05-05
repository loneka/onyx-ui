local OnyxUI = script.Parent.Parent
local Fusion = require(OnyxUI.Parent.Fusion)
local Util = require(OnyxUI.Util)
local Themer = require(OnyxUI.Themer)

local Children = Fusion.Children

local Components = {
	Slider = require(OnyxUI.Components.Slider),
	Frame = require(OnyxUI.Components.Frame),
}

return {
	story = function(Props)
		local Scope = Fusion.scoped(Fusion, Util, Components)
		local Theme = Themer.Theme:now()

		Scope:Frame {
			Parent = Props.target,
			Size = Scope:Computed(function(Use)
				return UDim2.fromOffset(Use(Theme.Padding["16"]), 0)
			end),
			AutomaticSize = Enum.AutomaticSize.Y,
			Padding = {
				All = Scope:Computed(function(Use)
					return UDim.new(0, Use(Theme.StrokeThickness["1"]))
				end),
			},
			List = {
				Padding = Scope:Computed(function(Use)
					return UDim.new(0, Use(Theme.Spacing["1"]))
				end),
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
			},

			[Children] = {
				Scope:Slider {},
				Scope:Slider {
					Value = 1 / 10,
					Unit = 1 / 10,
					Color = Util.Colors.Cyan["500"],
				},
				Scope:Slider {
					Value = 1 / 4,
					Unit = 1 / 4,
					Color = Util.Colors.Fuchsia["500"],
				},
				Scope:Slider {
					Disabled = true,
				},
			},
		}
	end,
	fusion = Fusion,
}
