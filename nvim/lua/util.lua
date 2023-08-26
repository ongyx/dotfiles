local function config(prefix, dest, src)
	prefix = prefix and prefix .. "_" or ""

	for k, v in pairs(src) do
		dest[prefix .. k] = v
	end
end

return {
	config = config,
}
