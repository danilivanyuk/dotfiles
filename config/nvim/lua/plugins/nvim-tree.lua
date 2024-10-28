-- File Explorer / Tree
return {
  -- https://github.com/nvim-tree/nvim-tree.lua
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons', -- Fancy icon support
  },
  opts = {
    actions = {
      open_file = {
        quit_on_open = true,
      },
    },
    sort = {
      sorter = 'case_sensitive',
    },
    view = {
      width = 30,
      relativenumber = true,
    },
    renderer = {
      group_empty = true,
      highlight_git = true,
      indent_markers = { enable = true },
      icons = {
        glyphs = {
          default = '󰈚',
          folder = {
            default = '',
            empty = '',
            empty_open = '',
            open = '',
            symlink = '',
          },
          git = { unmerged = '' },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = {
        'node_modules/.*',
      },
    },
    log = {
      enable = true,
      truncate = true,
      types = {
        diagnostics = true,
        git = true,
        profile = true,
        watcher = true,
      },
    },
  },
  config = function (_, opts)
    -- Recommended settings to disable default netrw file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup(opts)
  end
}

