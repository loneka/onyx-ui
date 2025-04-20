--[=[
		@class SwitchGroup
		
		Useful for pairing [`Switch`](/api/Switch)s with other components, like [`Text`](/api/Text).
]=]

local OnyxUI = script.Parent.Parent
local Util = require(OnyxUI.Util)
local Themer = require(OnyxUI.Themer)
local Fusion = require(OnyxUI.Parent.Fusion)

local BaseButton = require(script.Parent.BaseButton)
local Switch = require(script.Parent.Switch)
local Components = {
	BaseButton = BaseButton,
	Switch = Switch,
}

export type Props = Switch.Props & {}

--[=[
		@within SwitchGroup
		@interface SwitchGroupProps

		@field ... SwitchProps
]=]
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
