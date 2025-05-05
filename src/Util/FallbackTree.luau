--[=[
	@function Fallback
	@within Util

	@param Value Fusion.UsedAs<any>
	@param Fallback any
	@return any
	
	Defaults the given `Value` to `Fallback` if nil.
]=]

local OnyxUI = script.Parent.Parent
local Fusion = require(OnyxUI.Parent.Fusion)
local FallbackUtil = require(script.Parent.Fallback)

local function FallbackTree(Preferred: Fusion.UsedAs<any>, Fallback: any)
	local PreferredValue = Fusion.peek(Preferred)

	if typeof(PreferredValue) == "table" then
		for ChildKey, ChildValue in PreferredValue do
			PreferredValue[ChildKey] = FallbackUtil(ChildValue, Fallback[ChildKey])
		end
	end

	return PreferredValue
end

return FallbackTree
