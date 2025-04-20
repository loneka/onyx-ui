local OnyxUI = script.Parent.Parent.Parent.OnyxUI.Packages.OnyxUI
local Util = require(OnyxUI.Util)
local Themer = require(OnyxUI.Themer)
local Fusion = require(OnyxUI.Parent.Fusion)

local BaseButton = require(OnyxUI.Components.BaseButton)
local Switch = require(OnyxUI.Components.Switch)
local Components = {
	BaseButton = BaseButton,
	Switch = Switch,
}

export type Props = Switch.Props & {}

return function(Scope: Fusion.Scope<any>, Props: Props)
	local Scope = Fusion.innerScope(Scope, Fusion, Util, Components)
	local Theme = Themer.Theme:now()

	local Switched = Scope:EnsureValue(Util.Fallback(Props.Switched, false))

	Props.Switched = Switched

	return Scope:BaseButton(Util.CombineProps(Props, {
		Name = "SwitchGroup",
		ClickSound = Theme.Sound.Switch,
		Disabled = Props.Disabled,

		OnActivated = function()
			Switched:set(not Fusion.peek(Switched))
		end,
	}))
end
