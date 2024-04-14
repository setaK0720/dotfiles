return 
{
	{
	"stevearc/oil.nvim",
	opts = {
		keymaps = {
			 ["-"] = "actions.parent",
			 ["g."] = "actions.toggle_hidden",
			 ["q"] = "actions.close",
			 ["g?"] = "actions.show_help",
			 ["`"] = "actions.cd",
			 ["<leader>b"] = "actions.open_external",
		 },
	},
	-- Optional dependencies
	dependencies = {"nvim-tree/nvim-web-devicons"},
	},
}
