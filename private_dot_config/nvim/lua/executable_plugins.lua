
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

return require('lazy').setup({
  'lewis6991/impatient.nvim',
  
  'crusoexia/vim-monokai',

  'neovim/nvim-lspconfig',
  'nvim-lua/lsp_extensions.nvim',
  {'hrsh7th/cmp-nvim-lsp', branch = "main"},
  {'hrsh7th/cmp-buffer', branch = "main"},
  {'hrsh7th/cmp-path', branch = "main"},
  {'hrsh7th/nvim-cmp', branch = "main"},
  'ray-x/lsp_signature.nvim',
  'tamago324/nlsp-settings.nvim',
  'folke/lsp-colors.nvim',

  {'folke/trouble.nvim', config = function() 
    require("trouble").setup {
    --  auto_open = true,
    }
  end},

  {'folke/which-key.nvim', config = function()
    require("which-key").setup()
  end},

  {'simrat39/rust-tools.nvim', config = function() 
    local rstools = require('rust-tools')
	rstools.setup()
	rstools.inlay_hints.enable()
  end},


  'rust-lang/rust.vim',

  {
    'saecki/crates.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	  require('crates').setup()
	end,
  },

  'ziglang/zig.vim',

  'mfussenegger/nvim-dap',
  {'rcarriga/nvim-dap-ui', config = function() 
    require("dapui").setup()
  end},

  {
    'nvim-treesitter/nvim-treesitter',
    build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },

  'kyazdani42/nvim-web-devicons',

  {'akinsho/bufferline.nvim', dependencies = 'kyazdani42/nvim-web-devicons', config = function()
    require("bufferline").setup{
      options = {
        diagnostics = "nvim_lsp",
        indicator = {
          style = 'underline'
        },
      }
    }
  end},

  {"akinsho/toggleterm.nvim", config = function()
    require("toggleterm").setup()
  end},
  
  {'nvim-neo-tree/neo-tree.nvim', config = function() 
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true,
        },
        use_libuv_file_watcher = true,
        follow_current_file = false,
        hijack_netrw_behavior = "disabled",
      },
      window = {
        position = "right",
      }
    })
  end},

  'MunifTanjim/nui.nvim',

  'editorconfig/editorconfig-vim',

  'nanotee/zoxide.vim',

  'plasticboy/vim-markdown',

  {'petertriho/nvim-scrollbar', config = function()
    require("scrollbar").setup() 
  end},

  {'windwp/nvim-autopairs', config = function()
    require("nvim-autopairs").setup() 
  end},

  'nvim-lua/plenary.nvim',
  {'nvim-telescope/telescope.nvim', config = function()
    local tlscope = require('telescope')
    tlscope.setup{
      pickers = {
        find_files = {
          theme = "ivy"
        },
        live_grep = {
          theme = "ivy"
        },
		buffers = {
		  theme = "ivy"
		},
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    }
    tlscope.load_extension('fzf')
    tlscope.load_extension('lazygit')
	tlscope.load_extension('projects')
  end},

  {'nvim-telescope/telescope-fzf-native.nvim', 
    build = 'cmake -S. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
    }
  end},

  {'lewis6991/gitsigns.nvim', config = function()
    require("gitsigns").setup{
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "契"},
        changedelete = { text = "▎" },
      },
    }
  end},

  'tpope/vim-fugitive',

  -- Only because nvim-cmp _requires_ snippets
  {'hrsh7th/cmp-vsnip', branch = "main"},
  'hrsh7th/vim-vsnip',

  {'stevearc/stickybuf.nvim', config = function()
    require("stickybuf").setup{
      filetype = {
        trouble = "filetype",
        toggleterm = "filetype",
      },
    }
  end},

  'kdheepak/lazygit.nvim',

  'jose-elias-alvarez/null-ls.nvim',

  {'norcalli/nvim-colorizer.lua', config = function()
    require'colorizer'.setup()
  end},

  'j-hui/fidget.nvim',

  {'windwp/nvim-spectre', config = function() 
    require('spectre').setup({
      color_devicons = true,
      live_update = true,
    })
  end},

  {'nvim-lualine/lualine.nvim', config = function() 
    require('lualine').setup {
      options = { 
        theme = 'powerline',
        section_separators = '',
        component_separators = '|',
        disabled_filetypes = {'Trouble'},
      },
      sections = {
        lualine_c = {
          {
            'filename', 
            path = 1
          }
        },
      },
    }
  end},

  {
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup({
        cut_key = 'x',
        override_del = true,
      })
    end
  },
  
})
