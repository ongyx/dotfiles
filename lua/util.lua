local cmd = vim.cmd

local function exec(command)
	cmd(command .. "\n")
end

return {
	exec = exec,
}
