local Workspace = game:GetService("Workspace")

local ViewportSize = {
	Size = Vector2.new(),
	SizeListener = nil,
	Observers = {},
}

function ViewportSize:Observe(Callback: (Vector2) -> ())
	table.insert(ViewportSize.Observers, Callback)
	Callback(ViewportSize.Size)
end

function ViewportSize:_SetSize(Size: Vector2)
	ViewportSize.Size = Size

	for _, Callback in ViewportSize.Observers do
		Callback(Size)
	end
end

function ViewportSize:_SetCamera(Camera: Camera)
	if ViewportSize.SizeListener ~= nil then
		ViewportSize.SizeListener:Disconnect()
	end

	ViewportSize:_SetSize(Camera.ViewportSize)

	ViewportSize.SizeListener = Camera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
		ViewportSize:_SetSize(Camera.ViewportSize)
	end)
end

Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	ViewportSize:_SetCamera(Workspace.CurrentCamera)
end)

ViewportSize:_SetCamera(Workspace.CurrentCamera)

return ViewportSize
