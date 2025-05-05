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

local function FallbackUtil(Preferred: Fusion.UsedAs<any>, Fallback: any)
	local PreferredValue = Fusion.peek(Preferred)

	if PreferredValue == nil then
		if (typeof(Preferred) == "table") and (Preferred.kind == "Value") and (Preferred.set ~= nil) then
			Preferred:set(Fallback)

			return Preferred
		else
			return Fallback
		end
	else
		if (typeof(PreferredValue) == "table") and (typeof(Fallback) == "table") then
			for Key, Value in pairs(Fallback) do
				PreferredValue[Key] = FallbackUtil(PreferredValue[Key], Value)
			end
		end

		return PreferredValue
	end
end

return FallbackUtil
