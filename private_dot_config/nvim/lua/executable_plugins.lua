
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'
  
  use 'crusoexia/vim-monokai'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'
  use {'hrsh7th/cmp-nvim-lsp', branch = "main"}
  use {'hrsh7th/cmp-buffer', branch = "main"}
  use {'hrsh7th/cmp-path', branch = "main"}
  use {'hrsh7th/nvim-cmp', branch = "main"}
  use 'ray-x/lsp_signature.nvim'
  use 'tamago324/nlsp-settings.nvim'
  use 'folke/lsp-colors.nvim'

  use {'folke/trouble.nvim', config = function() 
    require("trouble").setup {
    --  auto_open = true,
    }
  end}

  use {'folke/which-key.nvim', config = function()
    require("which-key").setup()
  end}

  use {'simrat39/rust-tools.nvim', config = function() 
    require('rust-tools').setup()
  end}

  use {
    'saecki/crates.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
	  require('crates').setup()
	end,
  }

  use 'ziglang/zig.vim'

  use 'mfussenegger/nvim-dap'
  use {'rcarriga/nvim-dap-ui', config = function() 
    require("dapui").setup()
  end}

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use 'kyazdani42/nvim-web-devicons'

  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons', config = function()
    require("bufferline").setup{
      options = {
        diagnostics = "nvim_lsp",
        indicator = {
          style = 'underline'
        },
      }
    }
  end}

  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  
  use {'nvim-neo-tree/neo-tree.nvim', config = function() 
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
  end}

  use 'MunifTanjim/nui.nvim'

  use 'editorconfig/editorconfig-vim'

  use 'justinmk/vim-sneak'

  use 'nanotee/zoxide.vim'

  use 'rust-lang/rust.vim'
  use 'plasticboy/vim-markdown'
  use 'edluffy/hologram.nvim'

  use {'petertriho/nvim-scrollbar', config = function()
    require("scrollbar").setup() 
  end}

  use {'windwp/nvim-autopairs', config = function()
    require("nvim-autopairs").setup() 
  end}

  use 'p00f/nvim-ts-rainbow'

  use 'nvim-lua/plenary.nvim'
  use {'nvim-telescope/telescope.nvim', config = function()
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
  end}

  use {'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'cmake -S. -Bbuild -DCMAKE_C_COMPILER=clang -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use {
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
  end}

  use {'lewis6991/gitsigns.nvim', config = function()
    require("gitsigns").setup{
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "契"},
        changedelete = { text = "▎" },
      },
    }
  end}

  use 'tpope/vim-fugitive'

  -- Only because nvim-cmp _requires_ snippets
  use {'hrsh7th/cmp-vsnip', branch = "main"}
  use 'hrsh7th/vim-vsnip'

  use {'stevearc/stickybuf.nvim', config = function()
    require("stickybuf").setup{
      filetype = {
        trouble = "filetype",
        toggleterm = "filetype",
      },
    }
  end}

  use 'kdheepak/lazygit.nvim'

  use {'norcalli/nvim-colorizer.lua', config = function()
    require'colorizer'.setup()
  end}

  use 'j-hui/fidget.nvim'

  use {'windwp/nvim-spectre', config = function() 
    require('spectre').setup({
      color_devicons = true,
      live_update = true,
    })
  end}

  use {'nvim-lualine/lualine.nvim', config = function() 
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
  end}

  use({
    "gbprod/cutlass.nvim",
    config = function()
      require("cutlass").setup({
        cut_key = 'x',
        override_del = true,
      })
    end
  })
  
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
