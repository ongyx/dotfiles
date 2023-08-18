return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- editing
	use "dense-analysis/ale"
	use { "neoclide/coc.nvim", branch = "release" }
	use "tpope/vim-sleuth"

	-- appearance
	use "lewis6991/gitsigns.nvim"
	use {
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update { with_sync = true }
			ts_update()
		end,
	}
	use "tpope/vim-surround"

	-- discord
	use "andweeb/presence.nvim"

	-- git
	use "tpope/vim-fugitive"

	-- themes
	use {
		"catppuccin/nvim",
		as = "catppuccin",
	}
	use {
		"samflores/vim-colors-paramount",
		branch = "lightline-colorscheme",
	}
	use "loctvl842/monokai-pro.nvim"
end)
