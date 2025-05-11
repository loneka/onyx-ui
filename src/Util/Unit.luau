local OnyxUI = script.Parent.Parent
local Fusion = require(OnyxUI.Parent.Fusion)

--[=[
	@interface Unit
	@within Util
	.Vector2 (Fusion.Scope(typeof(Fusion)), Fusion.UsedAs<number>, Fusion.UsedAs<number>) - > Fusion.Computed<Vector2>
	.UDim (Fusion.Scope<typeof(Fusion)>, Fusion.UsedAs<number>, Fusion.UsedAs<number>) - > Fusion.Computed<UDim>
	.UDim2 (Fusion.Scope<typeof(Fusion)>, Fusion.UsedAs<number>, Fusion.UsedAs<number>, Fusion.UsedAs<number>, Fusion.UsedAs<number>) - > Fusion.Computed<UDim2>
	.UDim2Offset (Fusion.Scope<typeof(Fusion)>, Fusion.UsedAs<number>, Fusion.UsedAs<number>) - > Fusion.Computed<UDim2>
	.UDim2Scale (Fusion.Scope<typeof(Fusion)>, Fusion.UsedAs<number>, Fusion.UsedAs<number>) - > Fusion.Computed<UDim2>

	Fusion must be bundled within the scope parameter.
]=]

local Unit = {}

function Unit.Vector2(
	Scope: Fusion.Scope<typeof(Fusion)>,
	X: Fusion.UsedAs<number>,
	Y: Fusion.UsedAs<number>
): Fusion.Computed<Vector2>
	return Scope:Computed(function(Use)
		return Vector2.new(Use(X), Use(Y))
	end)
end

function Unit.UDim(
	Scope: Fusion.Scope<typeof(Fusion)>,
	Scale: Fusion.UsedAs<number>,
	Offset: Fusion.UsedAs<number>
): Fusion.Computed<UDim>
	return Scope:Computed(function(Use)
		return UDim.new(Use(Scale), Use(Offset))
	end)
end

function Unit.UDim2(
	Scope: Fusion.Scope<typeof(Fusion)>,
	XScale: Fusion.UsedAs<number>,
	XOffset: Fusion.UsedAs<number>,
	YScale: Fusion.UsedAs<number>,
	YOffset: Fusion.UsedAs<number>
): Fusion.Computed<UDim2>
	return Scope:Computed(function(Use)
		return UDim2.new(Use(XScale), Use(XOffset), Use(YScale), Use(YOffset))
	end)
end

function Unit.UDim2Offset(
	Scope: Fusion.Scope<typeof(Fusion)>,
	X: Fusion.UsedAs<number>,
	Y: Fusion.UsedAs<number>
): Fusion.Computed<UDim2>
	return Unit.UDim2(Scope, 0, X, 0, Y)
end

function Unit.UDim2Scale(
	Scope: Fusion.Scope<typeof(Fusion)>,
	X: Fusion.UsedAs<number>,
	Y: Fusion.UsedAs<number>
): Fusion.Computed<UDim2>
	return Unit.UDim2(Scope, X, 0, Y, 0)
end

return Unit
