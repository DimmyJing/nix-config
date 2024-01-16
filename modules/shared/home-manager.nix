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
      key_bindings = [
        {
	  key = "T";
	  mods = "Command";
	  chars = "\\x01c";
	}
        {
	  key = "W";
	  mods = "Command";
	  chars = "\\x01&";
	}
        {
	  key = "D";
	  mods = "Command";
	  chars = "\\x01%";
	}
        {
	  key = "D";
	  mods = "Command|Shift";
	  chars = "\\x01\"";
	}
        {
	  key = "Key1";
	  mods = "Command";
	  chars = "\\x011";
	}
        {
	  key = "Key2";
	  mods = "Command";
	  chars = "\\x012";
	}
        {
	  key = "Key3";
	  mods = "Command";
	  chars = "\\x013";
	}
        {
	  key = "Key4";
	  mods = "Command";
	  chars = "\\x014";
	}
        {
	  key = "Key5";
	  mods = "Command";
	  chars = "\\x015";
	}
        {
	  key = "Key6";
	  mods = "Command";
	  chars = "\\x016";
	}
        {
	  key = "Key7";
	  mods = "Command";
	  chars = "\\x017";
	}
        {
	  key = "Key8";
	  mods = "Command";
	  chars = "\\x018";
	}
        {
	  key = "Key9";
	  mods = "Command";
	  chars = "\\x019";
	}
        {
	  key = "H";
	  mods = "Control";
	  chars = "\\x01h";
	}
        {
	  key = "J";
	  mods = "Control";
	  chars = "\\x01j";
	}
        {
	  key = "K";
	  mods = "Control";
	  chars = "\\x01k";
	}
        {
	  key = "L";
	  mods = "Control";
	  chars = "\\x01l";
	}
        {
	  key = "Tab";
	  mods = "Control";
	  chars = "\\x01n";
	}
        {
	  key = "Tab";
	  mods = "Control|Shift";
	  chars = "\\x01p";
	}
      ];
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
    prefix = "C-a";
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
}
