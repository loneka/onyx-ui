--[=[
		@class Badge
		
		Used to inform the user of something's status. E.g. a notification indicator or discount tag.

]=]

local OnyxUI = script.Parent.Parent
local Fusion = require(OnyxUI.Parent.Fusion)
local Util = require(OnyxUI.Util)
local Themer = require(OnyxUI.Themer)

local Children = Fusion.Children

local Frame = require(script.Parent.Frame)
local IconText = require(script.Parent.IconText)
local Components = {
	Frame = Frame,
	IconText = IconText,
}

export type Props = Frame.Props & {
	Content: Fusion.UsedAs<{ string }>?,
	ContentWrapped: Fusion.UsedAs<boolean>?,
	Color: Fusion.UsedAs<Color3>?,
	ContentColor: Fusion.UsedAs<Color3>?,
	ContentSize: Fusion.UsedAs<number>?,
}

--[=[
		@within Badge
		@interface BadgeProps

		@field ... FrameProps
		@field Content Fusion.UsedAs<{ string }>?
		@field ContentWrapped Fusion.UsedAs<boolean>?
		@field Color Fusion.UsedAs<Color3>?
		@field ContentColor Fusion.UsedAs<Color3>?
		@field ContentSize Fusion.UsedAs<number>?
		@field ContentWrapped Fusion.UsedAs<number>?
]=]
return function(Scope: Fusion.Scope<any>, Props: Props)
	local Scope = Fusion.innerScope(Scope, Fusion, Util, Components)
	local Theme = Themer.Theme:now()

	local Content = Util.Fallback(Props.Content, {})
	local ContentWrapped = Util.Fallback(Props.ContentWrapped, true)
	local Color = Util.Fallback(Props.Color, Theme.Colors.Base.Main)
	local ContentColor = Util.Fallback(
		Props.ContentColor,

		Scope:Computed(function(Use)
			return Util.Emphasize(Use(Color), Use(Theme.Emphasis.Contrast))
		end)
	)
	local ContentSize = Util.Fallback(Props.ContentSize, Theme.TextSize["1"])

	return Scope:Frame(Util.CombineProps(Props, {
		Name = "Badge",
		BackgroundColor3 = Color,
		BackgroundTransparency = 0,
		Padding = Scope:Computed(function(Use)
			return {
				All = UDim.new(0, Use(Theme.Padding["0"])),
				Left = UDim.new(0, Use(Theme.Padding["0.25"])),
				Right = UDim.new(0, Use(Theme.Padding["0.25"])),
			}
		end),
		Corner = {
			Radius = Scope:Computed(function(Use)
				return UDim.new(0, Use(Theme.CornerRadius["2"]))
			end),
		},
		List = {
			Padding = Scope:Computed(function(Use)
				return UDim.new(0, Use(Theme.Spacing["0.25"]))
			end),
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Wraps = ContentWrapped,
		},
		Stroke = {},

		[Children] = {
			Scope:IconText {
				Content = Content,
				ContentColor = ContentColor,
				ContentSize = ContentSize,
				ContentWrapped = ContentWrapped,
				List = {
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = Scope:Computed(function(Use)
						return UDim.new(0, Use(Theme.Spacing["0.25"]))
					end),
				},
			},
		},
	}))
end
