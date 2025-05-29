local OnyxUI = require(script.Parent.Parent.OnyxUI)
local Fusion = require(script.Parent.Parent.OnyxUI.Packages.Fusion)

local Themer = OnyxUI.Themer
local Util = OnyxUI.Util
local Children = Fusion.Children

local SettingToggle = require(script.SettingToggle)

export type Props = {
	Parent: Fusion.UsedAs<Instance>?,
}

return function(Scope: Fusion.Scope<any>, Props: Props)
	local Scope = Fusion.innerScope(Scope, Fusion, OnyxUI.Util, OnyxUI.Components, {
		SettingToggle = SettingToggle,
	})
	local Theme = Themer.Theme:now()

	return Scope:Card(Util.CombineProps(Props, {
		Parent = Props.Parent,
		Size = Scope:UDim2Offset(Theme.Sizing["16"], 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		List = {
			HorizontalFlex = Enum.UIFlexAlignment.Fill,
		},
		Corner = {
			Radius = Scope:UDim(0, Theme.CornerRadius["2"]),
		},

		[Children] = {
			Scope:TitleBar {
				Content = { "Settings" },
				ContentSize = Theme.TextSize["1.25"],
			},
			Scope:Scroller {
				Size = UDim2.new(UDim.new(1, 0), UDim.new(0, 175)),
				AutomaticSize = Enum.AutomaticSize.None,
				List = {
					HorizontalFlex = Enum.UIFlexAlignment.Fill,
				},
				Padding = {
					All = Scope:UDim(0, Theme.StrokeThickness["1"]),
					Right = Scope:Computed(function(Use)
						return UDim.new(0, Use(Theme.StrokeThickness["1"]) + Use(Theme.Spacing["1"]))
					end),
				},

				[Children] = {
					Scope:SettingToggle {
						Label = "Music",
						Switched = true,
					},
					Scope:SettingToggle {
						Label = "Low quality",
					},
					Scope:SettingToggle {
						Label = "Copyrighted audio",
						Switched = true,
					},
					Scope:SettingToggle {
						Label = "Infinite Bobux",
						Disabled = true,
					},
					Scope:SettingToggle {
						Label = "Something else",
					},
					Scope:SettingToggle {
						Label = "Nothing same",
					},
					Scope:TextInput {
						AutomaticSize = Enum.AutomaticSize.Y,
						PlaceholderText = "Nickname",
						CharacterLimit = 20,
					},
					Scope:Slider {
						Unit = 1 / 8,
					},
				},
			},
			Scope:Button {
				Content = { "Close" },
				Color = Theme.Colors.Primary.Main,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
			},
		},
	}))
end
