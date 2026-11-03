{self, ...}: {
  flake = {
    nixosModules.editorNeovim = {pkgs, ...}: {
      environment = {
        systemPackages = [self.packages.${pkgs.stdenv.hostPlatform.system}.neovim];
        variables.EDITOR = "nvim";
      };
    };

    wrappers.neovim = {
      wlib,
      pkgs,
      ...
    }: {
      imports = [wlib.wrapperModules.neovim];
      specs = {
        general = with pkgs.vimPlugins; [
          autoclose-nvim
          blink-cmp
          blink-ripgrep-nvim
          bufferline-nvim
          cellular-automaton-nvim
          claudecode-nvim
          conform-nvim
          crates-nvim
          direnv-vim
          duck-nvim
          FixCursorHold-nvim
          gitsigns-nvim
          lazydev-nvim
          lualine-nvim
          lze
          lzextras
          mini-map
          neotest
          neotest-plenary
          neotest-python
          neotest-rust
          neo-tree-nvim
          noice-nvim
          nui-nvim
          nvim-coverage
          nvim-cursorline
          nvim-dap
          nvim-dap-python
          nvim-dap-lldb
          nvim-dap-go
          nvim-dap-ui
          nvim-lint
          nvim-lspconfig
          nvim-navic
          nvim-nio
          nvim-surround
          nvim-treesitter.withAllGrammars
          nvim-web-devicons
          pentatonic-nvim
          persistence-nvim
          plenary-nvim
          rose-pine
          rustaceanvim
          snacks-nvim
          tacho-nvim
          tiny-inline-diagnostic-nvim
          todo-comments-nvim
          typescript-tools-nvim
          vim-sleuth
          which-key-nvim
        ];

        lazy = {
          lazy = true;
          data = with pkgs.vimPlugins; [
            lazygit-nvim
            orgmode
            render-markdown-nvim
          ];
        };
      };

      runtimePkgs = with pkgs; [
        # LSPs
        bash-language-server
        dockerfile-language-server
        gopls
        lua-language-server
        nil
        pyright
        sqls
        svelte-language-server
        tailwindcss-language-server
        vscode-langservers-extracted
        vscode-extensions.vadimcn.vscode-lldb
        yaml-language-server

        # Formatters
        alejandra
        golines
        stylua
        shfmt
        prettierd

        # Linters
        shellcheck
        statix
        stylelint
        eslint

        # Utilities
        deno
        fd
        gcc
        lazygit
        noto-fonts-color-emoji
        ripgrep
        tree-sitter
      ];
    };
  };
}
