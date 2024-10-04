{ config, pkgs, inputs, ... }:{
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
    ];
      extraLuaConfig = ''
      package.path = "/home/rodrigo/.config/nvim/?.lua;" .. package.path;
      require("old_init")
      
      ''; 
      plugins = [pkgs.vimPlugins.base16-nvim pkgs.vimPlugins.image-nvim];
    };
 
    home.file.".config/nvim/" = {
       source = ../nvim;
       recursive=true;
     };

    home.file.".config/nvim/lua/custom/plugins/image.lua" = {
      text = ''return {
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

  
}
