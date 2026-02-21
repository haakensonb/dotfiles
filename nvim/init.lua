require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = "nord"
local env_var_nvim_theme = os.getenv("NVIM_THEME") or default_color_scheme

-- Define a table of theme modules
local themes = {
	nord = "plugins.themes.nord",
}

require("lazy").setup({
	spec = {
		require(themes[env_var_nvim_theme]),
		-- (Windows) Neotree dependency 'hererocks' needs 'python' installed and on the PATH or will silently fail build
		require("plugins.neotree"),
		require("plugins.bufferline"),
		require("plugins.lualine"),
		require("plugins.treesitter"),
		require("plugins.telescope"),
		-- Node/npm must be installed and on the PATH
		require("plugins.lsp"),
		require("plugins.autocompletion"),
		require("plugins.autoformatting"),
		require("plugins.gitsigns"),
		-- Start screen
		require("plugins.alpha"),
		-- Show indent lines
		require("plugins.indent-blanklines"),
		require("plugins.misc"),
		require("plugins.custom-debug"),
	},

	rocks = { hererocks = true },
})
