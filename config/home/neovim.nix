{ config, pkgs, ... }:

let
  plugins = pkgs.vimPlugins;
  theme = config.colorScheme.palette;
in {
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    globals.mapleader = " "; # Sets the leader key to space
    
    options = {
      clipboard="unnamedplus";
      number = true;         # Show line numbers
      relativenumber = true; # Show relative line numbers
      shiftwidth = 2;        # Tab width should be 2
      softtabstop = 2;
      smartindent = true;
      wrap = false;
      swapfile = false;
      backup = false;
      hlsearch = false;
      incsearch = true;
      termguicolors = true;
      scrolloff = 8;
      updatetime = 50;
    };

    colorschemes.base16.enable = true;
    colorschemes.base16.colorscheme = {
      base00 = "#${theme.base00}";
      base01 = "#${theme.base01}";
      base02 = "#${theme.base02}";
      base03 = "#${theme.base03}";
      base04 = "#${theme.base04}";
      base05 = "#${theme.base05}";
      base06 = "#${theme.base06}";
      base07 = "#${theme.base07}";
      base08 = "#${theme.base08}";
      base09 = "#${theme.base09}";
      base0A = "#${theme.base0A}";
      base0B = "#${theme.base0B}";
      base0C = "#${theme.base0C}";
      base0D = "#${theme.base0D}";
      base0E = "#${theme.base0E}";
      base0F = "#${theme.base0F}";
    };
    
    plugins = {
      barbecue.enable = true;
      gitsigns = {
        enable = true;
	settings = {
	  linehl = true;
	  numhl = true;
	};
      };
      telescope = {
	enable = true;
	keymaps = {
	  "<leader>ff" = "find_files";
	};
      };
      neo-tree.enable = true;
      indent-blankline.enable = true;
      nvim-colorizer.enable = true;
      nvim-autopairs.enable = true;
      nix.enable = true;
      comment.enable = true;
      lualine = {
        enable = true;
      };
      startup = { 
	enable = true;
	theme = "dashboard";
      };
      lint = {
        enable = true;
        lintersByFt = {
          text = ["vale"];
          json = ["jsonlint"];
          markdown = ["vale"];
          rst = ["vale"];
          ruby = ["ruby"];
          janet = ["janet"];
          inko = ["inko"];
          clojure = ["clj-kondo"];
          dockerfile = ["hadolint"];
          terraform = ["tflint"];
          typscriptreact = ["prettier_eslint"];
        };
      };
      lsp = {
	enable = true;
        servers = {
          # Frontend
	  tsserver.enable = true;
          lua-ls.enable = true;          
	  html.enable = true;
          tailwindcss.enable = true;
	  cssls.enable = true;

          # Backend
	  rust-analyzer = {
	    enable = true;
	    installRustc = true;
	    installCargo = true;
          };
	  csharp-ls.enable = true;
	  cmake.enable = true;
	  gopls.enable = true;
	  jsonls.enable = true;
	  pyright.enable = true;
	  ccls.enable = true;

          # DevOps
	  nixd.enable = true;
	  bashls.enable = true;
	};
      };
      lsp-lines.enable = true;
      treesitter = {
        enable = true;
        indent = true;
        nixGrammars = true;
        nixvimInjections = true;
      };
      # nvim-cmp = {
        # enable = true;
        # autoEnableSources = true;
        # sources = [
        #   { name = "nvim_lsp"; }
        #   { name = "path"; }
        #   { name = "buffer"; }
        # ];
        # mapping = {
        #  "<CR>" = "cmp.mapping.confirm({ select = true })";
        #  "<Tab>" = {
        #    action = ''cmp.mapping.select_next_item()'';
        #    modes = [ "i" "s" ];
        #  };
        #};
      #};
    };

    # FOR NEOVIDE
    extraConfigLua = ''
      vim.opt.guifont = "JetBrainsMono\\ NFM,Noto_Color_Emoji:h12"
      
      vim.g.neovide_scale_factor = 1.0
      local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
      end
      vim.keymap.set("n", "<C-+>", function()
        change_scale_factor(1.25)
      end)
      vim.keymap.set("n", "<C-_>", function()
        change_scale_factor(1/1.25)
      end)

      vim.g.neovide_cursor_animation_length = 0.05
      vim.g.neovide_fullscreen = false
      vim.g.neovide_transparency = 0.95
      local colors = {
        blue   = '#${theme.base0D}',
        cyan   = '#${theme.base0C}',
        black  = '#${theme.base00}',
        white  = '#${theme.base05}',
        red    = '#${theme.base08}',
        violet = '#${theme.base0E}',
        grey   = '#${theme.base02}',
      }

      local bubbles_theme = {
        normal = {
          a = { fg = colors.black, bg = colors.violet },
          b = { fg = colors.white, bg = colors.grey },
          c = { fg = colors.black, bg = colors.black },
        },

        insert = { a = { fg = colors.black, bg = colors.blue } },
        visual = { a = { fg = colors.black, bg = colors.cyan } },
        replace = { a = { fg = colors.black, bg = colors.red } },

        inactive = {
          a = { fg = colors.white, bg = colors.black },
          b = { fg = colors.white, bg = colors.black },
          c = { fg = colors.black, bg = colors.black },
        },
      }

      require('lualine').setup {
        options = {
          theme = bubbles_theme,
          component_separators = '|',
          section_separators = { left = '', right = '' },
        },
        sections = {
          lualine_a = {
            { 'mode', separator = { left = '' }, right_padding = 2 },
          },
          lualine_b = { 'filename', 'branch' },
          lualine_c = { 'fileformat' },
          lualine_x = {},
          lualine_y = { 'filetype', 'progress' },
          lualine_z = {
            { 'location', separator = { right = '' }, left_padding = 2 },
          },
        },
        inactive_sections = {
          lualine_a = { 'filename' },
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
      }
    '';

    extraConfigVim = ''
      set noshowmode
      inoremap jj <ESC>
    '';

    keymaps = [
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Neotree reveal right<CR>";
        options.silent = false;
      }
      {
        key = "<Tab>";
        action = ":bnext<CR>";
        options.silent = false;
      }
      {
        key = "<S-Tab>";
        action = ":bprev<CR>";
        options.silent = false;
      }
      {
        key = "<S><C-P>";
        action = "+";
        options.silent = false;
      }
      {
        mode = ["" "c"];
        key = "<C-+>";
        action = "function() change_scale_factor(1.025) end";
        options.silent = false;
      }
      {
        mode = ["" "c"];
        key = "<C-_>";
        action = "function() change_scale_factor(1/1.025) end";
        options.silent = false;
      }
      {
        mode = ["" "c"];
        key = "<C-BS>";
        action = "function() ResetGuiFont(1) end";
        options.silent = false;
      }
      {
        mode = ["n"];
        key = "<leader>y";
        action = "+y";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<leader>Y";
        action = "+yg_";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<leader>yy";
        action = "+yy";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<leader>p";
        action = "+p";
        options.silent = true;
      }
      {
        mode = ["n"];
        key = "<leader>P";
        action = "+P";
        options.silent = true;
      }
    ];
  };
 } 
