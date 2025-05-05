--[=[
		@class Base

		The foundational component of OnyxUI, from which all other components are built off of. Props supported here typically work in all other components.

		:::info Styling props
		A reference of common styling props can be found in [this docs page](/docs/styling).
		:::
]=]

local OnyxUI = script.Parent.Parent
local Fusion = require(OnyxUI.Parent.Fusion)
local Util = require(OnyxUI.Util)
local Themer = require(OnyxUI.Themer)

local Children = Fusion.Children

export type GradientProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Color: Fusion.UsedAs<ColorSequence>?,
	Offset: Fusion.UsedAs<UDim>?,
	Rotation: Fusion.UsedAs<number>?,
	Transparency: Fusion.UsedAs<NumberSequence>?,
}
export type PaddingProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	All: Fusion.UsedAs<UDim>?,
	Top: Fusion.UsedAs<UDim>?,
	Left: Fusion.UsedAs<UDim>?,
	Right: Fusion.UsedAs<UDim>?,
	Bottom: Fusion.UsedAs<UDim>?,
}
export type CornerProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Radius: Fusion.UsedAs<UDim>?,
}
export type StrokeProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Thickness: Fusion.UsedAs<number>?,
	Color: Fusion.UsedAs<Color3>?,
	Transparency: Fusion.UsedAs<number>?,
	LineJoinMode: Fusion.UsedAs<Enum.LineJoinMode>?,
	ApplyStrokeMode: Fusion.UsedAs<Enum.ApplyStrokeMode>?,

	Gradient: Fusion.UsedAs<GradientProps>?,
}
export type AspectProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Ratio: Fusion.UsedAs<number>?,
	Type: Fusion.UsedAs<Enum.AspectType>?,
	DominantAxis: Fusion.UsedAs<Enum.DominantAxis>?,
}
export type ScaleProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Scale: Fusion.UsedAs<number>?,
}
export type FlexProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Mode: Fusion.UsedAs<Enum.UIFlexMode>?,
	ItemLineAlignment: Fusion.UsedAs<Enum.ItemLineAlignment>?,
	GrowRatio: Fusion.UsedAs<number>?,
	ShrinkRatio: Fusion.UsedAs<number>?,
}
export type ListProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Padding: Fusion.UsedAs<UDim>?,
	FillDirection: Fusion.UsedAs<Enum.FillDirection>?,
	SortOrder: Fusion.UsedAs<Enum.SortOrder>?,
	Wraps: Fusion.UsedAs<boolean>?,
	HorizontalAlignment: Fusion.UsedAs<Enum.HorizontalAlignment>?,
	HorizontalFlex: Fusion.UsedAs<boolean>?,
	VerticalAlignment: Fusion.UsedAs<Enum.VerticalAlignment>?,
	VerticalFlex: Fusion.UsedAs<boolean>?,
	ItemLineAlignment: Fusion.UsedAs<Enum.ItemLineAlignment>?,
}
export type GridProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	CellPadding: Fusion.UsedAs<UDim>?,
	CellSize: Fusion.UsedAs<UDim2>?,
	FillDirection: Fusion.UsedAs<Enum.FillDirection>?,
	FillDirectionMaxCells: Fusion.UsedAs<number>?,
	SortOrder: Fusion.UsedAs<Enum.SortOrder>?,
	StartCorner: Fusion.UsedAs<Enum.StartCorner>?,
	HorizontalAlignment: Fusion.UsedAs<Enum.HorizontalAlignment>?,
	VerticalAlignment: Fusion.UsedAs<Enum.VerticalAlignment>?,
}
export type TableProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Padding: Fusion.UsedAs<UDim>?,
	FillEmptySpaceColumns: Fusion.UsedAs<boolean>?,
	FillEmptySpaceRows: Fusion.UsedAs<boolean>?,
	FillDirection: Fusion.UsedAs<Enum.FillDirection>?,
	SortOrder: Fusion.UsedAs<Enum.SortOrder>?,
	MajorAxis: Fusion.UsedAs<Enum.TableMajorAxis>?,
	HorizontalAlignment: Fusion.UsedAs<Enum.HorizontalAlignment>?,
	VerticalAlignment: Fusion.UsedAs<Enum.VerticalAlignment>?,
}
export type PageProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Animated: Fusion.UsedAs<boolean>?,
	Circular: Fusion.UsedAs<boolean>?,
	EasingDirection: Fusion.UsedAs<Enum.EasingDirection>?,
	EasingStyle: Fusion.UsedAs<Enum.EasingStyle>?,
	Padding: Fusion.UsedAs<UDim>?,
	TweenTime: Fusion.UsedAs<number>?,
	FillDirection: Fusion.UsedAs<Enum.FillDirection>?,
	SortOrder: Fusion.UsedAs<Enum.SortOrder>?,
	HorizontalAlignment: Fusion.UsedAs<Enum.HorizontalAlignment>?,
	VerticalAlignment: Fusion.UsedAs<Enum.VerticalAlignment>?,
	GamepadInputEnabled: Fusion.UsedAs<boolean>?,
	ScrollWheelInputEnabled: Fusion.UsedAs<boolean>?,
	TouchInputEnabled: Fusion.UsedAs<boolean>?,
}
export type SizeConstraintProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Max: Fusion.UsedAs<Vector2>?,
	Min: Fusion.UsedAs<Vector2>?,
}
export type TextSizeConstraintProps = {
	Enabled: Fusion.UsedAs<boolean>?,
	Max: Fusion.UsedAs<number>?,
	Min: Fusion.UsedAs<number>?,
}
export type Props = {
	ClassName: string?,

	Name: Fusion.UsedAs<string>?,
	Parent: Fusion.UsedAs<Instance>?,
	Position: Fusion.UsedAs<UDim2>?,
	Rotation: Fusion.UsedAs<number>?,
	AnchorPoint: Fusion.UsedAs<Vector2>?,
	Size: Fusion.UsedAs<UDim2>?,
	AutomaticSize: Fusion.UsedAs<Enum.AutomaticSize>?,
	Visible: Fusion.UsedAs<boolean>?,
	ZIndex: Fusion.UsedAs<number>?,
	LayoutOrder: Fusion.UsedAs<number>?,
	ClipsDescendants: Fusion.UsedAs<boolean>?,
	Active: Fusion.UsedAs<boolean>?,
	Selectable: Fusion.UsedAs<boolean>?,
	Interactable: Fusion.UsedAs<boolean>?,
	BackgroundColor3: Fusion.UsedAs<Color3>?,
	BackgroundTransparency: Fusion.UsedAs<number>?,
	NextSelectionDown: Fusion.UsedAs<GuiObject>?,
	NextSelectionUp: Fusion.UsedAs<GuiObject>?,
	NextSelectionRight: Fusion.UsedAs<GuiObject>?,
	NextSelectionLeft: Fusion.UsedAs<GuiObject>?,
	SelectionImageObject: Fusion.UsedAs<GuiObject>?,
	SelectionOrder: Fusion.UsedAs<number>?,
	SizeConstraint: Fusion.UsedAs<Enum.SizeConstraint>?,
	AutoLocalize: Fusion.UsedAs<boolean>?,
	RootLocalizationTable: Fusion.UsedAs<LocalizationTable>?,
	SelectionBehaviorDown: Fusion.UsedAs<Enum.SelectionBehavior>?,
	SelectionBehaviorUp: Fusion.UsedAs<Enum.SelectionBehavior>?,
	SelectionBehaviorRight: Fusion.UsedAs<Enum.SelectionBehavior>?,
	SelectionBehaviorLeft: Fusion.UsedAs<Enum.SelectionBehavior>?,
	SelectionGroup: Fusion.UsedAs<boolean>?,

	Corner: CornerProps?,
	Padding: PaddingProps?,
	Stroke: StrokeProps?,
	Gradient: GradientProps?,
	Aspect: AspectProps?,
	Scale: ScaleProps?,

	List: ListProps?,
	Grid: GridProps?,
	Table: TableProps?,
	Page: PageProps?,
	Flex: FlexProps?,

	SizeConstraint: SizeConstraintProps?,
	TextSizeConstraint: TextSizeConstraintProps?,
}

--[=[
	@within Base
	@interface PaddingProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Padding Fusion.UsedAs<UDim>?
	@field Top Fusion.UsedAs<UDim>?
	@field Left Fusion.UsedAs<UDim>?
	@field Right Fusion.UsedAs<UDim>?
	@field Bottom Fusion.UsedAs<UDim>?
]=]
--[=[
	@within Base
	@interface GradientProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Color Fusion.UsedAs<ColorSequence>?
	@field Offset Fusion.UsedAs<UDim>?
	@field Rotation Fusion.UsedAs<number>?
	@field Transparency Fusion.UsedAs<number>?
]=]
--[=[
	@within Base
	@interface CornerProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Radius Fusion.UsedAs<UDim>?
]=]
--[=[
	@within Base
	@interface StrokeProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Thickness Fusion.UsedAs<number>?
	@field Color Fusion.UsedAs<Color3>?
	@field Transparency Fusion.UsedAs<number>?
	@field LineJoinMode Fusion.UsedAs<Enum.LineJoinMode>?
	@field ApplyStrokeMode Fusion.UsedAs<Enum.ApplyStrokeMode>?

	@field Gradient Fusion.UsedAs<GradientProps>?
]=]
--[=[
	@within Base
	@interface AspectProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Ratio Fusion.UsedAs<number>?
	@field Type Fusion.UsedAs<Enum.AspectType>?
	@field DominantAxis Fusion.UsedAs<Enum.DominantAxis>?
]=]
--[=[
	@within Base
	@interface ScaleProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Scale Fusion.UsedAs<number>?
]=]
--[=[
	@within Base
	@interface FlexProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Mode Fusion.UsedAs<Enum.UIFlexMode>?
	@field ItemLineAlignment Fusion.UsedAs<Enum.ItemLineAlignment>?
	@field GrowRatio Fusion.UsedAs<number>?
	@field ShrinkRatio Fusion.UsedAs<number>?
]=]
--[=[
	@within Base
	@interface ListProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Padding Fusion.UsedAs<UDim>?
	@field FillDirection Fusion.UsedAs<Enum.FillDirection>?
	@field SortOrder Fusion.UsedAs<Enum.SortOrder>?
	@field Wraps Fusion.UsedAs<boolean>?
	@field HorizontalAlignment Fusion.UsedAs<Enum.HorizontalAlignment>?
	@field HorizontalFlex Fusion.UsedAs<boolean>?
	@field VerticalAlignment Fusion.UsedAs<Enum.VerticalAlignment>?
	@field VerticalFlex Fusion.UsedAs<boolean>?
	@field ItemLineAlignment Fusion.UsedAs<Enum.ItemLineAlignment>?
]=]
--[=[
	@within Base
	@interface GridProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field CellPadding Fusion.UsedAs<UDim>?
	@field CellSize Fusion.UsedAs<UDim2>?
	@field FillDirection Fusion.UsedAs<Enum.FillDirection>?
	@field FillDirectionMaxCells Fusion.UsedAs<number>?
	@field SortOrder Fusion.UsedAs<Enum.SortOrder>?
	@field StartCorner Fusion.UsedAs<Enum.StartCorner>?
	@field HorizontalAlignment Fusion.UsedAs<Enum.HorizontalAlignment>?
	@field VerticalAlignment Fusion.UsedAs<Enum.VerticalAlignment>?
]=]
--[=[
	@within Base
	@interface TableProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Padding Fusion.UsedAs<UDim>?
	@field FillEmptySpaceColumns Fusion.UsedAs<boolean>?
	@field FillEmptySpaceRows Fusion.UsedAs<boolean>?
	@field FillDirection Fusion.UsedAs<Enum.FillDirection>?
	@field SortOrder Fusion.UsedAs<Enum.SortOrder>?
	@field MajorAxis Fusion.UsedAs<Enum.TableMajorAxis>?
	@field HorizontalAlignment Fusion.UsedAs<Enum.HorizontalAlignment>?
	@field VerticalAlignment Fusion.UsedAs<Enum.VerticalAlignment>?
]=]
--[=[
	@within Base
	@interface PageProps

	@field Enabled Fusion.UsedAs<boolean>?
	@field Animated Fusion.UsedAs<boolean>?
	@field Circular Fusion.UsedAs<boolean>?
	@field EasingDirection Fusion.UsedAs<Enum.EasingDirection>?
	@field EasingStyle Fusion.UsedAs<Enum.EasingStyle>?
	@field Padding Fusion.UsedAs<UDim>?
	@field TweenTime Fusion.UsedAs<number>?
	@field FillDirection Fusion.UsedAs<Enum.FillDirection>?
	@field SortOrder Fusion.UsedAs<Enum.SortOrder>?
	@field HorizontalAlignment Fusion.UsedAs<Enum.HorizontalAlignment>?
	@field VerticalAlignment Fusion.UsedAs<Enum.VerticalAlignment>?
	@field GamepadInputEnabled Fusion.UsedAs<boolean>?
	@field ScrollWheelInputEnabled Fusion.UsedAs<boolean>?
	@field TouchInputEnabled Fusion.UsedAs<boolean>?
]=]
--[=[
	@within Base
	@interface BaseProps

	@field ... BaseProps
	
	@field ClassName string?
	@field Name Fusion.UsedAs<string>?
	@field Parent Fusion.UsedAs<Instance>?
	@field Position Fusion.UsedAs<UDim2>?
	@field Rotation Fusion.UsedAs<number>?
	@field AnchorPoint Fusion.UsedAs<Vector2>?
	@field Size Fusion.UsedAs<UDim2>?
	@field AutomaticSize Fusion.UsedAs<Enum.AutomaticSize>?
	@field Visible Fusion.UsedAs<boolean>?
	@field ZIndex Fusion.UsedAs<number>?
	@field LayoutOrder Fusion.UsedAs<number>?
	@field ClipsDescendants Fusion.UsedAs<boolean>?
	@field Active Fusion.UsedAs<boolean>?
	@field Selectable Fusion.UsedAs<boolean>?
	@field Interactable Fusion.UsedAs<boolean>?
	@field BackgroundColor3 Fusion.UsedAs<Color3>?
	@field BackgroundTransparency Fusion.UsedAs<number>?
	@field NextSelectionDown Fusion.UsedAs<GuiObject>?
	@field NextSelectionUp Fusion.UsedAs<GuiObject>?
	@field NextSelectionRight Fusion.UsedAs<GuiObject>?
	@field NextSelectionLeft Fusion.UsedAs<GuiObject>?
	@field SelectionImageObject Fusion.UsedAs<GuiObject>?
	@field SelectionOrder Fusion.UsedAs<number>?
	@field SizeConstraint Fusion.UsedAs<Enum.SizeConstraint>?
	@field AutoLocalize Fusion.UsedAs<boolean>?
	@field RootLocalizationTable Fusion.UsedAs<LocalizationTable>?
	@field SelectionBehaviorDown Fusion.UsedAs<Enum.SelectionBehavior>?
	@field SelectionBehaviorUp Fusion.UsedAs<Enum.SelectionBehavior>?
	@field SelectionBehaviorRight Fusion.UsedAs<Enum.SelectionBehavior>?
	@field SelectionBehaviorLeft Fusion.UsedAs<Enum.SelectionBehavior>?
	@field SelectionGroup Fusion.UsedAs<boolean>?

	@field Corner Fusion.UsedAs<CornerProps>?
	@field Padding Fusion.UsedAs<PaddingProps>?
	@field Stroke Fusion.UsedAs<StrokeProps>?
	@field Gradient Fusion.UsedAs<GradientProps>?
	@field Aspect Fusion.UsedAs<AspectProps>?
	@field Scale Fusion.UsedAs<ScaleProps>?

	@field List Fusion.UsedAs<ListProps>?
	@field Grid Fusion.UsedAs<GridProps>?
	@field Table Fusion.UsedAs<TableProps>?
	@field Page Fusion.UsedAs<PageProps>?
	@field Flex Fusion.UsedAs<FlexProps>?

	@field MaxSize Fusion.UsedAs<Vector2>?
	@field MinSize Fusion.UsedAs<Vector2>?

	@field MaxTextSize Fusion.UsedAs<number>?
	@field MinTextSize Fusion.UsedAs<number>?
]=]
return function(Scope: Fusion.Scope<any>, Props: Props): Instance
	local Scope = Fusion.innerScope(Scope, Fusion, Util)
	local Theme = Themer.Theme:now()

	local ClassName = Util.Fallback(Props.ClassName, "Frame")
	local Name = Util.Fallback(Props.Name, "Base")
	local AutomaticSize = Util.Fallback(Props.AutomaticSize, Enum.AutomaticSize.XY)
	local BackgroundColor3 = Util.Fallback(Props.BackgroundColor3, Theme.Colors.Base.Main)
	local Corner = Util.Fallback(Props.Corner, {
		Radius = UDim.new(0, 0),
	})
	local Stroke = Util.Fallback(Props.Stroke, {
		Thickness = Theme.StrokeThickness["1"],
		Color = Scope:Computed(function(Use)
			return Util.Emphasize(Use(BackgroundColor3), Use(Theme.StrokeEmphasis["Regular"]))
		end),
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		LineJoinMode = Scope:Computed(function(Use)
			local CornerRadiusValue = Use(Use(Corner).Radius)

			if (CornerRadiusValue ~= nil) and ((CornerRadiusValue.Offset > 1) or (CornerRadiusValue.Scale > 1)) then
				return Enum.LineJoinMode.Round
			else
				return Enum.LineJoinMode.Miter
			end
		end),
	})
	local Padding = Util.Fallback(Props.Padding, {
		All = Scope:Computed(function(Use)
			return UDim.new(0, Use(Theme.Padding["1"]))
		end),
	})
	local List = Util.Fallback(Props.List, {
		Padding = Scope:Computed(function(Use)
			return UDim.new(0, Use(Theme.Spacing["1"]))
		end),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	local Grid = Util.Fallback(Props.Grid, {
		CellPadding = Scope:Computed(function(Use)
			return UDim2.fromOffset(Use(Theme.Spacing["1"]), Use(Theme.Spacing["1"]))
		end),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	local Table = Util.Fallback(Props.Table, {
		Padding = Scope:Computed(function(Use)
			return UDim2.fromOffset(Use(Theme.Spacing["1"]), Use(Theme.Spacing["1"]))
		end),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})
	local Page = Util.Fallback(Props.Page, {
		Padding = Scope:Computed(function(Use)
			return UDim.new(0, Use(Theme.Spacing["1"]))
		end),
		SortOrder = Enum.SortOrder.LayoutOrder,
	})

	local PaddingActive = Scope:Computed(function(Use)
		local InProps = Use(Props.Padding) ~= nil
		local PaddingValue = Use(Padding) or {}
		local Paddings =
			{ PaddingValue.All, PaddingValue.Top, PaddingValue.Left, PaddingValue.Right, PaddingValue.Bottom }

		if InProps then
			for _, PaddingProp in Paddings do
				local PaddingPropValue = Use(PaddingProp)

				if typeof(PaddingPropValue) == "UDim" then
					return true
				end
			end
		end

		return false
	end)

	return Scope:New(ClassName) {
		Name = Name,
		AutomaticSize = AutomaticSize,

		Parent = Props.Parent,
		Position = Props.Position,
		Rotation = Props.Rotation,
		AnchorPoint = Props.AnchorPoint,
		Size = Props.Size,
		Visible = Props.Visible,
		ZIndex = Props.ZIndex,
		LayoutOrder = Props.LayoutOrder,
		ClipsDescendants = Props.ClipsDescendants,
		Active = Props.Active,
		Selectable = Props.Selectable,
		Interactable = Props.Interactable,
		BackgroundColor3 = Props.BackgroundColor3,
		BackgroundTransparency = Props.BackgroundTransparency,
		NextSelectionDown = Props.NextSelectionDown,
		NextSelectionUp = Props.NextSelectionUp,
		NextSelectionRight = Props.NextSelectionRight,
		NextSelectionLeft = Props.NextSelectionLeft,
		SelectionImageObject = Props.SelectionImageObject,
		SelectionOrder = Props.SelectionOrder,
		SizeConstraint = Props.SizeConstraint,
		AutoLocalize = Props.AutoLocalize,
		RootLocalizationTable = Props.RootLocalizationTable,
		SelectionBehaviorDown = Props.SelectionBehaviorDown,
		SelectionBehaviorUp = Props.SelectionBehaviorUp,
		SelectionBehaviorRight = Props.SelectionBehaviorRight,
		SelectionBehaviorLeft = Props.SelectionBehaviorLeft,
		SelectionGroup = Props.SelectionGroup,

		[Children] = {
			-- Styling
			Scope:Computed(function(Use)
				local CornerValue: CornerProps = Use(Corner) or {}
				local InProps = Use(Props.Corner) ~= nil

				if InProps and (Use(CornerValue.Enabled) ~= false) then
					return Scope:New "UICorner" {
						CornerRadius = CornerValue.Radius,
					}
				end
			end),
			Scope:Computed(function(Use)
				local PaddingActiveValue = Use(PaddingActive)
				local PaddingValue: PaddingProps = Use(Padding) or {}

				if PaddingActiveValue == true then
					return Scope:New "UIPadding" {
						PaddingTop = Scope:Computed(function(Use)
							local PaddingAllValue = Use(PaddingValue.All)
							local PaddingTopValue = Use(PaddingValue.Top)

							return PaddingTopValue or PaddingAllValue or UDim.new()
						end),
						PaddingBottom = Scope:Computed(function(Use)
							local PaddingAllValue = Use(PaddingValue.All)
							local PaddingBottomValue = Use(PaddingValue.Bottom)

							return PaddingBottomValue or PaddingAllValue or UDim.new()
						end),
						PaddingLeft = Scope:Computed(function(Use)
							local PaddingAllValue = Use(PaddingValue.All)
							local PaddingLeftValue = Use(PaddingValue.Left)

							return PaddingLeftValue or PaddingAllValue or UDim.new()
						end),
						PaddingRight = Scope:Computed(function(Use)
							local PaddingAllValue = Use(PaddingValue.All)
							local PaddingRightValue = Use(PaddingValue.Right)

							return PaddingRightValue or PaddingAllValue or UDim.new()
						end),
					}
				end
			end),
			Scope:Computed(function(Use)
				local StrokeValue: StrokeProps = Use(Stroke) or {}
				local InProps = Use(Props.Stroke) ~= nil

				if InProps and (Use(StrokeValue.Enabled) ~= false) then
					return Scope:New "UIStroke" {
						Enabled = StrokeValue.Enabled,
						Thickness = StrokeValue.Thickness,
						Color = StrokeValue.Color,
						Transparency = StrokeValue.Transparency,
						ApplyStrokeMode = StrokeValue.ApplyStrokeMode,
						LineJoinMode = StrokeValue.LineJoinMode,

						[Children] = {
							Scope:Computed(function(Use)
								local GradientValue: GradientProps = Use(StrokeValue.Gradient) or {}

								if Use(GradientValue.Enabled) ~= false then
									return Scope:New "UIGradient" {
										Enabled = GradientValue.Enabled,
										Color = GradientValue.Color,
										Offset = GradientValue.Offset,
										Rotation = GradientValue.Rotation,
										Transparency = GradientValue.Transparency,
									}
								end
							end),
						},
					}
				end
			end),
			Scope:Computed(function(Use)
				local GradientValue: GradientProps = Use(Props.Gradient) or {}
				local InProps = Use(Props.Gradient) ~= nil

				if InProps and (Use(GradientValue.Enabled) ~= false) then
					return Scope:New "UIGradient" {
						Enabled = GradientValue.Enabled,
						Color = GradientValue.Color,
						Offset = GradientValue.Offset,
						Rotation = GradientValue.Rotation,
						Transparency = GradientValue.Transparency,
					}
				end
			end),

			-- Sizing
			Scope:Computed(function(Use)
				local ScaleValue: ScaleProps = Use(Props.Scale) or {}
				local InProps = Use(Props.Scale) ~= nil

				if InProps and (Use(ScaleValue.Enabled) ~= false) then
					return Scope:New "UIScale" {
						Scale = ScaleValue.Scale,
					}
				end
			end),
			Scope:Computed(function(Use)
				local AspectValue: AspectProps = Use(Props.Aspect) or {}
				local InProps = Use(Props.Aspect) ~= nil

				if InProps and (Use(AspectValue.Enabled) ~= false) then
					return Scope:New "UIAspectRatioConstraint" {
						AspectRatio = AspectValue.Ratio,
						DominantAxis = AspectValue.DominantAxis,
						AspectType = AspectValue.Type,
					}
				end
			end),
			Scope:Computed(function(Use)
				local SizeConstraintValue: SizeConstraintProps = Use(Props.SizeConstraint) or {}

				if
					(Use(SizeConstraintValue.Enabled) ~= false) and (Use(SizeConstraintValue.Max) ~= nil)
					or (Use(SizeConstraintValue.Min) ~= nil)
				then
					return Scope:New "UISizeConstraint" {
						MaxSize = SizeConstraintValue.Max,
						MinSize = SizeConstraintValue.Min,
					}
				end
			end),
			Scope:Computed(function(Use)
				local TextSizeConstraintValue: TextSizeConstraintProps = Use(Props.TextSizeConstraint) or {}

				if (Use(TextSizeConstraintValue.Max) ~= nil) or (Use(TextSizeConstraintValue.Min) ~= nil) then
					return Scope:New "UITextSizeConstraint" {
						MaxTextSize = TextSizeConstraintValue.Max,
						MinTextSize = TextSizeConstraintValue.Min,
					}
				end
			end),

			-- Layout
			Scope:Computed(function(Use)
				local ListValue: ListProps = Use(List) or {}
				local InProps = Use(Props.List) ~= nil

				if InProps and (Use(ListValue.Enabled) ~= false) then
					return Scope:New "UIListLayout" {
						Padding = ListValue.Padding,
						FillDirection = ListValue.FillDirection,
						SortOrder = ListValue.SortOrder,
						Wraps = ListValue.Wraps,
						HorizontalAlignment = ListValue.HorizontalAlignment,
						HorizontalFlex = ListValue.HorizontalFlex,
						ItemLineAlignment = ListValue.ItemLineAlignment,
						VerticalAlignment = ListValue.VerticalAlignment,
						VerticalFlex = ListValue.VerticalFlex,
					}
				end
			end),
			Scope:Computed(function(Use)
				local GridValue = Use(Grid) or {}
				local InProps = Use(Props.Grid) ~= nil

				if InProps and (Use(GridValue.Enabled) ~= false) then
					return Scope:New "UIGridLayout" {
						CellPadding = GridValue.CellPadding,
						CellSize = GridValue.CellSize,
						FillDirection = GridValue.FillDirection,
						FillDirectionMaxCells = GridValue.FillDirectionMaxCells,
						SortOrder = GridValue.SortOrder,
						StartCorner = GridValue.StartCorner,
						HorizontalAlignment = GridValue.HorizontalAlignment,
						VerticalAlignment = GridValue.VerticalAlignment,
					}
				end
			end),
			Scope:Computed(function(Use)
				local TableValue = Use(Table) or {}
				local InProps = Use(Props.Table) ~= nil

				if InProps and (Use(TableValue.Enabled) ~= false) then
					return Scope:New "UITableLayout" {
						Padding = TableValue.Padding,
						FillEmptySpaceColumns = TableValue.FillEmptySpaceColumns,
						FillEmptySpaceRows = TableValue.FillEmptySpaceRows,
						FillDirection = TableValue.FillDirection,
						SortOrder = TableValue.SortOrder,
						MajorAxis = TableValue.MajorAxis,
						HorizontalAlignment = TableValue.HorizontalAlignment,
						VerticalAlignment = TableValue.VerticalAlignment,
					}
				else
					return
				end
			end),
			Scope:Computed(function(Use)
				local PageValue = Use(Page) or {}
				local InProps = Use(Props.Page) ~= nil

				if InProps and (Use(PageValue.Enabled) ~= false) then
					return Scope:New "UIPageLayout" {
						Animated = PageValue.Animated,
						Circular = PageValue.Circular,
						EasingDirection = PageValue.EasingDirection,
						EasingStyle = PageValue.EasingStyle,
						Padding = PageValue.Padding,
						TweenTime = PageValue.TweenTime,
						FillDirection = PageValue.FillDirection,
						SortOrder = PageValue.SortOrder,
						HorizontalAlignment = PageValue.HorizontalAlignment,
						VerticalAlignment = PageValue.VerticalAlignment,
						GamepadInputEnabled = PageValue.GamepadInputEnabled,
						ScrollWheelInputEnabled = PageValue.ScrollWheelInputEnabled,
						TouchInputEnabled = PageValue.TouchInputEnabled,
					}
				end
			end),
			Scope:Computed(function(Use)
				local FlexValue = Use(Props.Flex) or {}
				local InProps = Use(Props.Flex) ~= nil

				if InProps and (Use(FlexValue.Mode) ~= Enum.UIFlexMode.None) then
					return Scope:New "UIFlexItem" {
						FlexMode = FlexValue.Mode,
						FlexItemLineAlignment = FlexValue.ItemLineAlignment,
						FlexGrowRatio = FlexValue.GrowRatio,
						FlexShrinkRatio = FlexValue.ShrinkRatio,
					}
				end
			end),

			Props[Children],
		},
	}
end
