local colorscheme = "onedark"
require("hlslens").setup()

require("user.onedark")
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
