return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- editing
	use "alvan/vim-closetag"
	use "dense-analysis/ale"
	use { "neoclide/coc.nvim", branch = "release" }
	use "tpope/vim-sleuth"
	use {
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end,
	}

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

	-- git
	use "tpope/vim-fugitive"

	-- themes
	use {
		"catppuccin/nvim",
		as = "catppuccin",
	}
	use "cocopon/iceberg.vim"
	use {
		"folke/tokyonight.nvim",
		branch = "main",
	}
	use {
		"samflores/vim-colors-paramount",
		branch = "lightline-colorscheme",
	}
end)
