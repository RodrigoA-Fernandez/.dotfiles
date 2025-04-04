{ config, pkgs, inputs, ... }: {
  programs.neovim = {
    enable = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = [
      pkgs.imagemagick
      pkgs.tree-sitter
      pkgs.marksman
      pkgs.lua-language-server
      pkgs.stylua
      pkgs.luajitPackages.luarocks-nix
      pkgs.imagemagickBig
      pkgs.nil
      pkgs.rust-analyzer
      pkgs.lldb_18
      pkgs.nixd
      pkgs.nixfmt
      pkgs.cargo
      pkgs.rustc
    ];
    extraLuaConfig = ''
      package.path = "/home/rodrigo/.config/nvim/?.lua;" .. package.path;
      require("old_init")

    '';
    plugins = [
      pkgs.vimPlugins.base16-nvim
      pkgs.vimPlugins.image-nvim
      pkgs.vimPlugins.rustaceanvim
      pkgs.vimPlugins.sniprun
    ];
  };

  home.file.".config/nvim/" = {
    source = ../nvim;
    recursive = true;
  };

  home.file.".config/nvim/lua/custom/plugins/image.lua" = {
    text = ''
        if vim.g.neovide then
          return {}
        end
        return {
          {
          '3rd/image.nvim',
          dir = "${pkgs.vimPlugins.image-nvim}",
      config = function()
        package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?/init.lua'
        package.path = package.path .. ';' .. vim.fn.expand '$HOME' .. '/.luarocks/share/lua/5.1/?.lua'
        require('image').setup {
          backend = 'kitty',
          kitty_method = 'normal',
          integrations = {
            markdown = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = true,
              filetypes = { 'markdown', 'vimwiki'},
            },
            neorg = {
              enabled = true,
              clear_in_insert_mode = false,
              download_remote_images = true,
              only_render_image_at_cursor = false,
              filetypes = { 'norg' },
            },
            html = {
              enabled = true,
            },
            css = {
              enabled = true,
            },
          },
          max_width = nil,
          max_height = nil,
          max_width_window_percentage = nil,

          max_height_window_percentage = 40,

          window_overlap_clear_enabled = false,
          window_overlap_clear_ft_ignore = { 'cmp_menu', 'cmp_docs', "" },


          tmux_show_only_in_active_window = true,

          hijack_file_patterns = { '*.png', '*.jpg', '*.jpeg', '*.gif', '*.webp', '*.avif' },
        }

      end,
          }
        }'';
  };

  home.file.".config/nvim/lua/custom/plugins/markdownPreview.lua" = {
    text = ''
      return{{
        'iamcco/markdown-preview.nvim',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
        ft = { 'markdown' },
        dir = "${pkgs.vimPlugins.markdown-preview-nvim}",
        init = function()
          vim.g.mkdp_filetypes = { 'markdown' }
        end,
        config = function()
          vim.g['mkdp_preview_options'].katex = {
            macros = {
              ['\\R'] = '\\mathbb{R}',
            },
          }
          vim.g['mkdp_auto_start'] = 1
          vim.g['mkdp_auto_close'] = 0
        end,
      },
      }'';
  };

  home.file.".config/nvim/lua/custom/plugins/rustacean.lua" = {
    text = ''
      return {
        'mrcjkb/rustaceanvim',
        dir = "${pkgs.vimPlugins.rustaceanvim}",
        version = '^5', -- Recommended
        lazy = false,
        ft = { 'rust' },
      }
    '';
  };

  home.file.".config/nvim/lua/custom/plugins/typescript.lua" = {
    text = ''
      return {
        'pmizio/typescript-tools.nvim',
        dir = "${pkgs.vimPlugins.typescript-tools-nvim}",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
      }
    '';
  };

  home.file.".config/nvim/lua/custom/plugins/markdown.lua" = {
    text = ''
      return {{
        'MeanderingProgrammer/render-markdown.nvim',
        dir = "${pkgs.vimPlugins.render-markdown-nvim}",
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
        opts = {
          latex = { enabled = false },
          
          },
        config = function()
            require('render-markdown').setup(opts)
        end,
      },
      }
    '';
  };

  # home.file.".config/nvim/lua/custom/plugins/sniprun.lua" = {
  #   text = ''
  #     return {
  #       'michaelb/sniprun',
  #       run = "sh ${pkgs.vimPlugins.sniprun}/install.sh 1",
  #       dir = "${pkgs.vimPlugins.sniprun}",
  #       binary_path="${pkgs.vimPlugins.sniprun}/target/release/sniprun",
  #       ft = {"r", "rmb"},
  #       config = function()
  #
  #             vim.print("AAA")
  #             require("sniprun").setup({
  #               display = {"TempFloatingWindow"},
  #               interpreter_options = {
  #                 R_original = {
  #                   use_on_filetypes =  {"rmb", "r"}
  #                 },
  #               },
  #             })
  #
  #             vim.api.nvim_set_keymap('v', '<leader>rs', '<Plug>SnipRun', {silent = true})
  #             vim.api.nvim_set_keymap('n', '<leader>rs', '<Plug>SnipRun', {silent = true})
  #             vim.api.nvim_set_keymap('n', '<leader>rf', '<Plug>SnipRunOperator', {silent = true})
  #       end,
  #     }
  #   '';
  # };
}
