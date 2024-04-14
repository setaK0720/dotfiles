-- ddc.vim 補完用プラグイン
local h = require("util.helper")
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
			"Shougo/ddc-source-lsp",
			"LumaKernel/ddc-source-file",
		},
		config = function()
			local patch_global = fn["ddc#custom#patch_global"]
			patch_global("ui", "pum")
			patch_global("sources",{
				"around",
				"file",
				"lsp",
			})
			patch_global("sourceOptions", {
				_ = {
					matchers = { "matcher_head" },
          				sorters = { "sorter_rank" },
          				ignoreCase = true,
          				minAutoCompleteLength = 1,
        			},
				lsp = {
					mark = "[L]",
					dup = "keep",
					keywordPattern = "[a-zA-Z0-9_À-ÿ$#\\-*]*",
          				forceCompletionPattern = [[\.\w*|:\w*|->\w*]],
          				sorters = { "sorter_lsp-kind", "sorter_rank" },
				},
				
			})

			fn["ddc#enable"]()
			 end,

	},
  {
    "Shougo/pum.vim",
    config = function()
      fn["pum#set_option"]({
        auto_select = true,
      })

        -- Insert
        local opts = { silent = true, noremap = true}
        h.imap("<C-n>", "<cmd>call pum#map#select_relative(+1)<CR>", opts)
        h.imap("<C-p>", "<cmd>call pum#map#select_relative(-1)<CR>", opts)
        h.imap("<C-y>", "<cmd>call pum#map#confirm()<CR>", opts)
        h.imap("<C-e>", "<cmd>call pum#map#cancel()<CR>", opts)
    end,
  },
	
	}

-- 前提プラグイン:denops.vim, pum.vim, ddc-around, ddc-file, ddc-matcher_head, ddc-sorter_rank, ddc-converter_remove_overlap
