return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"

	-- Languages
	use "dense-analysis/ale"
	use {
		"neoclide/coc.nvim",
		branch = "release",
	}
	use "sheerun/vim-polyglot"

	-- UI
	use "alvan/vim-closetag"
	use "ervandew/supertab"
	use "itchyny/lightline.vim"
	use "justinmk/vim-sneak"
	use "kyazdani42/nvim-tree.lua"
	use "kyazdani42/nvim-web-devicons"
	use "maximbaz/lightline-ale"
	use "tpope/vim-unimpaired"
	use "tpope/vim-capslock"
	use "tpope/vim-surround"

	-- Git
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
