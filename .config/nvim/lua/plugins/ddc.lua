-- ddc.vim 補完用プラグイン
return {
	{
		"Shougo/ddc.vim",
		lazy = false,
		dependencies = {
			"vim-denops/denops.vim",
			"Shougo/pum.vim",
			"Shougo/ddc-source-around",
		},
	},
	}

-- 前提プラグイン:denops.vim, pum.vim, ddc-around, ddc-file, ddc-matcher_head, ddc-sorter_rank, ddc-converter_remove_overlap
