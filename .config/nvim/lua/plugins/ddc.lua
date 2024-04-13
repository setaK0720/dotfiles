

-- ddc.vim 補完用プラグイン
local fn = vim.fn

return {
	{
		"Shougo/ddc.vim",
		lazy = false,
		dependencies = {
			"vim-denops/denops.vim",
			"Shougo/pum.vim",
			"Shougo/ddc-ui-pum",
			"Shougo/ddc-source-around",
			"Shougo/ddc-filter-matcher_head",
      			"Shougo/ddc-filter-sorter_rank",
			"LumaKernel/ddc-source-file",
		},
		config = function()
			local patch_global = fn["ddc#custom#patch_global"]
			patch_global("ui", "pum")
			patch_global("sources",{
				"around",
				"file",
			})
			patch_global("sourceOptions", {
				_ = {
					matchers = { "matcher_head" },
          				sorters = { "sorter_rank" },
          				ignoreCase = true,
          				minAutoCompleteLength = 1,
        			},
			})

			fn["ddc#enable"]()
			 end,

	},
	
	}

-- 前提プラグイン:denops.vim, pum.vim, ddc-around, ddc-file, ddc-matcher_head, ddc-sorter_rank, ddc-converter_remove_overlap
