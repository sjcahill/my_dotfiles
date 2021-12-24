-- :help options
-- neovim.io/doc/user/quickref.html#option-list

local options = {
	backup = false,	                        -- don't autocreate backup files
	clipboard = "unnamedplus",              -- allows neovim access to system clipboard and registers
	cmdheight = 2,                          -- more space in neovim cmdline when displaying messages
	completeopt = { "menuone", "noselect" },-- mostly for cmp (autocompletion)  
	conceallevel = 0,	                      -- allows `` to be visible in markdown files.
	fileencoding = "utf-8",	                -- encoding used for writing to files
	hlsearch = true,										    -- ignore case in search patterns
	mouse = "a",											      -- allows mouse interactions in neovim
	pumheight = 10,								  		    -- popup menu height
	showmode = false, 									    -- will display things like -- INSERT --
	showtabline = 2,										    -- always show tabs
	smartcase = true,								  		  -- allow for smart case
	smartindent = true,								  		-- allow for smart indentation
	splitbelow = true,										  -- force all horizontal splits to open below current window
	splitright = true,										  -- force all verticle splits to open to the right
	swapfile = false,										    -- God I hate swapfiles
	-- termguicolors,                    	  -- set term gui colors (most terminals support this)
	timeoutlen = 800,										    -- time to wait for a mapped sequence to complete (in ms)
	undofile = true,										    -- enable persistent undo
	updatetime = 300,                       -- faster completion (4000 ms by default)
	writebackup = false,										-- does not allow files being edited by other programs or was written during editing to be edited and written
	expandtab = true, 									    -- converts tabs to spaces
	shiftwidth = 2,										      -- number of spaces inserted for each indentation
	tabstop = 2,											      -- number of spaces to insert for a tab
	cursorline = true,										  -- highlight the current cursor line
	number = true, 									        -- set numbered lines
	relativenumber = false, 								-- use relative number lines
	numberwidth = 4,                        -- set column number width to 4 (this is default)
	signcolumn = "yes", 									  -- always show sign column, otherwise it shifts text each time
	wrap = false,				  					        -- disables line wrapping
	scrolloff = 8,									        -- scrolloffset set to 8
	sidescrolloff = 8,                      -- sets side scroll offset to 8
	guifont = "monospace:h14",
}  

vim.opt.shortmess:append "c"              -- Hide certain `ins-completion-menu` messages. Such as "match 1 of 2", "pattern not found"
vim.opt_global.shortmess:remove("F")

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Lua api functions for executing vimscript commands
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
