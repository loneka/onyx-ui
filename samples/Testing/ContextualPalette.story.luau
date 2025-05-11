local OnyxUI = require(script.Parent.Parent.Parent.OnyxUI)
local Fusion = require(script.Parent.Parent.Parent.OnyxUI.Packages.OnyxUI.Parent.Fusion)

local Util = OnyxUI.Util
local Themer = OnyxUI.Themer
local Components = OnyxUI.Components
local Children = Fusion.Children

local function Palette(Scope: Fusion.Scope<any>, _: any)
	local Scope = Fusion.innerScope(Scope, Fusion, Util, Components)
	local Theme = Themer.Theme:now()

	return Scope:Base {
		Name = "Palette",
		BackgroundTransparency = 1,
		List = {
			Padding = Scope:UDim(0, Theme.Spacing["0.75"]),
		},

		[Children] = {
			{
				Scope:Base {
					Size = UDim2.fromOffset(100, 100),
					BackgroundColor3 = Theme.Colors.Info.Light,
					BackgroundTransparency = 0,
				},
				Scope:Base {
					Size = UDim2.fromOffset(100, 100),
					BackgroundColor3 = Theme.Colors.Info.Main,
					BackgroundTransparency = 0,
				},
				Scope:Base {
					Size = UDim2.fromOffset(100, 100),
					BackgroundColor3 = Theme.Colors.Info.Dark,
					BackgroundTransparency = 0,
				},
				Scope:Base {
					Size = UDim2.fromOffset(100, 100),
					BackgroundColor3 = Theme.Colors.Info.Contrast,
					BackgroundTransparency = 0,
				},
			},
		},
	}
end

return {
	story = function(Props)
		local Scope = Fusion.scoped(Fusion, Util, Components, {
			Palette = Palette,
		})

		local AnotherTheme = Themer.NewTheme(Scope, {
			Colors = {
				Info = { Main = Util.Colors.Blue["600"] },
			},
		})

		Scope:Base {
			Parent = Props.target,
			List = {
				FillDirection = Enum.FillDirection.Horizontal,
			},
			BackgroundTransparency = 1,

			[Children] = {
				Scope:Palette {},
				Themer.Theme:is(AnotherTheme):during(function()
					return Scope:Palette {}
				end),
			},
		}

		return function()
			Scope:doCleanup()
		end
	end,
	fusion = Fusion,
}
