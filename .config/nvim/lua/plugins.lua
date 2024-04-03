local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = vim.fn.executable("tree-sitter"),
    build = ":TSUpdate",
    event = 'VeryLazy',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "cpp", "lua", "c" },
        ignore_install = { "json" },
        highlight = {
          enable = true,
          custom_captures = {
            ["punctuation.bracket"] = "",
            ["punctuation.delimiter"] = "",
            ["operator"] = "",
          },
        },
        indent = {
          enable = false,
        },
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup {
	ensure_installed = { "clangd" },
      }
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").clangd.setup {
	cmd = {
	  "clangd",
	  "--background-index",
	  "--header-insertion=iwyu",
	  "--completion-style=detailed",
	  "--function-arg-placeholders",
	  "--fallback-style=llvm",
	  "--clang-tidy",
	},
	filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
	commands = {
	  ClangdSwitchSourceHeader = {
	    function()
	      switch_source_header(0)
	    end,
	    description = 'Switch between source/header',
	  },
	},
	init_options = {
	  clangdFileStatus = true,
	  usePlaceholders = true,
	  completeUnimported = true,
	  semanticHighlighting = true,
	},
      }
    end,
    keys = {
      {
        '<Leader>n',
        vim.diagnostic.goto_next,
        desc = '[lsp] go to next diagnostic',
      },
      {
        '<Leader>N',
        vim.diagnostic.goto_prev,
        desc = '[lsp] go to previous diagnostic',
      },
    },
    on_attach = {
      vim.diagnostic.config({
	virtual_text = false,
	signs = true,
      }),
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
        callback = function ()
          vim.diagnostic.open_float(nil, {focus=false})
        end
      }),
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    commit = '353be59',
    config = function() 
      local palette = require('gruvbox.palette')
      local colors = palette.get_base_colors(vim.o.background, contrast)
      local soft_colors = palette.get_base_colors(vim.o.background, "soft")
      require'gruvbox'.setup{
        contrast = contrast,
        undercurl = true,
        underline = true,
        bold = false,
        italic = {
          strings = false,
          comments = false,
          operators = false,
          folds = false,
        },
        transparent_mode = false,
        overrides = {
          Todo = { fg = colors.fg0, bg = 'NONE' },

          -- ugly :/
          SignColumn = { bg = 'NONE' },
          GruvboxRedSign = { bg = 'NONE' },
          GruvboxGreenSign = { bg = 'NONE' },
          GruvboxYellowSign = { bg = 'NONE' },
          GruvboxBlueSign = { bg = 'NONE' },
          GruvboxPurpleSign = { bg = 'NONE' },
          GruvboxAquaSign = { bg = 'NONE' },
          GruvboxOrangeSign = { bg = 'NONE' },

          StatusLine = { bg = colors.bg1, fg = colors.fg1 },
          StatusLineNC = { bg = soft_colors.bg0, fg = colors.fg3 },
          -- use these with %1* and %2*
          User1 = { bg = colors.bg1, fg = colors.gray },
          User2 = { bg = colors.bg1, fg = colors.fg1 },

          -- fix highlighting with LSP
          ["@variable"] = { link = "Identifier" },
          ["@namespace"] = { link = "Identifier" },
          -- still not sure if I'm happy with this one :/
          ["@constructor"] = { link = "Structure" },

          manItalic = { link = "GruvboxGreen" },
          manBold = { link = "GruvboxRedBold" },
        },
      }
      vim.cmd[[colorscheme gruvbox]]
      vim.cmd[[highlight Cursor guifg=white]]
      vim.cmd[[highlight iCursor guifg=white]]
    end,
  }
}

require("lazy").setup(plugins, opts)
