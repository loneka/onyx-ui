local OnyxUI = script.Parent.Parent.Parent.OnyxUI.Packages.OnyxUI
local Util = require(OnyxUI.Util)
local NewTheme = require(OnyxUI.Themer.NewTheme)
local Fusion = require(OnyxUI.Parent.Fusion)

local Scope = Fusion.scoped()

local BitCave = NewTheme(Scope, {
	Colors = {
		Primary = {
			Main = Util.Colors.White,
		},
		Secondary = {
			Main = Util.Colors.White,
		},
		Accent = {
			Main = Util.Colors.White,
		},

		Neutral = {
			Main = Util.Colors.Stone["800"],
		},
		NeutralContent = {
			Main = Util.Colors.Stone["300"],
		},

		Base = {
			Main = Util.Colors.Black,
		},
		BaseContent = {
			Main = Util.Colors.White,
		},

		Success = {
			Main = Util.Colors.Green["500"],
		},
		Error = {
			Main = Util.Colors.Red["500"],
		},
		Warning = {
			Main = Util.Colors.Amber["500"],
		},
		Info = {
			Main = Util.Colors.Cyan["400"],
		},
	},
	Font = {
		Body = "rbxassetid://12187371840",
		Heading = "rbxassetid://12187371840",
		Monospace = "rbxassetid://12187371840",
	},
	FontWeight = {
		Body = Enum.FontWeight.Bold,
		Bold = Enum.FontWeight.ExtraBold,
		Heading = Enum.FontWeight.ExtraBold,
	},
	TextSize = {
		Base = 18,
	},
	CornerRadius = {
		Base = 0,
	},
	StrokeThickness = {
		Base = 2,
	},
	StrokeEmphasis = {
		Regular = 0,
	},
	Spacing = {
		Base = 24,
	},
	Padding = {
		Base = 28,
	},
	Sizing = {
		Base = 24,
	},
	SpringSpeed = {
		Base = 60,
	},
	SpringDampening = {
		Base = 0.75,
	},
	Emphasis = {
		Regular = 0.125,
	},
})

return BitCave
