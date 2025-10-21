local OnyxUI = script.Parent.Parent
local Fusion = require(OnyxUI.Parent.Fusion)
local Themer = require(OnyxUI.Themer)
local Util = require(OnyxUI.Util)

local Children = Fusion.Children

local AutoScaler = require(OnyxUI.Components.AutoScaler)
local Card = require(OnyxUI.Components.Card)
local Components = {
	AutoScaler = AutoScaler,
	Card = Card,
}

return {
	story = function(Props)
		local Scope = Fusion.innerScope(Props.scope, Fusion, Util, Components)
		local Theme = Themer.Theme:now()

		Scope:AutoScaler {
			Parent = Props.target,
			BaseResolution = Vector2.new(800, 800),
			List = {
				FillDirection = Enum.FillDirection.Vertical,
				Padding = Scope:UDim(0, Theme.Spacing["0.75"]),
			},

			[Children] = {
				Scope:Card {
					Size = Scope:UDim2Offset(Theme.Sizing["16"], Theme.Sizing["8"]),
					AutomaticSize = Enum.AutomaticSize.None,
				},
			},
		}
	end,
	fusion = Fusion,
}
