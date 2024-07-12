{ config, pkgs, lib, ... }:

let
  fromGitHub = ref: repo: pkgs.vimUtils.buildVimPlugin {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };
in

{
  xsession = {
    enable = true;
    windowManager = {
      i3 = {
        enable = true;
      };
    };
  };

  fonts.fontconfig.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home = {
    activation = {
      linkDesktopApplications = {
        after = [ "writeBoundary" "createXdgUserDirectories" ];
        before = [ ];
        data = ''
          rm -rf ${config.xdg.dataHome}/"applications/home-manager"
          mkdir -p ${config.xdg.dataHome}/"applications/home-manager"
          cp -Lr ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/"applications/home-manager/"
        '';
      };
    };

    homeDirectory = "/home/hadius";
    username = "hadius";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.05"; # Please read the comment before changing.

    # The home.packages option allows you to install Nix packages into your
    # environment.
    packages = with pkgs; [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # hello
      # busybox
      # firefox
      air
      bison
      bun
      curl
      degit
      discord
      docker
      fzf
      git
      glab
      go
      go-swag
      google-chrome
      i3
      imagemagick
      jetbrains.goland
      kubelogin
      kubelogin-oidc
      kubernetes
      kubernetes-helm
      ncdu
      neovim
      nerdfonts
      nodejs_20
      obsidian
      postman
      protobuf
      ripgrep
      rustc
      rustup
      scrot
      starship
      templ
      turso-cli
      vscode
      wget
      zoxide
      # i3-rounded


      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

    sessionPath = [
      "$HOME/.local/bin"
    ];

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;
      # ".config/i3/config".source = ./i3/config;
      ".config/kitty/kitty.conf".source = ./kitty/kitty.conf;
      "Pictures/rick-morty.png".source = ./misc/rick-morty.png;
      ".local/bin/i3lock_blank" = {
        source = ./misc/i3lock_blank;
        executable = true;
      };

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. If you don't want to manage your shell through Home
    # Manager then you have to manually source 'hm-session-vars.sh' located at
    # either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/hadius/etc/profile.d/hm-session-vars.sh
    #
    sessionVariables = {
      # EDITOR = "nvim";
    };

    /* shellAliases = {
      hm = "home-manager";
      "..." = "cd ../..";
    }; */
  };

  nixpkgs.config.allowUnfree = true;
  manual.manpages.enable = false;

  programs = {
    # Let Home Manager install and manage itself.
    home-manager.enable = true;

    git = {
      enable = true;
      userEmail = "duonglhh1@vnpay.vn";
      userName = "duonglhh1";
    };

    neovim =
      let
        toLua = str: "lua << EOF\n${str}\nEOF\n";
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      in
      {
        enable = true;

        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraPackages = with pkgs; [
          lua-language-server
        ];

        plugins = with pkgs.vimPlugins; [
          # lsp
          {
            plugin = lsp-zero-nvim;
            config = toLuaFile ./nvim/plugin/lsp.lua;
          }

          # lsp support
          nvim-lspconfig
          mason-nvim
          mason-lspconfig-nvim
          (fromGitHub "HEAD" "jay-babu/mason-null-ls.nvim")

          # auto completion
          nvim-cmp
          cmp-buffer
          cmp-path
          cmp-nvim-lsp
          cmp-nvim-lua
          cmp_luasnip

          # snippets
          {
            plugin = luasnip;
            config = toLua "require(\"luasnip.loaders.from_vscode\").lazy_load()";
          }

          friendly-snippets

          # null-ls
          {
            plugin = none-ls-nvim;
            config = toLuaFile ./nvim/plugin/null-ls.lua;
          }

          # treesitter
          rainbow-delimiters-nvim
          nvim-ts-autotag
          nvim-treesitter-textobjects
          nvim-treesitter-context

          {
            plugin = nvim-ts-context-commentstring;
            config = toLua "require('nvim-treesitter.configs').setup {}";
          }

          {
            plugin = (nvim-treesitter.withPlugins (p: [
              p.tree-sitter-bash
              p.tree-sitter-cmake
              p.tree-sitter-comment
              p.tree-sitter-css
              p.tree-sitter-dockerfile
              p.tree-sitter-go
              p.tree-sitter-gomod
              p.tree-sitter-gowork
              p.tree-sitter-html
              p.tree-sitter-javascript
              p.tree-sitter-jsdoc
              p.tree-sitter-json
              p.tree-sitter-json5
              p.tree-sitter-lua
              p.tree-sitter-make
              p.tree-sitter-markdown
              p.tree-sitter-nix
              p.tree-sitter-org-nvim
              p.tree-sitter-proto
              p.tree-sitter-query
              p.tree-sitter-regex
              p.tree-sitter-rust
              p.tree-sitter-scss
              p.tree-sitter-sql
              p.tree-sitter-svelte
              p.tree-sitter-toml
              p.tree-sitter-tsx
              p.tree-sitter-typescript
              p.tree-sitter-vim
              p.tree-sitter-vue
              p.tree-sitter-yaml
              p.tree-sitter-zig
              p.tree-sitter-templ
            ]));
            config = toLuaFile ./nvim/plugin/treesitter.lua;
          }

          plenary-nvim
          nvim-web-devicons
          vim-fugitive
          {
            plugin = (fromGitHub "HEAD" "FabijanZulj/blame.nvim");
            config = toLua "require(\"blame\").setup()";
          }
          vim-wakatime

          {
            plugin = comment-nvim;
            config = toLua "require(\"Comment\").setup()";
          }

          {
            plugin = undotree;
            config = toLua "vim.keymap.set(\"n\", \"<leader>u\", vim.cmd.UndotreeToggle)";
          }

          {
            plugin = toggleterm-nvim;
            config = toLuaFile ./nvim/plugin/toggleterm.lua;
          }

          {
            plugin = presence-nvim;
            config = toLuaFile ./nvim/plugin/presence.lua;
          }

          {
            plugin = harpoon;
            config = toLuaFile ./nvim/plugin/harpoon.lua;
          }

          {
            plugin = lualine-nvim;
            config = toLuaFile ./nvim/plugin/lualine.lua;
          }

          {
            plugin = telescope-nvim;
            config = toLuaFile ./nvim/plugin/telescope.lua;
          }

          {
            plugin = nvim-autopairs;
            config = toLuaFile ./nvim/plugin/auto-pairs.lua;
          }

          {
            plugin = nvim-surround;
            config = toLua "require(\"nvim-surround\").setup({})";
          }

          {
            plugin = git-conflict-nvim;
            config = toLua "require(\"git-conflict\").setup()";
          }

          # dap
          nvim-dap

          # go
          {
            plugin = (fromGitHub "refs/heads/develop" "olexsmir/gopher.nvim");
            config = toLua "require(\"gopher\").setup()";
          }

          {
            plugin = nvim-dap-go;
            config = toLua "require(\"dap-go\").setup()";
          }

          # rust
          {
            plugin = crates-nvim;
            config = toLuaFile ./nvim/plugin/crates.lua;
          }

          # theme
          {
            plugin = rose-pine;
            config = toLua "vim.cmd(\"colorscheme rose-pine\")";
          }

          (fromGitHub "HEAD" "LunarVim/onedarker.nvim")
          onedark-nvim

          # netwr
          {
            plugin = (fromGitHub "HEAD" "prichrd/netrw.nvim");
            config = toLua "require(\"netrw\").setup({})";
          }
        ];

        extraLuaConfig = ''
          ${builtins.readFile ./options.lua}
        '';
      };

    vscode = {
      enable = true;

      /* extensions = with pkgs.vscode-extensions; [
        adpyke.codesnap
        bbenoist.nix
        bradlc.vscode-tailwindcss
        csstools.postcss
        dbaeumer.vscode-eslint
        dsznajder.es7-react-js-snippets
        eamodio.gitlens
        esbenp.prettier-vscode
        fivethree.vscode-svelte-snippets
        formulahendry.auto-rename-tag
        gitlab.gitlab-workflow
        gleam.gleam
        golang.go
        jnoortheen.nix-ide
        karunamurti.tera
        mhutchie.git-graph
        mrmlnc.vscode-scss
        ms-azuretools.vscode-docker
        ms-kubernetes-tools.vscode-kubernetes-tools
        njpwerner.autodocstring
        pkief.material-icon-theme
        redhat.vscode-yaml
        ritwickdey.liveserver
        rust-lang.rust-analyzer
        sleistner.vscode-fileutils
        stylelint.vscode-stylelint
        svelte.svelte-vscode
        tamasfe.even-better-toml
        vadimcn.vscode-lldb
        visualstudioexptteam.intellicode-api-usage-examples
        visualstudioexptteam.vscodeintellicode
        vitest.explorer
        vscodevim.vim
        vue.volar
        wakatime.vscode-wakatime
        yzhang.markdown-all-in-one
        zhuangtongfa.material-theme
        zxh404.vscode-proto3
      ]; */
    };

    starship = {
      enable = true;
    };

    zsh = {
      enable = true;
      history.extended = true;
      syntaxHighlighting.enable = true;
      initExtra = "
          [[ -s \"/home/hadius/.gvm/scripts/gvm\" ]] && source \"/home/hadius/.gvm/scripts/gvm\"\n
          export NVM_DIR=\"$HOME/.nvm\" \n
          [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"  # This loads nvm \n
          [ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\"  # This loads nvm bash_completion \n
      ";
      prezto = {
        enable = true;
        editor = {
          dotExpansion = true;
          promptContext = true;
        };
        pmodules = [
          "autosuggestions"
          "completion"
          "directory"
          "docker"
          "editor"
          "environment"
          "history"
          "prompt"
          "spectrum"
          "terminal"
          "utility"
        ];
      };
      zplug = {
        enable = true;

        plugins = [
          {
            name = "zsh-users/zsh-syntax-highlighting";
          }
          {
            name = "zimfw/k";
          }
          {
            name = "zimfw/git";
          }
        ];
      };
    };

    zoxide = {
      enable = true;
    };
  };
}
