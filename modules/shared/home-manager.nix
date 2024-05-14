{ config, pkgs, lib, ... }:

{
  zsh = {
    enable = true;
    shellAliases = {
      update = "sh -c 'cd ~/Workspace/nix && git add . && darwin-rebuild switch --flake .' && source ~/.zshrc && sudo yabai --load-sa";
      src = "cd ~/Workspace";
      ls = "ls -G --color=auto";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "vi-mode" "extract" "safe-paste" "tmux" ];
    };
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./config;
        file = "p10k.zsh";
      }
    ];
    initExtra = ''
      export PATH="$HOME/.local/share/gem/ruby/3.1.0/bin:$PATH"
      export PATH="$HOME/go/bin:$PATH"
    '';
  };

  alacritty = {
    enable = true;
    settings = {
      font = {
        normal = {
          family = "MesloLGS NF";
          style = "Regular";
        };
        size = 20;
      };
      keyboard = {
	bindings = [
	  {
	    key = "T";
	    mods = "Command";
	    chars = "\\u0002c";
	  }
	  {
	    key = "W";
	    mods = "Command";
	    chars = "\\u0002&";
	  }
	  {
	    key = "D";
	    mods = "Command";
	    chars = "\\u0002%";
	  }
	  {
	    key = "D";
	    mods = "Command|Shift";
	    chars = "\\u0002\"";
	  }
	  {
	    key = "Key1";
	    mods = "Command";
	    chars = "\\u00021";
	  }
	  {
	    key = "Key2";
	    mods = "Command";
	    chars = "\\u00022";
	  }
	  {
	    key = "Key3";
	    mods = "Command";
	    chars = "\\u00023";
	  }
	  {
	    key = "Key4";
	    mods = "Command";
	    chars = "\\u00024";
	  }
	  {
	    key = "Key5";
	    mods = "Command";
	    chars = "\\u00025";
	  }
	  {
	    key = "Key6";
	    mods = "Command";
	    chars = "\\u00026";
	  }
	  {
	    key = "Key7";
	    mods = "Command";
	    chars = "\\u00027";
	  }
	  {
	    key = "Key8";
	    mods = "Command";
	    chars = "\\u00028";
	  }
	  {
	    key = "Key9";
	    mods = "Command";
	    chars = "\\u00029";
	  }
	  {
	    key = "H";
	    mods = "Control";
	    chars = "\\u0002h";
	  }
	  {
	    key = "J";
	    mods = "Control";
	    chars = "\\u0002j";
	  }
	  {
	    key = "K";
	    mods = "Control";
	    chars = "\\u0002k";
	  }
	  {
	    key = "L";
	    mods = "Control";
	    chars = "\\u0002l";
	  }
	  {
	    key = "Tab";
	    mods = "Control";
	    chars = "\\u0002n";
	  }
	  {
	    key = "Tab";
	    mods = "Control|Shift";
	    chars = "\\u0002p";
	  }
	];
      };
    };
  };

  tmux = {
    enable = true;
    plugins = with pkgs.tmuxPlugins; [
      # vim-tmux-navigator
      sensible
      # yank
      prefix-highlight
      {
        plugin = power-theme;
        extraConfig = ''
           set -g @tmux_power_theme 'gold'
        '';
      }
    ];
    baseIndex = 1;
    mouse = true;
    historyLimit = 50000;
    extraConfig = ''
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };

  git = {
    enable = true;
    userName = "Jimmy Ding";
    userEmail = "jimmyguding@gmail.com";
    lfs = {
      enable = true;
    };
    extraConfig = {
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };

  neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };

  atuin = {
    enable = true;
    enableZshIntegration = true;
    flags = [ "--disable-up-arrow" ];
    # settings = {
      # keymap_mode = "vim";
      # enter_accept = true;
    # };
  };
}
