local fs = require("@lune/fs")
local serde = require("@lune/serde")

local function convertDependencies(pesdeDependencies)
	local wallyDependencies = {}

	for alias, dependency in pairs(pesdeDependencies) do
		if next(dependency) ~= nil then
			assert(dependency.name == nil, `Package relies on Pesde package.`)

			if dependency.wally and dependency.version then
				wallyDependencies[alias] = `{dependency.wally}@{dependency.version}`
			end
		end
	end

	return wallyDependencies
end

local function convertName(pesdeName)
	return string.gsub(string.gsub(pesdeName, "avafe/", "imavafe/"), "_", "-")
end

local function convertManifest(pesdeToml)
	local wallyInfo = {
		package = {
			name = convertName(pesdeToml.name),
			version = pesdeToml.version,

			license = pesdeToml.license,
			authors = pesdeToml.authors,

			registry = pesdeToml["wally_indices"].default,
			realm = "shared",
		},
		dependencies = convertDependencies(pesdeToml.dependencies),
	}

	return wallyInfo
end

local function convertProject(path: string)
	if fs.isFile(`{path}/pesde.toml`) then
		local pesdeToml = serde.decode("toml", fs.readFile(`{path}/pesde.toml`))
		local wallyToml = serde.encode("toml", convertManifest(pesdeToml), true)

		fs.writeFile(`{path}/wally.toml`, wallyToml)
	else
		assert(false, `pesde.toml does not exist for {path}`)
	end
end

convertProject(".")
