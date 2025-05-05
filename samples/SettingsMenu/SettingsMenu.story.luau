local OnyxUI = script.Parent.Parent.Parent.OnyxUI.Packages.OnyxUI
local Fusion = require(OnyxUI.Parent.Fusion)
local Themer = require(OnyxUI.Themer)
local BitCave = require(script.Parent.Parent.Themes.BitCave)

local Children = Fusion.Children

local Frame = require(OnyxUI.Components.Frame)
local SettingsMenu = require(script.Parent)
local Components = {
	Frame = Frame,
	SettingsMenu = SettingsMenu,
}

return {
	story = function(Props)
		local Scope = Fusion.innerScope(Props.scope, Fusion, Components)
		local Theme = Themer.Theme:now()

		Scope:Frame {
			Parent = Props.target,
			Padding = Scope:Computed(function(Use)
				return {
					Padding = UDim.new(0, Use(Theme.StrokeThickness["1"])),
				}
			end),
			ListEnabled = true,
			ListFillDirection = Enum.FillDirection.Horizontal,

			[Children] = {
				Scope:SettingsMenu {},
				Themer.Theme:is(BitCave):during(function()
					return Scope:SettingsMenu {}
				end),
			},
		}
	end,
	fusion = Fusion,
}
