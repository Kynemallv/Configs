vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  use {
    'olivercederborg/poimandres.nvim',
    config = function()
    require('poimandres').setup {}
    vim.cmd('colorscheme poimandres')
  end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end
  }
  use 'nvim-treesitter/nvim-treesitter-context'

  use('ray-x/lsp_signature.nvim')

  use{
    'mbbill/undotree',
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use('lukas-reineke/indent-blankline.nvim')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
  }

  use {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup { icons = false }
    end
  }

  use {
    'ray-x/go.nvim',
    config = function()
      require('go').setup({
        diagnostic = {
          update_in_insert = true,
          virtural_text = { space = 0, prefix = '●' },
          signs = true
        },
        lsp_document_formatting = true,
        lsp_inlay_hints = {
          enable = true,
          show_variable_name = true,
          parameter_hints_prefix = " ",
          show_parameter_hints = true,
          other_hints = false,
          highlight = "Comment"
        },
        icons = false
      })
    end
  }
  use 'ray-x/guihua.lua'

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup({
        enable_check_bracket_line = false,
        ignored_next_char = "[%w%.%\"%\'%&]"
    })
    end
  }
end)
